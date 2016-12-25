#import <Foundation/Foundation.h>

#import "TNTouchReactionAttributes.h"

@protocol TNTouchReactionProtocol <NSObject>

@required

- (instancetype)initWithTouchReactionAttributes:(TNTouchReactionAttributes *)touchReactionAttributes
                                    appliedView:(UIView *)appliedView;

- (void)animateIn;

- (void)animateOut;

@end
