//
//  AddPhotoViewController.h
//  Photomania
//
//  Created by Denis C de Azevedo on 09/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photographer.h"
#import "Photo.h"

@interface AddPhotoViewController : UIViewController

//in
@property (nonatomic, strong) Photographer *photographerTakingPhoto;

//out
@property (nonatomic, strong) Photo *addedPhoto;

@end
