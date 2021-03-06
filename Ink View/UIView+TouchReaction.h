#import <UIKit/UIKit.h>

#import "TRReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TouchReaction)

- (void)setTouchReactionEnabled:(BOOL)enabled;

- (void)setTouchReactionStyle:(TRReactionStyle)style;

- (void)setTouchReactionDuration:(CGFloat)duration;

- (void)setTouchReactionColor:(UIColor *)reactionColor;

- (void)setTouchReactionOpacity:(CGFloat)opacity;

@end

NS_ASSUME_NONNULL_END
