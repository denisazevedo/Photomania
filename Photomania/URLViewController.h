//
//  URLViewController.h
//  Photomania
//
//  Created by Denis C de Azevedo on 04/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import <UIKit/UIKit.h>

// displays the url
// it is not a popover-specific class in any way
// it would work in any environment
// (e.g. pushed in a navigation controller would work)

@interface URLViewController : UIViewController

@property (nonatomic, strong) NSURL *url;

@end
