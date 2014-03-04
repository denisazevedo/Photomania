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
    if ([vc isKindOfClass:[ImageViewController class]]) {
        
        ImageViewController *ivc = (ImageViewController *)vc;
        ivc.imageURL = [NSURL URLWithString:photo.imageURL];
        ivc.title = photo.title;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = nil;
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    [self prepareViewController:segue.destinationViewController forSegue:segue.identifier fromIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if ([detailVC isKindOfClass:[UINavigationController class]]) {
        detailVC = [((UINavigationController *)detailVC).viewControllers firstObject];
        [self prepareViewController:detailVC forSegue:nil fromIndexPath:indexPath];
    }
}



@end
