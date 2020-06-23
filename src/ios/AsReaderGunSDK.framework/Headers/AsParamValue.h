#import <Foundation/Foundation.h>
#import "AsParamName.h"

@interface AsParamValue : NSObject<NSCoding>
@property (assign, readwrite) ParamName paramName;
@property (assign, readwrite) unsigned int value;

- (void)setEnabled:(BOOL)value;
@end
