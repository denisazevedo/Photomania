//
//  PhotosByPhotographerImageViewController.m
//  Photomania
//
//  Created by Denis C de Azevedo on 05/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "PhotosByPhotographerImageViewController.h"
#import "PhotosByPhotographerMapViewController.h"

@interface PhotosByPhotographerImageViewController ()
@property (nonatomic, strong)PhotosByPhotographerMapViewController *mapVC;
@end

@implementation PhotosByPhotographerImageViewController

- (void)setPhotographer:(Photographer *)photographer {
    _photographer = photographer;
    self.title = photographer.name;
    self.mapVC.photographer = self.photographer;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[PhotosByPhotographerMapViewController class]]) {
        PhotosByPhotographerMapViewController *pbpmvc = (PhotosByPhotographerMapViewController *)segue.destinationViewController;
        pbpmvc.photographer = self.photographer;
        self.mapVC = pbpmvc;
    } else {
        [super prepareForSegue:segue sender:sender];
    }
}

@end
