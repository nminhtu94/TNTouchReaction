#import "TNInkDemoViewController.h"

#import "UIView+TouchReaction.h"

NS_ASSUME_NONNULL_BEGIN

static CGFloat const kInkDemoViewHeight = 48.0f;

static CGFloat const kInkDemoViewHorizontalPadding = 12.0f;

@interface TNInkDemoViewController ()

// Scroll view container.
@property (nonatomic) UIScrollView *scrollView;

// Demo view for circular ink touch.
@property (nonatomic) UIView *circularInkTouch;

// Demo view for fill ink touch.
@property (nonatomic) UIView *fillInkTouch;

// Demo highlight touch reaction.
@property (nonatomic) UIButton *highlightTouchReactionView;

// Demo views array.
@property (nonatomic) NSMutableArray<UIView *> *demoViews;

@end

@implementation TNInkDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.demoViews = [NSMutableArray array];
  
  self.title = @"Demo";
  
  // Scrollview.
  [self.view addSubview:self.scrollView];

  // Circular touch view.
  [self.scrollView addSubview:self.circularTouch];
  [self.demoViews addObject:self.circularTouch];
  
  // Fill touch view.
  [self.scrollView addSubview:self.fillInkTouch];
  [self.demoViews addObject:self.fillInkTouch];
  
  // Highlight touch view.
  [self.scrollView addSubview:self.highlightTouchReactionView];
  [self.demoViews addObject:self.highlightTouchReactionView];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  
  // Layout scrollview.
  self.scrollView.frame = self.view.bounds;
  
  // Layout demo views.
  __block CGFloat currentY = 10;
  [self.demoViews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
    obj.frame = CGRectMake(kInkDemoViewHorizontalPadding,
                           currentY,
                           CGRectGetWidth(self.scrollView.bounds) -
                               2 * kInkDemoViewHorizontalPadding,
                           kInkDemoViewHeight);
    currentY += kInkDemoViewHeight + 12;
  }];
}

#pragma mark - Lazy Initializers

- (UINavigationBar *)createNavigationBar {
    UINavigationBar *navigationBar =
        [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0,
                                                          CGRectGetWidth(self.view.bounds), 44)];
  return navigationBar;
}

- (UIView *)highlightTouchReactionView {
  if (_highlightTouchReactionView == nil) {
    _highlightTouchReactionView = [[UIButton alloc] initWithFrame:CGRectZero];
    _highlightTouchReactionView.layer.borderWidth = 1;
    _highlightTouchReactionView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_highlightTouchReactionView addTarget:self
                                    action:@selector(buttonTapped:)
                          forControlEvents:UIControlEventTouchUpInside];
    
    [_highlightTouchReactionView setTouchReactionStyle:HIGHLIGHT_TOUCH_REACTION];
    [_highlightTouchReactionView setTouchReactionDuration:0.2];
  }
  return _highlightTouchReactionView;
}

- (UIView *)fillInkTouch {
  if (_fillInkTouch == nil) {
    _fillInkTouch = [[UIView alloc] initWithFrame:CGRectZero];
    _fillInkTouch.layer.borderWidth = 1;
    _fillInkTouch.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_fillInkTouch setTouchReactionStyle:FILL_TOUCH_REACTION];
    [_fillInkTouch setTouchReactionDuration:0.4];
  }
  return _fillInkTouch;
}

- (UIView *)circularTouch {
  if (_circularInkTouch == nil) {
    _circularInkTouch = [[UIView alloc] initWithFrame:CGRectZero];
    _circularInkTouch.layer.borderWidth = 1;
    _circularInkTouch.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_circularInkTouch setTouchReactionStyle:CIRCULAR_TOUCH_REACTION];
  }
  return _circularInkTouch;
}

- (UIScrollView *)scrollView {
  if (_scrollView == nil) {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [_scrollView setTouchReactionStyle:CIRCULAR_TOUCH_REACTION];
  }
  return _scrollView;
}

#pragma mark - Event Handlers

- (void)buttonTapped:(UIButton *)sender {
  NSLog(@"Button tapped");
}

@end

NS_ASSUME_NONNULL_END
