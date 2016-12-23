//
//  UIView+InkView.h
//  Ink View
//
//  Created by Nguyen Minh Tu on 12/23/16.
//  Copyright © 2016 codemaster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (InkTouch)

- (void)setInkDuration:(CGFloat)duration;

- (void)setInkColor:(UIColor *)inkColor;

- (void)setInkRadius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
