#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TNTouchReactionProtocol.h"
#import "TNTouchReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionFactory : NSObject

+ (UIView<TNTouchReactionProtocol> *)createTouchReactionViewWithAttributes:
    (TNTouchReactionAttributes *)attributes appliedView:(UIView *)applied;

@end

NS_ASSUME_NONNULL_END
