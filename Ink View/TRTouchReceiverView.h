#import <UIKit/UIKit.h>

#import "TRReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRTouchReceiverView : UIView

- (instancetype)initWithView:(UIView *)view NS_DESIGNATED_INITIALIZER;

- (void)setTouchReactionStyle:(TRReactionStyle)style;

- (void)setTouchReactionDuration:(CGFloat)duration;

- (void)setTouchReactionColor:(UIColor *)reactionColor;

- (void)setTouchReactionOpacity:(CGFloat)opacity;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
