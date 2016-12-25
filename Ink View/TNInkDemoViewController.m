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
  
  // Fill ink touch view.
  [self.scrollView addSubview:self.fillInkTouch];
  [self.demoViews addObject:self.fillInkTouch];
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

- (UIView *)fillInkTouch {
  if (_fillInkTouch == nil) {
    _fillInkTouch = [[UIView alloc] initWithFrame:CGRectZero];
    _fillInkTouch.layer.borderWidth = 1;
    _fillInkTouch.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_fillInkTouch setTouchReactionStyle:FILL_INK_TOUCH];
    [_fillInkTouch setTouchReactionDuration:0.4];
  }
  return _fillInkTouch;
}

- (UIView *)circularTouch {
  if (_circularInkTouch == nil) {
    _circularInkTouch = [[UIView alloc] initWithFrame:CGRectZero];
    _circularInkTouch.layer.borderWidth = 1;
    _circularInkTouch.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_circularInkTouch setTouchReactionStyle:CIRCULAR_INK_TOUCH];
  }
  return _circularInkTouch;
}

- (UIScrollView *)scrollView {
  if (_scrollView == nil) {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
  }
  return _scrollView;
}

@end

NS_ASSUME_NONNULL_END
