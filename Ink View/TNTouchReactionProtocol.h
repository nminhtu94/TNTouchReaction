#import <Foundation/Foundation.h>

#import "TNTouchReactionAttributes.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TNTouchReactionProtocol <NSObject>

@required

- (instancetype)initWithTouchReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                                    appliedView:(UIView *)appliedView;

- (void)animateIn;

- (void)animateOut;

@end

NS_ASSUME_NONNULL_END
