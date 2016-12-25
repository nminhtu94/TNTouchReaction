#import <UIKit/UIKit.h>

#import "TNTouchReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TouchReaction)

- (void)setTouchReactionStyle:(TNTouchReactionStyle)style;

- (void)setTouchReactionDuration:(CGFloat)duration;

- (void)setTouchReactionColor:(UIColor *)reactionColor;

@end

NS_ASSUME_NONNULL_END
