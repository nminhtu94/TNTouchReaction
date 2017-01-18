#import "TNTouchReactionFactory.h"

#import "TNCircularTouchReactionView.h"
#import "TNFillTouchReactionView.h"
#import "TNHighlightTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TNTouchReactionFactory

+ (TNTouchReactionView *)createReactionViewWithAttributes:(TNTouchReactionAttributes *)attributes
                                              appliedView:(UIView *)appliedView {
  TRReactionStyle style = (TRReactionStyle)[[attributes valueForTouchReactionAttributeKey:
      kTouchReactionStyleAttribute] unsignedIntegerValue];
  switch (style) {
    case CIRCULAR_TOUCH_REACTION:
      return [[TNCircularTouchReactionView alloc] initWithReactionAttributes:attributes
                                                                 appliedView:appliedView];
    case FILL_TOUCH_REACTION:
      return [[TNFillTouchReactionView alloc] initWithReactionAttributes:attributes
                                                             appliedView:appliedView];
    case HIGHLIGHT_TOUCH_REACTION:
      return [[TNHighlightTouchReactionView alloc] initWithReactionAttributes:attributes
                                                                  appliedView:appliedView];
    default:
      return nil;
  }
}

@end

NS_ASSUME_NONNULL_END
