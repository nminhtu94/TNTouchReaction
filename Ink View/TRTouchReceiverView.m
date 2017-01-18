#import "TRTouchReceiverView.h"

#import "TNTouchReactionFactory.h"
#import "TNTouchReactionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRTouchReceiverView()

@property (nonatomic, nullable) TNTouchReactionView *reactionView;
@property (nonatomic) TNTouchReactionAttributes *touchReactionAttributes;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) NSArray<NSLayoutConstraint *> *layoutConstraints;

@end

@implementation TRTouchReceiverView

+ (BOOL)requiresConstraintBasedLayout {
  return YES;
}

- (instancetype)initWithView:(UIView *)view {
  self = [super initWithFrame:view.bounds];
  if (self) {
    _view = view;
    _layoutConstraints = [NSArray array];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.userInteractionEnabled = YES;
  }
  return self;
}

- (void)didMoveToSuperview {
  [super didMoveToSuperview];
  [self setNeedsUpdateConstraints];
  [self.superview setNeedsLayout];
  [self.superview layoutIfNeeded];
}

- (void)createReactionFromTouch:(UITouch *)touch {
  if ([self touchReactionStyle] == NONE_TOUCH_REACTION) {
    return;
  }
  
  CGPoint touchLocation = [touch locationInView:self];
  
  [self.reactionView removeFromSuperview];
  self.reactionView =
      [TNTouchReactionFactory createReactionViewWithAttributes:[self touchReactionAttributes]
                                                   appliedView:self];
  self.reactionView.center = touchLocation;
  
  [self addSubview:self.reactionView];
  
  [self.reactionView animateIn];
}

- (void)dismissTouchReaction {
  if ([self touchReactionStyle] == NONE_TOUCH_REACTION) {
    return;
  }
  
  if (self.reactionView) {
    [self.reactionView animateOut];
    self.reactionView = nil;
  }
}

- (void)updateConstraints {
  [self.superview removeConstraints:self.layoutConstraints];

  // Left constraint.
  NSLayoutConstraint *leftConstraint =
      [NSLayoutConstraint constraintWithItem:self
                                   attribute:NSLayoutAttributeLeft
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.superview
                                   attribute:NSLayoutAttributeLeft
                                  multiplier:1.0
                                    constant:0];
  
  // Right constraint.
  NSLayoutConstraint *topConstraint =
      [NSLayoutConstraint constraintWithItem:self
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.superview
                                   attribute:NSLayoutAttributeTop
                                  multiplier:1.0
                                    constant:0];
  
  // Top constraint.
  NSLayoutConstraint *widthConstraint =
      [NSLayoutConstraint constraintWithItem:self
                                   attribute:NSLayoutAttributeWidth
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.superview
                                   attribute:NSLayoutAttributeWidth
                                  multiplier:1.0
                                    constant:0];
  
  // Bottom constraint.
  NSLayoutConstraint *heightConstraint =
      [NSLayoutConstraint constraintWithItem:self
                                   attribute:NSLayoutAttributeHeight
                                   relatedBy:NSLayoutRelationEqual
                                      toItem:self.superview
                                   attribute:NSLayoutAttributeHeight
                                  multiplier:1.0
                                    constant:0];
  
  self.layoutConstraints = @[leftConstraint, topConstraint, widthConstraint, heightConstraint];
  
  [self.superview addConstraints:self.layoutConstraints];
  [super updateConstraints];
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesBegan:touches withEvent:event];
  UITouch *touch = [touches anyObject];
  [self createReactionFromTouch:touch];
  [[self nextResponder] touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesEnded:touches withEvent:event];
  [self dismissTouchReaction];
  [[self nextResponder] touchesEnded:touches withEvent:event];
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
  [[self nextResponder] touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *_Nullable)event {
  [super touchesCancelled:touches withEvent:event];
  [self dismissTouchReaction];
  [[self nextResponder] touchesCancelled:touches withEvent:event];
}

#pragma mark - Getter

- (CGFloat)touchReactionStyle {
  TNTouchReactionAttributes *attributes = [self touchReactionAttributes];
  return [[attributes valueForTouchReactionAttributeKey:
      kTouchReactionStyleAttribute] unsignedIntegerValue];
}

- (TNTouchReactionAttributes *)touchReactionAttributes {
  if (_touchReactionAttributes == nil) {
    _touchReactionAttributes = [[TNTouchReactionAttributes alloc] init];
  }
  return _touchReactionAttributes;
}

#pragma mark - Setter

- (void)setTouchReactionStyle:(TRReactionStyle)style {
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
