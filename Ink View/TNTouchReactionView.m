#import "TNTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionView()

@property (nonatomic) TNTouchReactionAttributes *attributes;
@property (nonatomic, weak) UIView *appliedView;

@end

@implementation TNTouchReactionView

- (instancetype)initWithReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                               appliedView:(UIView *)appliedView {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    _attributes = touchReactionAttributes;
    _appliedView = appliedView;
  }
  return self;
}

- (void)animateIn {
  NSParameterAssert(NO);
}

- (void)animateOut {
  NSParameterAssert(NO);
}

- (TRReactionStyle)touchReactionStyle {
  return (TRReactionStyle)[[self.attributes valueForTouchReactionAttributeKey:
      kTouchReactionStyleAttribute] unsignedIntegerValue];
}

- (UIColor *)touchReactionColor {
  return [self.attributes valueForTouchReactionAttributeKey:kTouchReactionColorAttribute];
}

- (CGFloat)touchReactionDuration {
  return [[self.attributes valueForTouchReactionAttributeKey:
      kTouchReactionDurationAttribute] floatValue];
}

- (CGFloat)touchReactionRadius {
  return [[self.attributes valueForTouchReactionAttributeKey:
       kTouchReactionRadiusAttribute] floatValue];
}

- (CGFloat)touchReactionOpacity {
  return [[self.attributes valueForTouchReactionAttributeKey:
      kTouchReactionOpacityAttribute] floatValue];
}


@end

NS_ASSUME_NONNULL_END
