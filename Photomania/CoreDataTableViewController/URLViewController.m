//
//  URLViewController.m
//  Photomania
//
//  Created by Denis C de Azevedo on 04/03/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "URLViewController.h"

@interface URLViewController ()
@property (weak, nonatomic) IBOutlet UITextView *urlTextView;
@end

@implementation URLViewController

- (void)setUrl:(NSURL *)url {
    _url = url;
    [self updateUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}

- (void)updateUI {
    self.urlTextView.text = [self.url absoluteString];
}

@end
