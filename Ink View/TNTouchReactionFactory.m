#import "TNTouchReactionFactory.h"

#import "TNCircularTouchReactionView.h"
#import "TNFillTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TNTouchReactionFactory

+ (UIView<TNTouchReactionProtocol> *)createTouchReactionViewWithAttributes:
    (TNTouchReactionAttributes *)attributes appliedView:(UIView *)applied {
  TNTouchReactionStyle style = (TNTouchReactionStyle)[[attributes valueForTouchReactionAttributeKey:
                                   kTouchReactionStyleAttribute] unsignedIntegerValue];
  switch (style) {
    case CIRCULAR_INK_TOUCH:
      return [[TNCircularTouchReactionView alloc] initWithTouchReactionAttributes:attributes
                                                                  appliedView:applied];
    case FILL_INK_TOUCH:
      return [[TNFillTouchReactionView alloc] initWithTouchReactionAttributes:attributes
                                                              appliedView:applied];
    default:
      return nil;
  }
}

@end

NS_ASSUME_NONNULL_END
