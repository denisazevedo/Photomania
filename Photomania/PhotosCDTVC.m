//
//  PhotosCDTVC.m
//  Photomania
//
//  Created by Denis C de Azevedo on 04/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "PhotosCDTVC.h"
#import "Photo.h"
#import "ImageViewController.h"

@implementation PhotosCDTVC

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Photo Cell"];

    Photo *photo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = photo.title;
    cell.detailTextLabel.text = photo.subtitle;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareViewController:(id)vc forSegue:(NSString *)segueIdentifier fromIndexPath:(NSIndexPath *)indexPath {
    
    Photo *photo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // note that we don't check the segue identifier here
    // could easily imagine two different segues to ImageViewController from this class
    // for example, one might apply some sort of sepia tone or something
    // but for now, we only have this one segue, so we'll not check the segue identifier
    if ([vc isKindOfClass:[ImageViewController class]]) {
        
        ImageViewController *ivc = (ImageViewController *)vc;
        ivc.imageURL = [NSURL URLWithString:photo.imageURL];
        ivc.title = photo.title;
    }
}

//boilerplate
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = nil;
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    [self prepareViewController:segue.destinationViewController forSegue:segue.identifier fromIndexPath:indexPath];
}

//boilerplate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if ([detailVC isKindOfClass:[UINavigationController class]]) {
        detailVC = [((UINavigationController *)detailVC).viewControllers firstObject];
        [self prepareViewController:detailVC forSegue:nil fromIndexPath:indexPath];
    }
}



@end
