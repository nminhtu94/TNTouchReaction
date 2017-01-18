#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TRReactionProtocol.h"
#import "TRReactionStyle.h"
#import "TNTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TNTouchReactionFactory : NSObject

+ (TNTouchReactionView *)createReactionViewWithAttributes:(TNTouchReactionAttributes *)attributes
                                              appliedView:(UIView *)appliedView;

@end

NS_ASSUME_NONNULL_END
