//
//  PhotosByPhotographerImageViewController.h
//  Photomania
//
//  Created by Denis C de Azevedo on 05/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "ImageViewController.h"
#import "Photographer.h"

@interface PhotosByPhotographerImageViewController : ImageViewController

// our Model
// passed through to our embedded controller
@property (nonatomic, strong) Photographer *photographer;

@end
