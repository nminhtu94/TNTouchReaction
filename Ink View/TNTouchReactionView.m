#import "TNTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionView()

@property (nonatomic) TNTouchReactionAttributes *attributes;
@property (nonatomic, weak) UIView *appliedView;

@property (nonatomic, assign) TNTouchReactionStyle touchReactionStyle;
@property (nonatomic) CGFloat touchReactionDuration;
@property (nonatomic) UIColor *touchReactionColor;
@property (nonatomic) CGFloat touchReactionRadius;
@property (nonatomic, assign) CGFloat touchReactionOpacity;

@end

@implementation TNTouchReactionView

- (instancetype)initWithTouchReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                                    appliedView:(UIView *)appliedView {
  self = [super initWithFrame:CGRectZero];
  if (self) {
    _attributes = touchReactionAttributes;
    _appliedView = appliedView;
  }
  return self;
}

- (void)animateIn { }

- (void)animateOut { }

- (TNTouchReactionStyle)touchReactionStyle {
  return (TNTouchReactionStyle)[[self.attributes valueForTouchReactionAttributeKey:
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
