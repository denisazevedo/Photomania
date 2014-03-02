//
//  PhotomaniaAppDelegate.m
//  Photomania
//
//  Created by Denis C de Azevedo on 02/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "PhotomaniaAppDelegate.h"
#import "PhotomaniaAppDelegate+MOC.h"
#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "PhotoDatabaseAvailability.h"

@interface PhotomaniaAppDelegate() <NSURLSessionDownloadDelegate>
@property (copy, nonatomic) void(^flickrDownloadBackgroundURLSessionCompletionHandler)();
@property (strong, nonatomic) NSURLSession *flickrDownloadSession;
@property (strong, nonatomic) NSTimer *flickrForegroundFetchTimer;
@property (strong, nonatomic) NSManagedObjectContext *photoDatabaseContext;
@end

#define FLICKR_FETCH @"Flickr Just Uploaded Fetch"

#define FOREGROUND_FLICKR_FETCH_INTERVAL (20*60)

@implementation PhotomaniaAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.photoDatabaseContext = [self createMainQueueManagedObjectContext];
    [self startFlickrFetch];
    return YES;
}

- (void)setPhotoDatabaseContext:(NSManagedObjectContext *)photoDatabaseContext {
    _photoDatabaseContext = photoDatabaseContext;
    NSDictionary *userInfo = self.photoDatabaseContext ? @{PhotoDatabaseAvailabilityContext : self.photoDatabaseContext} : nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:PhotoDatabaseAvailabilityNotification
                                                        object:self
                                                      userInfo:userInfo];
}

- (void)startFlickrFetch {
    
    [self.flickrDownloadSession getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        if (![downloadTasks count]) {
            NSURLSessionDownloadTask *task = [self.flickrDownloadSession downloadTaskWithURL:[FlickrFetcher URLforRecentGeoreferencedPhotos]];
            task.taskDescription = FLICKR_FETCH;
            [task resume];
        } else {
            for (NSURLSessionDownloadTask *task in downloadTasks) [task resume];
        }
    }];
}

- (NSURLSession *)flickrDownloadSession {
    if (!_flickrDownloadSession) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSURLSessionConfiguration *urlSessionConfig = [NSURLSessionConfiguration backgroundSessionConfiguration:FLICKR_FETCH];
            urlSessionConfig.allowsCellularAccess = NO;
            _flickrDownloadSession = [NSURLSession sessionWithConfiguration:urlSessionConfig
                                                                   delegate:self
                                                              delegateQueue:nil];
        });
    }
    return _flickrDownloadSession;
}

- (NSArray *)flickrPhotosAtURL:(NSURL *)url {
    NSData *flickrJSONData = [NSData dataWithContentsOfURL:url];
    NSDictionary *flickrPropertyList = [NSJSONSerialization JSONObjectWithData:flickrJSONData
                                                                       options:0 error:NULL];
    return [flickrPropertyList valueForKeyPath:FLICKR_RESULTS_PHOTOS];
}

#pragma mark - NSURLSessionDownloadDelegate

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)localFile {

    if ([downloadTask.taskDescription isEqualToString:FLICKR_FETCH]) {
        NSManagedObjectContext *context = self.photoDatabaseContext;
        if (context) {
            NSArray *photos = [self flickrPhotosAtURL:localFile];
            [context performBlock:^{
                [Photo loadPhotosFromFlickrArray:photos intoManagedObjectContent:context];
                [context save:NULL];
            }];
        } else {
            [self flickrDownloadTasksMightBeCompleted];
        }
    }
}

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes {
    
}

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
}

- (void)flickrDownloadTasksMightBeCompleted {
    //TODO
}

@end
