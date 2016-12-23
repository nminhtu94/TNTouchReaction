//
//  UIView+InkView.m
//  Ink View
//
//  Created by Nguyen Minh Tu on 12/23/16.
//  Copyright © 2016 codemaster. All rights reserved.
//

#import "UIView+InkTouch.h"

#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

static void *kInkViewColor = &kInkViewColor;

static void *kInkViewAnimationDuration = &kInkViewAnimationDuration;

static void *kInkViewTouchRadius = &kInkViewTouchRadius;

static UIView *inkView = nil;

@implementation UIView (InkTouch)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  UITouch *touch = [touches anyObject];
  [self createInkTouchFromTouch:touch];
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [self dismissInkTouch];
  [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *_Nullable)touches withEvent:(UIEvent *_Nullable)event {
  [self dismissInkTouch];
  [super touchesCancelled:touches withEvent:event];
}

- (void)createInkTouchFromTouch:(UITouch *)touch {
  CGPoint touchLocation = [touch locationInView:self];
  
  [inkView removeFromSuperview];
  inkView = [[UIView alloc] initWithFrame:CGRectZero];
  inkView.backgroundColor = self.inkColor;
  inkView.layer.opacity = 0.15f;
  inkView.center = touchLocation;
  
  [self addSubview:inkView];
  
  [UIView animateWithDuration:self.animationDuration animations:^{
    inkView.frame = CGRectMake(inkView.frame.origin.x - self.touchRadius / 2,
                               inkView.frame.origin.y - self.touchRadius / 2,
                               self.touchRadius, self.touchRadius);
    
    inkView.layer.cornerRadius = CGRectGetWidth(inkView.bounds) / 2;
    inkView.layer.cornerRadius = CGRectGetHeight(inkView.bounds) / 2;
  }];
}

- (void)dismissInkTouch {
  if (inkView) {
    [UIView animateWithDuration:self.animationDuration animations:^{
      inkView.layer.opacity = 0;
    } completion:^(BOOL finished) {
      [inkView removeFromSuperview];
    }];
  }
}

- (UIColor *)inkColor {
  UIColor *result = objc_getAssociatedObject(self, kInkViewColor);
  if (!result) {
    return [UIColor lightGrayColor];
  }
  return result;
}

- (CGFloat)animationDuration {
  NSNumber *result = objc_getAssociatedObject(self, kInkViewAnimationDuration);
  if (!result) {
    return 0.2f;
  }
  return [result floatValue];
}

- (CGFloat)touchRadius {
  NSNumber *result = objc_getAssociatedObject(self, kInkViewTouchRadius);
  if (!result) {
    return 50.0f;
  }
  return [result floatValue];
}

- (void)setInkDuration:(CGFloat)duration {
  objc_setAssociatedObject(self, kInkViewAnimationDuration, @(duration),
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setInkColor:(UIColor *)inkColor {
  objc_setAssociatedObject(self, kInkViewColor, inkColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setInkRadius:(CGFloat)radius {
  objc_setAssociatedObject(self, kInkViewTouchRadius, @(radius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

NS_ASSUME_NONNULL_END
