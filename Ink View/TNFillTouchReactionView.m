#import "TNFillTouchReactionView.h"

@interface TNFillTouchReactionView()

@end

@implementation TNFillTouchReactionView

- (instancetype)initWithTouchReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                                    appliedView:(UIView *)appliedView {
  self = [super initWithTouchReactionAttributes:touchReactionAttributes appliedView:appliedView];
  if (self) {
    self.backgroundColor = self.touchReactionColor;
    self.layer.opacity = self.touchReactionOpacity;
  }
  return self;
}

- (void)animateIn {
  self.frame = CGRectMake(CGRectGetWidth(self.appliedView.bounds) / 2,
                          0,
                          1, CGRectGetHeight(self.appliedView.bounds));
  [UIView animateWithDuration:self.touchReactionDuration animations:^{
    self.frame = self.appliedView.bounds;
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
