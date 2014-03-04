//
//  PhotographersCDTVC.h
//  Photomania
//
//  Created by Denis C de Azevedo on 02/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "CoreDataTableViewController.h"

// will segue to a PhotosByPhotographerCDTVC
// use @"Photographer Cell" as your cells' reuse identifer

@interface PhotographersCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
