//
//  Device.h
//  AsRingAccessorySDK
//
//  Created by zds on 16/8/22.
//  Copyright © 2016年 zyl. All rights reserved.
//
#import <Foundation/Foundation.h>
@class  AsRingAccessoryBaseSDK;

@interface Device : NSObject
@property (strong, nonatomic,readonly)NSString *deviceModel;
@property (strong, nonatomic,readonly)NSString *deviceAddress;
@property (strong, nonatomic,readonly)AsRingAccessoryBaseSDK * deviceSDK;

- (instancetype)initWithdeviceModel:(NSString *)deviceModel DeviceAddress:(NSString *)deviceAddress SDK:(AsRingAccessoryBaseSDK *)deviceSDK;

@end
