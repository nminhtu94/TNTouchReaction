#import "TNTouchReactionAttributes.h"

#import "TNTouchReactionStyle.h"

NS_ASSUME_NONNULL_BEGIN

NSString *const kTouchReactionColorAttribute = @"kTouchReactionColor";
NSString *const kTouchReactionDurationAttribute = @"kTouchReactionDuration";
NSString *const kTouchReactionOpacityAttribute = @"kTouchReactionOpacity";
NSString *const kTouchReactionRadiusAttribute = @"kTouchReactionRadius";
NSString *const kTouchReactionStyleAttribute = @"kTouchReactionStyle";

@interface TNTouchReactionAttributes()

@property (nonatomic) NSMutableDictionary<NSString *, id> *attributes;

@end

@implementation TNTouchReactionAttributes

- (instancetype)init {
  self = [super init];
  if (self) {
    _attributes = [NSMutableDictionary dictionary];
    
    // Set default values.
    _attributes[kTouchReactionColorAttribute] = [UIColor lightGrayColor];
    _attributes[kTouchReactionRadiusAttribute] = @(48);
    _attributes[kTouchReactionDurationAttribute] = @(0.2);
    _attributes[kTouchReactionOpacityAttribute] = @(0.2);
    _attributes[kTouchReactionStyleAttribute] = @(NONE_TOUCH_REACTION);
  }
  return self;
}

- (void)setValue:(id)value forTouchReactionAttributeKey:(NSString *const)attributeKey {
  self.attributes[attributeKey] = value;
}

- (id)valueForTouchReactionAttributeKey:(NSString *const)attributeKey {
  return self.attributes[attributeKey];
}

@end

NS_ASSUME_NONNULL_END
