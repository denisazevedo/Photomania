//
//  PhotosByPhotographerMapViewController.h
//  Photomania
//
//  Created by Denis C de Azevedo on 05/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photographer.h"

@interface PhotosByPhotographerMapViewController : UIViewController

// our Model
// we will show all photos by this photographer on a map
@property (nonatomic, strong) Photographer *photographer;

@end
