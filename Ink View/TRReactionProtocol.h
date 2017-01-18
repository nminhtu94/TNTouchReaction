#import <Foundation/Foundation.h>

#import "TNTouchReactionAttributes.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TRReactionProtocol <NSObject>

@required

- (instancetype)initWithReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                               appliedView:(UIView *)appliedView;

- (void)animateIn;

- (void)animateOut;

@end

NS_ASSUME_NONNULL_END
