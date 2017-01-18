#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TNTouchReactionAttributes.h"
#import "TRReactionProtocol.h"
#import "TRReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionView : UIView<TRReactionProtocol>

@property (nonatomic, assign) TRReactionStyle touchReactionStyle;
@property (nonatomic) CGFloat touchReactionDuration;
@property (nonatomic) UIColor *touchReactionColor;
@property (nonatomic) CGFloat touchReactionRadius;
@property (nonatomic, assign) CGFloat touchReactionOpacity;
@property (nonatomic, weak, readonly) UIView *appliedView;

- (instancetype)initWithReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                               appliedView:(UIView *)appliedView NS_DESIGNATED_INITIALIZER;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
