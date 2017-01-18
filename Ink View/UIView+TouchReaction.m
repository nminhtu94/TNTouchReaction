#import "UIView+TouchReaction.h"

#import "TRTouchReceiverView.h"

#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

/// ObjC associated key for @c TNTouchReactionAttributes object.
static void *kTouchReactionView = &kTouchReactionView;

@implementation UIView (TouchReaction)

- (TRTouchReceiverView *)touchReceiverView {
  TRTouchReceiverView *receiverView = objc_getAssociatedObject(self, kTouchReactionView);
  if (receiverView == nil) {
    receiverView = [[TRTouchReceiverView alloc] initWithView:self];
    objc_setAssociatedObject(self, kTouchReactionView, receiverView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return receiverView;
}

#pragma mark - Setter

- (void)setTouchReactionEnabled:(BOOL)enabled {
  if (enabled) {
    [self addSubview:[self touchReceiverView]];
  } else {
    [[self touchReceiverView] removeFromSuperview];
  }
}

- (void)setTouchReactionStyle:(TRReactionStyle)style {
  [[self touchReceiverView] setTouchReactionStyle:style];
}

- (void)setTouchReactionDuration:(CGFloat)duration {
  [[self touchReceiverView] setTouchReactionDuration:duration];
}

- (void)setTouchReactionColor:(UIColor *)reactionColor {
  [[self touchReceiverView] setTouchReactionColor:reactionColor];
}

- (void)setTouchReactionOpacity:(CGFloat)opacity {
  [[self touchReceiverView] setTouchReactionOpacity:opacity];
}

@end

NS_ASSUME_NONNULL_END
