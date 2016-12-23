//
//  ViewController.m
//  Ink View
//
//  Created by Nguyen Minh Tu on 12/23/16.
//  Copyright © 2016 codemaster. All rights reserved.
//

#import "ViewController.h"

#import "UIView+InkTouch.h"

@interface ViewController ()

@property (nonatomic) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.testView = [[UIView alloc] initWithFrame:CGRectZero];
  [self.testView setInkDuration:0.2];
  [self.view addSubview:self.testView];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  self.testView.frame = self.view.bounds;
}

@end
