//
//  PhotosCDTVC.h
//  Photomania
//
//  Created by Denis C de Azevedo on 04/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "CoreDataTableViewController.h"

@interface PhotosCDTVC : CoreDataTableViewController

// generic Photo displaying CDTVC
// hook up fetchedResultsController to any Photo fetch request
// use @"Photo Cell" as your table view cell's reuse id
// will segue to showing the image in an ImageViewController

@end
