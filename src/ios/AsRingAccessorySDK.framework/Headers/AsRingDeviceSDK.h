//
//  AsRingDeviceSDK.h
//  AsRingAccessorySDK
//
//  Created by zds on 16/8/22.
//  Copyright © 2016年 zyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsRingAccessoryBaseSDK.h"
#import "FileModel.h"
#import "FloderModel.h"


@protocol AsRingDebugListener <NSObject>

-(void)whenReciveDebugData:(NSData *)data;
-(void)whenSendDebugData:(NSData *)data;


@end

@protocol AsRingDeviceSDKDelegate  <NSObject>

- (void)pluggedAsRing:(BOOL)plug;
- (void)onAsRingError:(NSError *)error;
- (void)asRingDeviceRx:(NSData *)reciveData;
- (void)asRingRx:(NSData *)reciveData;

- (void)asRingModeTransition:(BOOL)success;

#pragma mark - FLASH Delegate
- (void)onFileReceived:(FileModel *)file;
- (void)onFloderReceived:(FloderModel *)floder;
- (void)onDeviceDebug:(BOOL)isOpen;

@end

@interface AsRingDeviceSDK : NSObject 
@property (nonatomic, weak) id<AsRingDeviceSDKDelegate> delegate;
@property (nonatomic, weak) id<AsRingDebugListener> debugListener;
@property (nonatomic,assign,readonly) BOOL isOpened;
+ (AsRingDeviceSDK *)sharedAsRingDeviceSDK;

- (void)asRingTx:(NSData *)transmitData;

- (void)addSDkMap:(NSDictionary *)addSDkMapDic;

- (void)transmitData:(NSData *)transmitData sdk:(AsRingAccessoryBaseSDK *)sdk;

- (void)tX:(NSData *)sendData msg_type:(unsigned char )msg_type cmd_code:(unsigned char )cmd_code;

- (void)setAsRingControlLogOn:(BOOL)on;

- (void)setAsRingLogOn:(BOOL)on;

- (NSString *)getAsRingModelNumber;
- (NSString *)getAsRingSerialNumber;
- (NSString *)getAsRingFirmwareRevision;
- (NSString *)getAsRingHardwareRevision;

- (NSArray *)getAllDevice;
- (NSArray *)getAllConnectDevice;

- (void)disConnectWithAddress:(NSString *)address;
- (void)disConnect;

- (NSString *)getAsRingSDKVersion;
- (void)modeTransition;

#pragma mark - FLASH module
- (void)createFileWith:(FileModel *)file;
- (void)createFloderWith:(FloderModel *)floder;

- (void)deleteFileWith:(FileModel *)file;
- (void)deleteFloderWith:(FloderModel *)floder;

- (void)selectFileWith:(FileModel *)file;
- (void)selectFloderWith:(FloderModel *)floder;

- (void)deviceDebug;

- (void)loadRootFloder;

@end
