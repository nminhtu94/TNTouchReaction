#import "TNCircularTouchReactionView.h"

@interface TNCircularTouchReactionView()

@end

@implementation TNCircularTouchReactionView

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
  [UIView animateWithDuration:0 animations:^{
    self.frame = CGRectMake(self.frame.origin.x - self.touchReactionRadius / 2,
                            self.frame.origin.y - self.touchReactionRadius / 2,
                            self.touchReactionRadius, self.touchReactionRadius);

    self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
    self.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
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
