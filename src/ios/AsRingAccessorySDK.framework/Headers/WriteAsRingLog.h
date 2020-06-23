//
//  WriteAsRingLog.h
//  AsRingAccessorySDK
//
//  Created by zds on 16/8/22.
//  Copyright © 2016年 zyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WriteAsRingLog : NSObject

+ (WriteAsRingLog*)sharedWriteAsRingLog;

- (void)writeLog:(NSString *)log;

- (void)setWriteLogOn:(BOOL)isOpen;

@end
