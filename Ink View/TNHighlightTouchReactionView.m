#import "TNHighlightTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TNHighlightTouchReactionView

- (instancetype)initWithTouchReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                                    appliedView:(UIView *)appliedView {
  self = [super initWithReactionAttributes:touchReactionAttributes appliedView:appliedView];
  if (self) {
    self.backgroundColor = self.touchReactionColor;
  }
  return self;
}

- (void)animateIn {
  self.frame = self.appliedView.bounds;
  self.layer.opacity = 0;
  [UIView animateWithDuration:self.touchReactionDuration animations:^{
    self.layer.opacity = self.touchReactionOpacity;
  }];
}

- (void)animateOut {
  [UIView animateWithDuration:self.touchReactionDuration animations:^{
    self.layer.opacity = 0;
  } completion:^(BOOL finished) {
    [self removeFromSuperview];
  }];
}

@end

NS_ASSUME_NONNULL_END
