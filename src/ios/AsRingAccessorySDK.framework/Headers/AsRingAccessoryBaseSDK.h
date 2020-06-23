//
//  AsRingAccessoryBaseSDK.h
//  AsRingAccessorySDK
//
//  Created by zds on 16/8/22.
//  Copyright © 2016年 zyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsRingAccessoryBaseSDK : NSObject

- (instancetype)initWithDeviceModel:(NSString *) deviceModel;

- (void)rX:(NSData *) readData;

- (void)tX:(NSData *) transmitData;

- (void)pluggedDevice:(BOOL)plug;

- (NSString *)getAsRingDeviceSDKVersion;

@end
