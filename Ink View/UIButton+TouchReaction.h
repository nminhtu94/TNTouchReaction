#import <UIKit/UIKit.h>

#import "TNTouchReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TouchReaction)

- (void)setTouchReactionStyle:(TNTouchReactionStyle)style;

- (void)setTouchReactionDuration:(CGFloat)duration;

- (void)setTouchReactionColor:(UIColor *)reactionColor;

- (void)setTouchReactionOpacity:(CGFloat)opacity;

@end

NS_ASSUME_NONNULL_END
