//
//  PhotosByPhotographerCDTVC.h
//  Photomania
//
//  Created by Denis C de Azevedo on 03/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "PhotosCDTVC.h"
#import "Photographer.h"

// this class inherits the ability to display a Photo in its rows
// and the ability to navigate to show the Photo's image
// from it superclass PhotosCDTVC

@interface PhotosByPhotographerCDTVC : PhotosCDTVC

@property (nonatomic, strong) Photographer *photographer;

@end
