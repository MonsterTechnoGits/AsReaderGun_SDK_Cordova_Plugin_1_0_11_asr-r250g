#import <Foundation/Foundation.h>
#import "AsParamValue.h"

#define MAX_BUFFER_SIZE     4096

@interface AsParamHelper : NSObject
+(NSData *)setBytesWithParamValue:(AsParamValue *)paramName;
+(NSData *)getBytesWithParamName:(NSNumber *)paramName;
+(NSData *)getBytesWithParamNames:(NSArray *)paramNames;
// +(NSData *)getBytesWithParamList:(NSArray *)paramList;
+(AsParamValue *)getParam:(NSData *)data;
+(NSArray *)getParamList:(NSData *)data;
@end
