#import <Foundation/Foundation.h>
#import "AsRfidValues.h"

@interface AsMaskActionType : NSObject
+ (NSString *)toString:(MaskActionType)actionType targetType:(MaskTargetType)targetType;
@end
