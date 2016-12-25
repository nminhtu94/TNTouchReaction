#import "UIView+TouchReaction.h"

#import "TNTouchReactionAttributes.h"
#import "TNTouchReactionFactory.h"

#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

/// ObjC associated key for @c TNTouchReactionAttributes object.
static void *kTouchReactionAttribute = &kTouchReactionAttribute;

static UIView<TNTouchReactionProtocol> *TNInkView = nil;

@implementation UIView (TouchReaction)

- (void)createInkTouchFromTouch:(UITouch *)touch {
  if ([self touchReactionStyle] == INK_VIEW_NONE) {
    return;
  }

  CGPoint touchLocation = [touch locationInView:self];
  
  [TNInkView removeFromSuperview];
  TNInkView = [TNTouchReactionFactory createTouchReactionViewWithAttributes:
                  [self touchReactionAttributes] appliedView:self];
  TNInkView.center = touchLocation;
  
  [self addSubview:TNInkView];
  
  [TNInkView animateIn];
}

- (void)dismissInkTouch {
  if ([self touchReactionStyle] == INK_VIEW_NONE) {
    return;
  }

  if (TNInkView) {
    [TNInkView animateOut];
  }
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  UITouch *touch = [touches anyObject];
  [self createInkTouchFromTouch:touch];
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [self dismissInkTouch];
  [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  UITouch *touch = [touches anyObject];
  if (self.superview) {
    CGPoint touchLocation = [touch locationInView:self.superview];
    if (!CGRectContainsPoint(self.bounds, touchLocation)) {
      [self dismissInkTouch];
    }
  }
  [super touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *_Nullable)touches withEvent:(UIEvent *_Nullable)event {
  [self dismissInkTouch];
  [super touchesCancelled:touches withEvent:event];
}

#pragma mark - Getter

- (UIColor *)touchReactionColor {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  return [attributes valueForTouchReactionAttributeKey:kTouchReactionColorAttribute];
}

- (CGFloat)touchReactionDuration {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  return [[attributes valueForTouchReactionAttributeKey:
             kTouchReactionDurationAttribute] floatValue];
}

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

@end

NS_ASSUME_NONNULL_END
