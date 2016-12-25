#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TNTouchReactionProtocol.h"
#import "TNTouchReactionStyle.h"
#import "TNTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionFactory : NSObject

+ (TNTouchReactionView *)createTouchReactionViewWithAttributes:
    (TNTouchReactionAttributes *)attributes appliedView:(UIView *)appliedView;

@end

NS_ASSUME_NONNULL_END
