//
//  PhotosByPhotographerCDTVC.h
//  Photomania
//
//  Created by Denis C de Azevedo on 03/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Photographer.h"
#import "PhotosCDTVC.h"

@interface PhotosByPhotographerCDTVC : PhotosCDTVC

@property (nonatomic, strong) Photographer *photographer;

@end
