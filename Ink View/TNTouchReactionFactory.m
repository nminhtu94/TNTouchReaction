#import "TNTouchReactionFactory.h"

#import "TNCircularTouchReactionView.h"
#import "TNFillTouchReactionView.h"
#import "TNHighlightTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TNTouchReactionFactory

+ (TNTouchReactionView *)createTouchReactionViewWithAttributes:
    (TNTouchReactionAttributes *)attributes appliedView:(UIView *)appliedView {
  TNTouchReactionStyle style = (TNTouchReactionStyle)[[attributes valueForTouchReactionAttributeKey:
      kTouchReactionStyleAttribute] unsignedIntegerValue];
  switch (style) {
    case CIRCULAR_TOUCH_REACTION:
      return [[TNCircularTouchReactionView alloc] initWithTouchReactionAttributes:attributes
                                                                      appliedView:appliedView];
    case FILL_TOUCH_REACTION:
      return [[TNFillTouchReactionView alloc] initWithTouchReactionAttributes:attributes
                                                                  appliedView:appliedView];
    case HIGHLIGHT_TOUCH_REACTION:
      return [[TNHighlightTouchReactionView alloc] initWithTouchReactionAttributes:attributes
                                                                       appliedView:appliedView];
    default:
      return nil;
  }
}

@end

NS_ASSUME_NONNULL_END
