#import "UIButton+TouchReaction.h"

#import "TNTouchReactionAttributes.h"
#import "TNTouchReactionFactory.h"

#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

/// ObjC associated key for @c TNTouchReactionAttributes object.
static void *kTouchReactionAttribute = &kTouchReactionAttribute;

/// The touch reaction view itself.
static TNTouchReactionView *TouchReactionView = nil;

@implementation UIButton (TouchReaction)

- (void)createReactionFromTouch:(UITouch *)touch {
  if ([self touchReactionStyle] == NONE_TOUCH_REACTION) {
    return;
  }
  
  CGPoint touchLocation = [touch locationInView:self];
  
  [TouchReactionView removeFromSuperview];
  TouchReactionView = [TNTouchReactionFactory createTouchReactionViewWithAttributes:
      [self touchReactionAttributes] appliedView:self];
  TouchReactionView.center = touchLocation;
  
  [self addSubview:TouchReactionView];
  
  [TouchReactionView animateIn];
}

- (void)dismissTouchReaction {
  if ([self touchReactionStyle] == NONE_TOUCH_REACTION) {
    return;
  }
  
  if (TouchReactionView) {
    [TouchReactionView animateOut];
    TouchReactionView = nil;
  }
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesBegan:touches withEvent:event];
  UITouch *touch = [touches anyObject];
  [self createReactionFromTouch:touch];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesEnded:touches withEvent:event];
  [self dismissTouchReaction];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesMoved:touches withEvent:event];
  UITouch *touch = [touches anyObject];
  if (self.superview) {
    CGPoint touchLocation = [touch locationInView:self.superview];
    if (!CGRectContainsPoint(self.frame, touchLocation)) {
      [self dismissTouchReaction];
    }
  }
}

- (void)touchesCancelled:(NSSet<UITouch *> *_Nullable)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesCancelled:touches withEvent:event];
  [self dismissTouchReaction];
}

#pragma mark - Getter

- (CGFloat)touchReactionStyle {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  return [[attributes valueForTouchReactionAttributeKey:
           kTouchReactionStyleAttribute] unsignedIntegerValue];
}

- (TNTouchReactionAttributes *)touchReactionAttributes {
  TNTouchReactionAttributes *attributeObject =
  objc_getAssociatedObject(self, kTouchReactionAttribute);
  if (attributeObject == nil) {
    attributeObject = [[TNTouchReactionAttributes alloc] init];
    objc_setAssociatedObject(self, kTouchReactionAttribute, attributeObject,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return attributeObject;
}

#pragma mark - Setter

- (void)setTouchReactionStyle:(TNTouchReactionStyle)style {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  [attributes setValue:@(style) forTouchReactionAttributeKey:kTouchReactionStyleAttribute];
}

- (void)setTouchReactionDuration:(CGFloat)duration {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  [attributes setValue:@(duration) forTouchReactionAttributeKey:kTouchReactionDurationAttribute];
}

- (void)setTouchReactionColor:(UIColor *)reactionColor {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  [attributes setValue:reactionColor forTouchReactionAttributeKey:kTouchReactionColorAttribute];
}

- (void)setTouchReactionOpacity:(CGFloat)opacity {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  [attributes setValue:@(opacity) forTouchReactionAttributeKey:kTouchReactionOpacityAttribute];
}

@end

NS_ASSUME_NONNULL_END
