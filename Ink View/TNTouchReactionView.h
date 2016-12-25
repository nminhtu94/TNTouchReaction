#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TNTouchReactionAttributes.h"
#import "TNTouchReactionProtocol.h"
#import "TNTouchReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionView : UIView<TNTouchReactionProtocol>

@property (nonatomic, assign, readonly) TNTouchReactionStyle touchReactionStyle;
@property (nonatomic, readonly) CGFloat touchReactionDuration;
@property (nonatomic, readonly) UIColor *touchReactionColor;
@property (nonatomic, readonly) CGFloat touchReactionRadius;
@property (nonatomic, assign, readonly) CGFloat touchReactionOpacity;
@property (nonatomic, weak, readonly) UIView *appliedView;

- (instancetype)initWithTouchReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                                    appliedView:(UIView *)appliedView NS_DESIGNATED_INITIALIZER;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
