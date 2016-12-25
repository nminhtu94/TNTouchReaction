#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const kTouchReactionColorAttribute;

extern NSString *const kTouchReactionDurationAttribute;

extern NSString *const kTouchReactionOpacityAttribute;

extern NSString *const kTouchReactionRadiusAttribute;

extern NSString *const kTouchReactionStyleAttribute;

@interface TNTouchReactionAttributes : NSObject

- (void)setValue:(id)value forTouchReactionAttributeKey:(NSString *const)attributeKey;

- (id)valueForTouchReactionAttributeKey:(NSString *const)attributeKey;

@end

NS_ASSUME_NONNULL_END
