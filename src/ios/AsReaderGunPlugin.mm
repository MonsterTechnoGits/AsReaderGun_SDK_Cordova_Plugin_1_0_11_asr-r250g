/********* AsReaderGunPlugin.mm Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <AsReaderGunSDK/AsReaderGunSDK.h>
#import <AsRingAccessorySDK/AsRingDeviceSDK.h>
#import <Foundation/Foundation.h>
#import "CSVData.h"

@interface AsReaderGunPlugin : CDVPlugin<AsReaderDelegate>

@property (strong, nonatomic,readwrite) AsReaderGUN *mAsReaderGUN;
@property (strong, nonatomic,readwrite) AsReader *mReader;

- (void)setAsReaderGUNConnectedListener:(CDVInvokedUrlCommand *)command;
- (void)initAsReader:(CDVInvokedUrlCommand *)command;
- (void)setIsUseKeyAction:(CDVInvokedUrlCommand *)command;
- (void)setBarcodeModeAndIsKeyAction:(CDVInvokedUrlCommand *)command;
- (void)setAsReaderGUNDisconnectedListener:(CDVInvokedUrlCommand *)command;
- (void)setPowerGain:(CDVInvokedUrlCommand *)command;
- (void)getFirmwareVersion:(CDVInvokedUrlCommand *)command;
- (void)getRegionName:(CDVInvokedUrlCommand *)command;
- (void)serialNumber:(CDVInvokedUrlCommand *)command;
- (void)getRFModuleVersion:(CDVInvokedUrlCommand *)command;
- (void)getStoredCount:(CDVInvokedUrlCommand *)command;
- (void)getBatteryStatus:(CDVInvokedUrlCommand *)command;
- (void)getEpcMaskCount:(CDVInvokedUrlCommand *)command;
- (void)getLBTMask:(CDVInvokedUrlCommand *)command;
- (void)getLBT:(CDVInvokedUrlCommand *)command;
- (void)getRevision:(CDVInvokedUrlCommand *)command;
- (void)inventory:(CDVInvokedUrlCommand *)command;
- (void)stop:(CDVInvokedUrlCommand *)command;
- (void)stopSync:(CDVInvokedUrlCommand *)command;
- (void)softReset:(CDVInvokedUrlCommand *)command;
- (void)hardReset:(CDVInvokedUrlCommand *)command;
- (void)defaultParameter:(CDVInvokedUrlCommand *)command;
- (void)saveParameter:(CDVInvokedUrlCommand *)command;
- (void)loadDebugMessage:(CDVInvokedUrlCommand *)command;
- (void)enterBypassMode:(CDVInvokedUrlCommand *)command;
- (void)enterBarcodeBypassMode:(CDVInvokedUrlCommand *)command;
- (void)leaveBypassMode:(CDVInvokedUrlCommand *)command;
- (void)clearEpcMask:(CDVInvokedUrlCommand *)command;
- (void)saveEpcMask:(CDVInvokedUrlCommand *)command;
- (void)wakeUpBarcode:(CDVInvokedUrlCommand *)command;
- (void)startDecode:(CDVInvokedUrlCommand *)command;
- (void)stopDecode:(CDVInvokedUrlCommand *)command;
- (void)aimOff:(CDVInvokedUrlCommand *)command;
- (void)aimOn:(CDVInvokedUrlCommand *)command;
- (void)ledOff:(CDVInvokedUrlCommand *)command;
- (void)ledOn:(CDVInvokedUrlCommand *)command;
- (void)getRegister:(CDVInvokedUrlCommand *)command;
- (void)setScanMode:(CDVInvokedUrlCommand *)command;
- (void)setBuzzer:(CDVInvokedUrlCommand *)command;
- (void)getBuzzer:(CDVInvokedUrlCommand *)command;
- (void)setVibrator:(CDVInvokedUrlCommand *)command;
- (void)getVibrator:(CDVInvokedUrlCommand *)command;
- (void)setRegion:(CDVInvokedUrlCommand *)command;
- (void)getRegion:(CDVInvokedUrlCommand *)command;
- (void)setOperationTime:(CDVInvokedUrlCommand *)command;
- (void)getOperationTime:(CDVInvokedUrlCommand *)command;
- (void)setInventoryTime:(CDVInvokedUrlCommand *)command;
- (void)getInventoryTime:(CDVInvokedUrlCommand *)command;
- (void)setIdleTime:(CDVInvokedUrlCommand *)command;
- (void)getIdleTime:(CDVInvokedUrlCommand *)command;
- (void)setSleepTime:(CDVInvokedUrlCommand *)command;
- (void)getSleepTime:(CDVInvokedUrlCommand *)command;
- (void)setSameReportTime:(CDVInvokedUrlCommand *)command;
- (void)getSameReportTime:(CDVInvokedUrlCommand *)command;
- (void)setAutoOffTime:(CDVInvokedUrlCommand *)command;
- (void)getAutoOffTime:(CDVInvokedUrlCommand *)command;
- (void)setAccessPassword:(CDVInvokedUrlCommand *)command;
- (void)getAccessPassword:(CDVInvokedUrlCommand *)command;
- (void)setInventorySession:(CDVInvokedUrlCommand *)command;
- (void)getInventorySession:(CDVInvokedUrlCommand *)command;
- (void)setSessionFlag:(CDVInvokedUrlCommand *)command;
- (void)getSessionFlag:(CDVInvokedUrlCommand *)command;
- (void)setSerialNumber:(CDVInvokedUrlCommand *)command;
- (void)getSerialNumber:(CDVInvokedUrlCommand *)command;
- (void)setRemoteMode:(CDVInvokedUrlCommand *)command;
- (void)getRemoteMode:(CDVInvokedUrlCommand *)command;
- (void)setContinuousMode:(CDVInvokedUrlCommand *)command;
- (void)getContinuousMode:(CDVInvokedUrlCommand *)command;
- (void)setLimitTagCount:(CDVInvokedUrlCommand *)command;
- (void)getLimitTagCount:(CDVInvokedUrlCommand *)command;
- (void)setUseSelectionMask:(CDVInvokedUrlCommand *)command;
- (void)getUseSelectionMask:(CDVInvokedUrlCommand *)command;
- (void)setReportMode:(CDVInvokedUrlCommand *)command;
- (void)getReportMode:(CDVInvokedUrlCommand *)command;
- (void)setStoredMode:(CDVInvokedUrlCommand *)command;
- (void)getStoredMode:(CDVInvokedUrlCommand *)command;
- (void)setRssiMode:(CDVInvokedUrlCommand *)command;
- (void)getRssiMode:(CDVInvokedUrlCommand *)command;
- (void)setEpcMaskMatchMode:(CDVInvokedUrlCommand *)command;
- (void)getEpcMaskMatchMode:(CDVInvokedUrlCommand *)command;
- (void)getMaskTarget:(CDVInvokedUrlCommand *)command;
- (void)setMaskTarget:(CDVInvokedUrlCommand *)command;
- (void)getMaskAction:(CDVInvokedUrlCommand *)command;
- (void)setMaskAction:(CDVInvokedUrlCommand *)command;
- (void)getMaskBank:(CDVInvokedUrlCommand *)command;
- (void)setMaskBank:(CDVInvokedUrlCommand *)command;
- (void)getMaskOffset:(CDVInvokedUrlCommand *)command;
- (void)setMaskOffset:(CDVInvokedUrlCommand *)command;
- (void)getMask:(CDVInvokedUrlCommand *)command;
- (void)setMask:(CDVInvokedUrlCommand *)command;
- (void)setMaskWithLength:(CDVInvokedUrlCommand *)command;
- (void)getMaskUsed:(CDVInvokedUrlCommand *)command;
- (void)setMaskUsed:(CDVInvokedUrlCommand *)command;
- (void)setAlgorithm:(CDVInvokedUrlCommand *)command;
- (void)getAlgorithm:(CDVInvokedUrlCommand *)command;
- (void)setMinQ:(CDVInvokedUrlCommand *)command;
- (void)getMinQ:(CDVInvokedUrlCommand *)command;
- (void)setMaxQ:(CDVInvokedUrlCommand *)command;
- (void)getMaxQ:(CDVInvokedUrlCommand *)command;
- (void)setQValue:(CDVInvokedUrlCommand *)command;
- (void)getQValue:(CDVInvokedUrlCommand *)command;
- (void)setLinkProfileValue:(CDVInvokedUrlCommand *)command;
- (void)getLinkProfileValue:(CDVInvokedUrlCommand *)command;
- (void)setDefaultLinkProfileValue:(CDVInvokedUrlCommand *)command;
- (void)getDefaultLinkProfileValue:(CDVInvokedUrlCommand *)command;
- (void)setMaskTypeValue:(CDVInvokedUrlCommand *)command;
- (void)getMaskTypeValue:(CDVInvokedUrlCommand *)command;
- (void)isBarcodeModule:(CDVInvokedUrlCommand *)command;
- (void)setBarcodeContinueMode:(CDVInvokedUrlCommand *)command;
- (void)setTagDataType:(CDVInvokedUrlCommand *)command;
- (void)setPropBarcodeMode:(CDVInvokedUrlCommand *)command;
- (void)getReaderType:(CDVInvokedUrlCommand *)command;
- (void)disconnect:(CDVInvokedUrlCommand *)command;
- (void)getAction:(CDVInvokedUrlCommand *)command;
- (void)readMemory:(CDVInvokedUrlCommand *)command;
- (void)writeMemory:(CDVInvokedUrlCommand *)command;
- (void)lock:(CDVInvokedUrlCommand *)command;
- (void)unlock:(CDVInvokedUrlCommand *)command;
- (void)permaLock:(CDVInvokedUrlCommand *)command;
- (void)kill:(CDVInvokedUrlCommand *)command;
- (void)blockWrite:(CDVInvokedUrlCommand *)command;
- (void)blockErase:(CDVInvokedUrlCommand *)command;
- (void)addEpcMask:(CDVInvokedUrlCommand *)command;
- (void)addEpcMaskWithAsSelectMaskEPCParam:(CDVInvokedUrlCommand *)command;
- (void)getEpcMask:(CDVInvokedUrlCommand *)command;
- (void)getBluetoothAddress:(CDVInvokedUrlCommand *)command;
- (void)getDeviceModel:(CDVInvokedUrlCommand *)command;
- (void)setDeviceModel:(CDVInvokedUrlCommand *)command;

//delegate
- (void)setReaderInitializedListener:(CDVInvokedUrlCommand *)command;
- (void)setUpdateDeviceStateListener:(CDVInvokedUrlCommand *)command;
- (void)setReadTagListener:(CDVInvokedUrlCommand *)command;
- (void)setChangedActionStateListener:(CDVInvokedUrlCommand *)command;
- (void)setChangedRemoteKeyListener:(CDVInvokedUrlCommand *)command;
- (void)setDetectBarcodeStringListener:(CDVInvokedUrlCommand *)command;
- (void)setDetectBarcodeDataListener:(CDVInvokedUrlCommand *)command;
- (void)setAccessResultListener:(CDVInvokedUrlCommand *)command;
- (void)setCommandCompleteListener:(CDVInvokedUrlCommand *)command;
- (void)setOnAsReaderLeftModeKeyEventListener:(CDVInvokedUrlCommand *)command;
- (void)setOnAsReaderRightModeKeyEventListener:(CDVInvokedUrlCommand *)command;
- (void)setOnAsReaderTriggerKeyEventListener:(CDVInvokedUrlCommand *)command;

- (void)setAsReaderTriggerKeyEventReturnValue:(CDVInvokedUrlCommand *)command;
- (void)setAsReaderLeftModeKeyEventReturnValue:(CDVInvokedUrlCommand *)command;
- (void)setAsReaderRightModeKeyEventReturnValue:(CDVInvokedUrlCommand *)command;

@end

@implementation AsReaderGunPlugin {
    NSString *asReaderGUNConnectedListenerCallbackId;
    NSString *asReaderGUNDisconnectedListenerCallbackId;
    NSString *readerInitializedListenerCallbackId;
    NSString *updateDeviceStateListenerCallbackId;
    NSString *readTagListenerCallbackId;
    NSString *changedActionStateListenerCallbackId;
    NSString *changedRemoteKeyListenerCallbackId;
    NSString *detectBarcodeStringListenerCallbackId;
    NSString *detectBarcodeDataListenerCallbackId;
    NSString *accessResultListenerCallbackId;
    NSString *commandCompleteListenerCallbackId;
    NSString *onAsReaderLeftModeKeyEventListenerCallbackId;
    NSString *onAsReaderRightModeKeyEventListenerCallbackId;
    NSString *onAsReaderTriggerKeyEventListenerCallbackId;
    
    
    BOOL asReaderTriggerKeyEventReturnValue;
    BOOL asReaderLeftModeKeyEventReturnValue;
    BOOL asReaderRightModeKeyEventReturnValue;

}

- (void)pluginInitialize {
    self.mAsReaderGUN = [[AsReaderGUN alloc] initWithDeviceModel:@"com.asreader.gun"];
    self.mAsReaderGUN.deviceModel = @"com.asreader.gun";
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(AsReaderGUNConnected:) name:@"AsReaderGUNConnected" object:nil];
    [center addObserver:self selector:@selector(AsReaderGUNDisconnected:) name:@"AsReaderGUNDisconnected" object:nil];
}

- (void)setAsReaderGUNConnectedListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    asReaderGUNConnectedListenerCallbackId = command.callbackId;
}

- (void)AsReaderGUNConnected:(NSNotification *)notification {
        NSLog(@"%s,called",__PRETTY_FUNCTION__);
        CDVPluginResult* pluginResult = nil;

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:asReaderGUNConnectedListenerCallbackId];
}

- (void)initAsReader:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    self.mReader = [[AsReader alloc] initWithAsReaderGUN:self.mAsReaderGUN delegate:self];
    if (self.mReader != nil) {
        [self.mReader setDelegate:self];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:NO];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setIsUseKeyAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.isUseKeyAction = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getIsUseKeyAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL isUseKeyAction = NO;
    if (self.mReader) {
        isUseKeyAction = self.mReader.isUseKeyAction;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isUseKeyAction];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setBarcodeModeAndIsKeyAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int keyAction = [[arguments objectAtIndex:1] intValue];
    if (self.mReader) {
        [self.mReader setBarcodeMode:idx isKeyAction:keyAction];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}   

- (void)setAsReaderGUNDisconnectedListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
   
    asReaderGUNDisconnectedListenerCallbackId = command.callbackId;
}

- (void)AsReaderGUNDisconnected:(NSNotification *)notification {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);

        if (self.mReader != nil) {
            [self.mReader disconnect];
        }
        self.mReader = nil;
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:NO];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:asReaderGUNDisconnectedListenerCallbackId];
}

#pragma mark  --AsReader.h--
- (void)setPowerGain:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    
    if (self.mReader) {
        self.mReader.powerGain = idx;
    }

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getPowerGain:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.powerGain;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
} 

- (void)getFirmwareVersion:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *version;
    if (self.mReader) {
        version = self.mReader.firmwareVersion;
    }
    if (!version) {
        version = @"";
    }
    CDVPluginResult* pluginResult = nil;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:version];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRegionName:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *region;
    if (self.mReader) {
        region = [self.mReader regionName];
    }
    if (!region) {
        region = @"";
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:region];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRFModuleVersion:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *rFModuleVersion;
    if (self.mReader) {
        rFModuleVersion = [self.mReader rFModuleVersion];
    }
    if (!rFModuleVersion) {
        rFModuleVersion = @"";
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:rFModuleVersion];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getStoredCount:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int storedCount = 0;
    if (self.mReader) {
        storedCount = [self.mReader storedCount];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:storedCount];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getBatteryStatus:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int batteryStatus = 0;
    if (self.mReader) {
        batteryStatus = [self.mReader batteryStatus];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:batteryStatus];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getEpcMaskCount:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int epcMaskCount = 0;
    if (self.mReader) {
        epcMaskCount = [self.mReader epcMaskCount];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:epcMaskCount];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getLBTMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *LBT = [NSArray array];
    if (self.mReader) {
        LBT = [self.mReader getLBTMask];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:LBT];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getLBT:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *LBT = [NSArray array];
    CDVPluginResult* pluginResult = nil;
    if (self.mReader) {
        LBT = [self.mReader getLBT];
        NSMutableArray *array = [NSMutableArray array];
        for (LbtItem *lbtItem in LBT) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            [dic setValue:[NSString stringWithFormat:@"%d",lbtItem.mSlot] forKey:@"mSlot"];
            [dic setValue:[NSString stringWithFormat:@"%d",lbtItem.mIsUsed] forKey:@"mIsUsed"];
            [array addObject:dic];
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:array];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:[NSArray array]];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setLBT:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    NSArray *lbtArray = [arguments objectAtIndex:0];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in lbtArray) {
        LbtItem *lbtItem = [[LbtItem alloc] initWithSlot:[[dic objectForKey:@"mSlot"] intValue] isUsed:[[dic objectForKey:@"mIsUsed"] boolValue]];
        [array addObject:lbtItem];
    }
    if (array.count > 0 && self.mReader) {
        [self.mReader setLBT:array];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getRevision:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *revision = @"";
    if (self.mReader) {
        revision = [self.mReader getRevision];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:revision];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)inventory:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader inventory];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stop:(CDVInvokedUrlCommand  *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader stop];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopSync:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader stopSync];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)softReset:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader softReset];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)hardReset:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader hardReset];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)defaultParameter:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader defaultParameter];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)saveParameter:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader saveParameter];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)loadDebugMessage:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader loadDebugMessage];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)enterBypassMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader enterBypassMode];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)enterBarcodeBypassMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader enterBarcodeBypassMode];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)leaveBypassMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader leaveBypassMode];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)clearEpcMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader clearEpcMask];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)saveEpcMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader saveEpcMask];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)wakeUpBarcode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (self.mReader) {
        [self.mReader wakeUpBarcode];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startDecode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader startDecode];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopDecode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader stopDecode];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)aimOff:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader aimOff];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)aimOn:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader aimOn];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)ledOff:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader ledOff];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)ledOn:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int i = 0;
    if (self.mReader) {
        i = [self.mReader ledOn];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:i];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setRegister:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    NSString *idx = [arguments objectAtIndex:0];
    if (self.mReader) {
        [self.mReader setRegister:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRegister:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *_register = @"";
    if (self.mReader) {
        _register = [self.mReader getRegister];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:_register];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setScanMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        if (idx == 0) {
            [self.mReader setScanMode:RFIDScanMode];
        }else {
            [self.mReader setScanMode:BarcodeScanMode];
        }
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setBuzzer:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    
    if (self.mReader) {
        switch (idx) {
            case 0: {
                self.mReader.buzzer = Buzzer_Off;
            }
                break;
            case 1: {
                self.mReader.buzzer = Buzzer_Low;
            }
                break;
            case 2: {
                self.mReader.buzzer = Buzzer_High;
            }
            break;
            default:
                break;
        }
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getBuzzer:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int buzzer = 0;
    
    if (self.mReader) {
        buzzer = self.mReader.buzzer;
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:buzzer];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setVibrator:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
   

    if (self.mReader) {
        switch (idx) {
            case 0: {
                self.mReader.vibrator = Vibrator_Off;
            }
                break;
            case 1: {
                self.mReader.vibrator = Vibrator_On;
            }
                break;
            default:
                break;
        }
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getVibrator:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int vibrator = 0;
    if (self.mReader) {
        vibrator = self.mReader.vibrator;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:vibrator];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setRegion:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
   
    if (self.mReader) {
        switch (idx) {
            case 0: {
                self.mReader.region = Region_Korea;
            }
                break;
            case 1: {
                self.mReader.region = Region_Japan;
            }
                break;
            case 2: {
                self.mReader.region = Region_USA;
            }
                break;
            case 3: {
                self.mReader.region = Region_China;
            }
                break;
            case 4: {
                self.mReader.region = Region_Tiwan;
            }
                break;
            case 5: {
                self.mReader.region = Region_Brazil;
            }
                break;
            case 6: {
                self.mReader.region = Region_Malaysia;
            }
                break;
            case 7: {
                self.mReader.region = Region_Asia;
            }
                break;
            default:
                break;
        }
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRegion:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int region = 0;
    if (self.mReader) {
        region = self.mReader.region;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:region];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setOperationTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    
    if (self.mReader) {
        self.mReader.operationTime = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getOperationTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int operationTime = 0;
    if (self.mReader) {
        operationTime = self.mReader.operationTime;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:operationTime];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setInventoryTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
   
    if (self.mReader) {
        self.mReader.inventoryTime = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getInventoryTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int inventoryTime = 0;
    if (self.mReader) {
        inventoryTime = self.mReader.inventoryTime;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:inventoryTime];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setIdleTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
   

    if (self.mReader) {
        self.mReader.idleTime = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getIdleTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idleTime = 0;
    if (self.mReader) {
        idleTime = self.mReader.idleTime;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idleTime];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setSleepTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    
    if (self.mReader) {
        self.mReader.sleepTime = idx;
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSleepTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idleTime = 0;
    if (self.mReader) {
        idleTime = self.mReader.sleepTime;
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idleTime];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setSameReportTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
   
    if (self.mReader) {
        self.mReader.sameReportTime = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSameReportTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int sameReportTime = 0;
    if (self.mReader) {
        sameReportTime = self.mReader.sameReportTime;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:sameReportTime];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setAutoOffTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.autoOffTime = idx;
    }

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getAutoOffTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int autoOffTime = 0;
    if (self.mReader) {
        autoOffTime = self.mReader.autoOffTime;
    }

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:autoOffTime];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setAccessPassword:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    NSString *idx = [arguments objectAtIndex:0];
    if (self.mReader) {
        self.mReader.accessPassword = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getAccessPassword:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *accessPassword = @"";
    if (self.mReader) {
        accessPassword = self.mReader.accessPassword;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:accessPassword];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setInventorySession:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        switch (idx) {
            case 0: {
                self.mReader.inventorySession = Session_S0;
            }
                break;
            case 1: {
                self.mReader.inventorySession = Session_S1;
            }
                break;
            case 2: {
                self.mReader.inventorySession = Session_S2;
            }
                break;
            case 3: {
                self.mReader.inventorySession = Session_S3;
            }
                break;
            default:
                break;
        }
    }
    
   
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getInventorySession:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int inventorySession = 0;
    if (self.mReader) {
        inventorySession = self.mReader.inventorySession;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:inventorySession];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setSessionFlag:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];

    
    if (self.mReader) {
        switch (idx) {
            case 0: {
                self.mReader.sessionFlag = SessionFlag_A;
            }
            break;
            case 1: {
                self.mReader.sessionFlag = SessionFlag_B;
            }
            break;
            case 2: {
                self.mReader.sessionFlag = SessionFlag_AB;
            }
            break;
            default:
            break;
        }
    }
    

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSessionFlag:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int sessionFlag = 0;
    if (self.mReader) {
        sessionFlag = self.mReader.sessionFlag;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:sessionFlag];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setSerialNumber:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    NSString *idx = [arguments objectAtIndex:0];
    if (self.mReader) {
        self.mReader.serialNumber = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSerialNumber:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *serialNumber;
    if (self.mReader) {
        serialNumber = [self.mReader serialNumber];
    }
    if (!serialNumber) {
        serialNumber = @"";
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:serialNumber];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setRemoteMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        self.mReader.remoteMode = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRemoteMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL remoteMode = NO;
    if (self.mReader) {
        remoteMode = self.mReader.remoteMode;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:remoteMode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setContinuousMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        self.mReader.continuousMode = idx;
    }
    
    
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getContinuousMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL continuousMode = NO;
    if (self.mReader) {
        continuousMode = self.mReader.continuousMode;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:continuousMode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setLimitTagCount:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.limitTagCount = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getLimitTagCount:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int limitTagCount = 0;
    if (self.mReader) {
        limitTagCount = self.mReader.limitTagCount;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:limitTagCount];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUseSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        switch (idx) {
            case 0: {
                self.mReader.useSelectionMask = SelectFlag_NotUsed;
            }
            break;
            case 1: {
                self.mReader.useSelectionMask = SelectFlag_SL;
            }
            break;
            case 2: {
                self.mReader.useSelectionMask = SelectFlag_NOT_SL;
            }
            break;
            case 3: {
                self.mReader.useSelectionMask = SelectFlag_All;
            }
            break;
            default:
            break;
        }
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getUseSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int useSelectionMask = 0;
    if (self.mReader) {
        useSelectionMask = self.mReader.useSelectionMask;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:useSelectionMask];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setReportMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        self.mReader.reportMode = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getReportMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL reportMode = NO;
    if (self.mReader) {
        reportMode = self.mReader.reportMode;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:reportMode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setStoredMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        self.mReader.storedMode = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getStoredMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL storedMode = NO;
    if (self.mReader) {
        storedMode = self.mReader.storedMode;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:storedMode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setRssiMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        self.mReader.rssiMode = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRssiMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL rssiMode = NO;
    if (self.mReader) {
        rssiMode = self.mReader.rssiMode;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:rssiMode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setEpcMaskMatchMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        self.mReader.epcMaskMatchMode = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getEpcMaskMatchMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL epcMaskMatchMode = NO;
    if (self.mReader) {
        epcMaskMatchMode = self.mReader.epcMaskMatchMode;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:epcMaskMatchMode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaskTarget:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskTarget = 0;
    if (self.mReader) {
        maskTarget = [self.mReader getMaskTarget:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:maskTarget];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskTarget:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskTarget = [[arguments objectAtIndex:1] intValue];
    MaskTargetType maskTargetType;
    switch (maskTarget) {
        case 0: {
            maskTargetType = MaskTarget_S0;
        }
            break;
        case 1: {
            maskTargetType = MaskTarget_S1;
        }
            break;
        case 2: {
            maskTargetType = MaskTarget_S2;
        }
            break;
        case 3: {
            maskTargetType = MaskTarget_S3;
        }
            break;
        case 4: {
            maskTargetType = MaskTarget_SL;
        }
            break;
        default:
            break;
    }
    if (self.mReader) {
        [self.mReader setMaskTarget:idx maskTargetType:maskTargetType];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaskAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskAction = 0;
    if (self.mReader) {
        maskAction = [self.mReader getMaskAction:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:maskAction];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskTarget = [[arguments objectAtIndex:1] intValue];
    MaskActionType maskActionType;
    switch (maskTarget) {
        case 0: {
            maskActionType = MaskAction_AB;
        }
            break;
        case 1: {
            maskActionType = MaskAction_AN;
        }
            break;
        case 2: {
            maskActionType = MaskAction_NB;
        }
            break;
        case 3: {
            maskActionType = MaskAction_MN;
        }
            break;
        case 4: {
            maskActionType = MaskAction_BA;
        }
            break;
        case 5: {
            maskActionType = MaskAction_BN;
        }
            break;
        case 6: {
            maskActionType = MaskAction_NA;
        }
            break;
        case 7: {
            maskActionType = MaskAction_NM;
        }
            break;
        default:
            break;
    }
    if (self.mReader) {
        [self.mReader setMaskAction:idx maskActionType:maskActionType];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaskBank:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskBank = 0;
    if (self.mReader) {
        maskBank = [self.mReader getMaskBank:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:maskBank];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskBank:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskBank = [[arguments objectAtIndex:1] intValue];
    MemoryBank bank;
    switch (maskBank) {
        case 0: {
            bank = Bank_Reserved;
        }
            break;
        case 1: {
            bank = Bank_EPC;
        }
            break;
        case 2: {
            bank = Bank_TID;
        }
            break;
        case 3: {
            bank = Bank_User;
        }
            break;
        default:
            break;
    }
    if (self.mReader) {
        [self.mReader setMaskBank:idx maskBank:bank];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaskOffset:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int maskOffset = 0;
    if (self.mReader) {
        maskOffset = [self.mReader getMaskOffset:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:maskOffset];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskOffset:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int offset = [[arguments objectAtIndex:1] intValue];
    if (self.mReader) {
        [self.mReader setMaskOffset:idx maskOffset:offset];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    NSArray *mask = [NSArray array];
    if (self.mReader) {
        mask = [self.mReader getMask:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:mask];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    NSString *mask = [arguments objectAtIndex:1];
    if (self.mReader) {
        [self.mReader setMask:idx mask:mask];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskWithLength:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    NSString *mask = [arguments objectAtIndex:1];
    int length = [[arguments objectAtIndex:2] intValue];
    if (self.mReader) {
        [self.mReader setMask:idx mask:mask length:length];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaskUsed:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    BOOL maskUsed = NO;
    if (self.mReader) {
        maskUsed = [self.mReader getMaskUsed:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:maskUsed];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskUsed:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    BOOL maskUsed = [[arguments objectAtIndex:1] boolValue];
    if (self.mReader) {
        [self.mReader setMaskUsed:idx used:maskUsed];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setAlgorithm:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    
    AlgorithmType algorithmType;
    switch (idx) {
        case 0: {
            algorithmType = FixedQ;
        }
            break;
        case 1: {
            algorithmType = DynamicQ;
        }
            break;
        default:
            break;
    }
    
    
        if (self.mReader) {
        [self.mReader setAlgorithm:algorithmType];
    }
    
   
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getAlgorithm:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = [self.mReader getAlgorithm];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMinQ:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.minQ = idx;
    }
   
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMinQ:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.minQ;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaxQ:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.maxQ = idx;
    }
   
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaxQ:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.maxQ;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setQValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        [self.mReader setQValue:idx];
    }
   
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getQValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.qValue;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setLinkProfileValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.linkProfileValue = idx;
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getLinkProfileValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.linkProfileValue;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setDefaultLinkProfileValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.defaultLinkProfileValue = idx;
    }
   
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getDefaultLinkProfileValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.defaultLinkProfileValue;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setMaskTypeValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        self.mReader.maskTypeValue = idx;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getMaskTypeValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = self.mReader.maskTypeValue;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isBarcodeModule:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL idx = NO;
    if (self.mReader) {
        idx = [self.mReader isBarcodeModule];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setBarcodeContinueMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        [self.mReader setBarcodeContinueMode:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setTagDataType:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        [self.mReader setTagDataType:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setPropBarcodeMode:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL idx = [[arguments objectAtIndex:0] boolValue];
    if (self.mReader) {
        [self.mReader setPropBarcodeMode:idx];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getReaderType:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = [self.mReader getReaderType];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)isRFIDModule:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    BOOL idx = NO;
    if (self.mReader) {
        idx = [self.mReader isRFIDModule];
    }

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)disconnect:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    if (self.mReader) {
        [self.mReader disconnect];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getAction:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    int idx = 0;
    if (self.mReader) {
        idx = [self.mReader getAction];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:idx];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)readMemory:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int maskBank = [[arguments objectAtIndex:0] intValue];
    int offset = [[arguments objectAtIndex:1] intValue];
    int length = [[arguments objectAtIndex:2] intValue];
    MemoryBank bank;
    switch (maskBank) {
        case 0: {
            bank = Bank_Reserved;
        }
            break;
        case 1: {
            bank = Bank_EPC;
        }
            break;
        case 2: {
            bank = Bank_TID;
        }
            break;
        case 3: {
            bank = Bank_User;
        }
            break;
        default:
            break;
    }
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader readMemory:bank offset:offset length:length];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)writeMemory:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int maskBank = [[arguments objectAtIndex:0] intValue];
    int offset = [[arguments objectAtIndex:1] intValue];
    NSString *value = [arguments objectAtIndex:2];
    MemoryBank bank;
    switch (maskBank) {
        case 0: {
            bank = Bank_Reserved;
        }
            break;
        case 1: {
            bank = Bank_EPC;
        }
            break;
        case 2: {
            bank = Bank_TID;
        }
            break;
        case 3: {
            bank = Bank_User;
        }
            break;
        default:
            break;
    }
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader writeMemory:bank offset:offset value:value];
    }

    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)lock:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL killPassword = [[arguments objectAtIndex:0] boolValue];
    BOOL accessPassword = [[arguments objectAtIndex:1] boolValue];
    BOOL epc = [[arguments objectAtIndex:2] boolValue];
    BOOL tid = [[arguments objectAtIndex:3] boolValue];
    BOOL user = [[arguments objectAtIndex:4] boolValue];
    LockParam *lockParam = [[LockParam alloc] init];
    lockParam.killPassword = killPassword;
    lockParam.accessPassword = accessPassword;
    lockParam.epc = epc;
    lockParam.tid = tid;
    lockParam.user = user;
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader lock:lockParam];
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)unlock:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL killPassword = [[arguments objectAtIndex:0] boolValue];
    BOOL accessPassword = [[arguments objectAtIndex:1] boolValue];
    BOOL epc = [[arguments objectAtIndex:2] boolValue];
    BOOL tid = [[arguments objectAtIndex:3] boolValue];
    BOOL user = [[arguments objectAtIndex:4] boolValue];
    LockParam *lockParam = [[LockParam alloc] init];
    lockParam.killPassword = killPassword;
    lockParam.accessPassword = accessPassword;
    lockParam.epc = epc;
    lockParam.tid = tid;
    lockParam.user = user;
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader unlock:lockParam];
    }
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)permaLock:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    BOOL killPassword = [[arguments objectAtIndex:0] boolValue];
    BOOL accessPassword = [[arguments objectAtIndex:1] boolValue];
    BOOL epc = [[arguments objectAtIndex:2] boolValue];
    BOOL tid = [[arguments objectAtIndex:3] boolValue];
    BOOL user = [[arguments objectAtIndex:4] boolValue];
    LockParam *lockParam = [[LockParam alloc] init];
    lockParam.killPassword = killPassword;
    lockParam.accessPassword = accessPassword;
    lockParam.epc = epc;
    lockParam.tid = tid;
    lockParam.user = user;
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader permaLock:lockParam];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)kill:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    NSString *killPassword = [arguments objectAtIndex:0];
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader kill:killPassword];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)blockWrite:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int maskBank = [[arguments objectAtIndex:0] intValue];
    int offset = [[arguments objectAtIndex:1] intValue];
    NSString *value = [arguments objectAtIndex:2];
    MemoryBank bank;
    switch (maskBank) {
        case 0: {
            bank = Bank_Reserved;
        }
            break;
        case 1: {
            bank = Bank_EPC;
        }
            break;
        case 2: {
            bank = Bank_TID;
        }
            break;
        case 3: {
            bank = Bank_User;
        }
            break;
        default:
            break;
    }
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader blockWrite:bank offset:offset value:value];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)blockErase:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int maskBank = [[arguments objectAtIndex:0] intValue];
    int offset = [[arguments objectAtIndex:1] intValue];
    int length = [[arguments objectAtIndex:2] intValue];
    MemoryBank bank;
    switch (maskBank) {
        case 0: {
            bank = Bank_Reserved;
        }
            break;
        case 1: {
            bank = Bank_EPC;
        }
            break;
        case 2: {
            bank = Bank_TID;
        }
            break;
        case 3: {
            bank = Bank_User;
        }
            break;
        default:
            break;
    }
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader blockErase:bank offset:offset length:length];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addEpcMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int offset = [[arguments objectAtIndex:0] intValue];
    int length = [[arguments objectAtIndex:1] intValue];
    NSString *mask = [arguments objectAtIndex:2];
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader addEpcMask:offset length:length mask:mask];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addEpcMaskWithAsSelectMaskEPCParam:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int offset = [[arguments objectAtIndex:0] intValue];
    int length = [[arguments objectAtIndex:1] intValue];
    NSString *mask = [arguments objectAtIndex:2];
    AsSelectMaskEPCParam *asSelectMaskEPCParam = [[AsSelectMaskEPCParam alloc] init];
    asSelectMaskEPCParam.offset = offset;
    asSelectMaskEPCParam.length = length;
    asSelectMaskEPCParam.mask = mask;
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader addEpcMask:asSelectMaskEPCParam];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getEpcMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    AsSelectMaskEPCParam *asSelectMaskEPCParam;
    if (self.mReader) {
        asSelectMaskEPCParam = [self.mReader getEpcMask:idx];
    }
    if (asSelectMaskEPCParam) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskEPCParam.offset] forKey:@"offset"];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskEPCParam.length] forKey:@"length"];
        [dic setValue:asSelectMaskEPCParam.mask forKey:@"mask"];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to get epc mask."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)usedSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    BOOL result = NO;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (self.mReader) {
        result = [self.mReader usedSelectionMask:idx];
        [dic setValue:[NSString stringWithFormat:@"%d",result] forKey:@"result"];
        [dic setValue:[NSString stringWithFormat:@"%d",idx] forKey:@"index"];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    AsSelectMaskParam *asSelectMaskParam;
    if (self.mReader) {
        asSelectMaskParam = [self.mReader getSelectionMask:idx];
    }
    if (asSelectMaskParam) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskParam.target] forKey:@"target"];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskParam.action] forKey:@"action"];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskParam.bank] forKey:@"bank"];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskParam.offset] forKey:@"offset"];
        [dic setValue:[NSString stringWithFormat:@"%@",asSelectMaskParam.mask] forKey:@"mask"];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskParam.length] forKey:@"length"];
        [dic setValue:[NSString stringWithFormat:@"%d",asSelectMaskParam.used] forKey:@"used"];
        
       
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to get selection mask."];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    int target = [[arguments objectAtIndex:1] intValue];
    int action = [[arguments objectAtIndex:2] intValue];
    int bank = [[arguments objectAtIndex:3] intValue];
    int offset = [[arguments objectAtIndex:4] intValue];
    NSString *mask = [arguments objectAtIndex:5];
    int length = [[arguments objectAtIndex:6] intValue];
    BOOL used = [[arguments objectAtIndex:7] boolValue];
   
    
    AsSelectMaskParam *asSelectMaskParam;
    if (self.mReader) {
        asSelectMaskParam = [[AsSelectMaskParam alloc] initWithIndex:idx];
        asSelectMaskParam.target = (MaskTargetType)target;
        asSelectMaskParam.action = (MaskActionType)action;
        asSelectMaskParam.bank = (MemoryBank)bank;
        asSelectMaskParam.offset = offset;
        asSelectMaskParam.mask = mask;
        asSelectMaskParam.length = length;
        asSelectMaskParam.used = used;
        [self.mReader setSelectionMask:idx withParam:asSelectMaskParam];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)removeSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    if (self.mReader) {
        [self.mReader removeSelectionMask:idx];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)clearSelectionMask:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    
    
    if (self.mReader) {
        [self.mReader clearSelectionMask];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    }
   

    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getBluetoothAddress:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *bluetoothAddress;
    if (self.mReader) {
        bluetoothAddress = self.mReader.mAsReaderGUN.address;
    }
    if (!bluetoothAddress) {
        bluetoothAddress = @"";
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:bluetoothAddress];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getDeviceModel:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *deviceModel;
    if (self.mReader) {
        deviceModel = self.mReader.mAsReaderGUN.deviceModel;
    }
    if (!deviceModel) {
        deviceModel = @"";
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceModel];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setDeviceModel:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    NSString *deviceModel = [arguments objectAtIndex:0];
    if (self.mReader) {
        self.mReader.mAsReaderGUN.deviceModel = deviceModel;
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getBarcodeParam:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    int idx = [[arguments objectAtIndex:0] intValue];
    AsParamValue *val;
    if (self.mReader) {
        val = [self.mReader getBarcodeParam:[NSNumber numberWithInt:idx]];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (val.paramName) {
        [dic setValue:[NSString stringWithFormat:@"%d",val.paramName] forKey:@"paramName"];
        [dic setValue:[NSString stringWithFormat:@"%d",val.value] forKey:@"value"];
    }else {
        [dic setValue:@"" forKey:@"paramName"];
        [dic setValue:@"" forKey:@"value"];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setBarcodeParam:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;
    int paramName = [[arguments objectAtIndex:0] intValue];
    NSString *value = [arguments objectAtIndex:1];
    ResultCode res = ResultNoError;
    if (self.mReader) {
        AsParamValue *val = [[AsParamValue alloc] init];
        val.paramName = (ParamName)paramName;
        [val setEnabled:[value boolValue]];
        res = [self.mReader setBarcodeParam:val];
    }
    if (res == ResultNoError) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    }else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:NO];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getLBTFrequency:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;
    int idx = [[arguments objectAtIndex:0] intValue];
    int slot = [[arguments objectAtIndex:1] intValue];
    NSString *LBTFrequency = @"";
    if (self.mReader) {
        LBTFrequency = [self.mReader getLBTFrequency:slot];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSString stringWithFormat:@"%d",idx] forKey:@"index"];
    [dic setValue:[NSString stringWithFormat:@"%@",LBTFrequency] forKey:@"frequency"];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startBuzzerWithBuzzerTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;
    int buzzerTime = [[arguments objectAtIndex:0] intValue];
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader startBuzzerWithBuzzerTime:buzzerTime];
    }
    
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startVibratorWithVibratorTime:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSArray *arguments = command.arguments;
    CDVPluginResult* pluginResult = nil;
    int vibratorTime = [[arguments objectAtIndex:0] intValue];
    int resultCode = 0;
    if (self.mReader) {
        resultCode = [self.mReader startVibratorWithVibratorTime:vibratorTime];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:resultCode];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)asMaskActionTypeToString:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    MaskActionType actionType = (MaskActionType)[[arguments objectAtIndex:0] intValue];
    MaskTargetType targetType = (MaskTargetType)[[arguments objectAtIndex:1] intValue];
    NSString *str = [AsMaskActionType toString:actionType targetType:targetType]?:@"";
    NSArray* maskTargetArray = [str componentsSeparatedByString:@"\r\n"];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:maskTargetArray];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)setReaderInitializedListener:(CDVInvokedUrlCommand *)command {
    
    NSLog(@"%s,called",__PRETTY_FUNCTION__);

    readerInitializedListenerCallbackId = command.callbackId;
}
- (void)setUpdateDeviceStateListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    updateDeviceStateListenerCallbackId = command.callbackId;
}
- (void)setReadTagListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    readTagListenerCallbackId = command.callbackId;
}
- (void)setChangedActionStateListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    changedActionStateListenerCallbackId = command.callbackId;
}
- (void)setChangedRemoteKeyListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    changedRemoteKeyListenerCallbackId = command.callbackId;
}
- (void)setDetectBarcodeStringListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    detectBarcodeStringListenerCallbackId = command.callbackId;
}
- (void)setDetectBarcodeDataListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    detectBarcodeDataListenerCallbackId = command.callbackId;
}
- (void)setAccessResultListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    accessResultListenerCallbackId = command.callbackId;
}
- (void)setCommandCompleteListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    commandCompleteListenerCallbackId = command.callbackId;
}
- (void)setOnAsReaderLeftModeKeyEventListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    onAsReaderLeftModeKeyEventListenerCallbackId = command.callbackId;
}
- (void)setOnAsReaderRightModeKeyEventListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    onAsReaderRightModeKeyEventListenerCallbackId = command.callbackId;
}
- (void)setOnAsReaderTriggerKeyEventListener:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    onAsReaderTriggerKeyEventListenerCallbackId = command.callbackId;
}


- (void)setAsReaderTriggerKeyEventReturnValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    asReaderTriggerKeyEventReturnValue = [[arguments objectAtIndex:0] boolValue];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setAsReaderLeftModeKeyEventReturnValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    asReaderLeftModeKeyEventReturnValue = [[arguments objectAtIndex:0] boolValue];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setAsReaderRightModeKeyEventReturnValue:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    asReaderRightModeKeyEventReturnValue = [[arguments objectAtIndex:0] boolValue];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



#pragma mark ---AsReaderDelegate---
- (BOOL)onAsReaderTriggerKeyEvent:(BOOL)status{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:onAsReaderTriggerKeyEventListenerCallbackId];
    return asReaderTriggerKeyEventReturnValue;
}
- (BOOL)onAsReaderLeftModeKeyEvent:(BOOL)status{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:onAsReaderLeftModeKeyEventListenerCallbackId];
    return asReaderLeftModeKeyEventReturnValue;
}
- (BOOL)onAsReaderRightModeKeyEvent:(BOOL)status{
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:status];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:onAsReaderRightModeKeyEventListenerCallbackId];
    return asReaderRightModeKeyEventReturnValue;
}

- (void)readerInitialized:(AsReader *)reader {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:readerInitializedListenerCallbackId];
}

- (void)updateDeviceState:(ResultCode)error {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:error];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:updateDeviceStateListenerCallbackId];
}
- (void)readTag:(NSString *)tag rssi:(float)rssi phase:(float)phase frequency:(float)frequency {
    dispatch_queue_t queue =  dispatch_queue_create("queue",DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"%s,called",__PRETTY_FUNCTION__);
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:tag forKey:@"tag"];
        [dic setValue:[NSString stringWithFormat:@"%f",rssi] forKey:@"rssi"];
        [dic setValue:[NSString stringWithFormat:@"%f",phase] forKey:@"phase"];
        [dic setValue:[NSString stringWithFormat:@"%f",frequency] forKey:@"frequency"];
        
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:readTagListenerCallbackId];
    });
}
- (void)changedActionState:(CommandType)action resultCode:(NSInteger)resultCode {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSLog(@"Action : %02X", action);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:action];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:changedActionStateListenerCallbackId];
}
- (void)changedRemoteKey:(int)state {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:state];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:changedRemoteKeyListenerCallbackId];
}
- (void)detectBarcode:(BarcodeType)barcodeType codeId:(NSString *)codeId barcode:(NSString *)barcode {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSLog(@" barcodeType = %02x- codeId = %@ - barcode = %@",barcodeType,codeId,barcode);
    if (barcodeType != BarcodeTypeNoRead) {
        NSString *barcodeTypeStr = [self getBarcodeString:barcodeType];
        CDVPluginResult* pluginResult = nil;
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:barcodeTypeStr,@"barcodeType",barcode,@"barcode",codeId,@"codeId", nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        [pluginResult setKeepCallbackAsBool:YES];
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:detectBarcodeStringListenerCallbackId];
    }else {
        
    }
}- (void)detectBarcode:(BarcodeType)barcodeType codeId:(NSString *)codeId barcodeData:(NSData *)barcodeData {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSLog(@" barcodeType = %02x- codeId = %@ - barcode = %@",barcodeType,codeId,barcodeData);
    if (barcodeType != BarcodeTypeNoRead) {
        NSString *barcodeTypeStr = [self getBarcodeString:barcodeType];
        CDVPluginResult* pluginResult = nil;
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:barcodeTypeStr,@"barcodeType",barcodeData,@"barcode", nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:detectBarcodeDataListenerCallbackId];
    }else {
        
    }
}

- (void)accessResult:(ResultCode)error actionState:(CommandType)action epc:(NSString *)epc data:(NSString *)data rssi:(float)rssi phase:(float)phase {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSString stringWithFormat:@"%d",error] forKey:@"error"];
    [dic setValue:[NSString stringWithFormat:@"%d",action] forKey:@"action"];
    [dic setValue:[NSString stringWithFormat:@"%@",epc] forKey:@"epc"];
    [dic setValue:[NSString stringWithFormat:@"%@",data] forKey:@"data"];
    [dic setValue:[NSString stringWithFormat:@"%f",rssi] forKey:@"rssi"];
    [dic setValue:[NSString stringWithFormat:@"%f",phase] forKey:@"phase"];
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dic];
    [pluginResult setKeepCallbackAsBool:YES];
    
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:accessResultListenerCallbackId];
}
- (void)commandComplete:(CommandType)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:command];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandCompleteListenerCallbackId];
}

- (NSString *)getBarcodeString:(BarcodeType)barcodeType {
    switch (barcodeType) {
        case BarcodeTypeNoRead:
            return @"No Read";
        case BarcodeTypeAustralianPost:
            return @"Australian Post";
        case BarcodeTypeAztecCode:
            return @"Aztec Code";
        case BarcodeTypeBooklandEAN:
            return @"Bookland EAN";
        case BarcodeTypeBritishPost:
            return @"British Post";
        case BarcodeTypeCanadianPost:
            return @"Canadian Post";
        case BarcodeTypeChinaPost:
            return @"China Post";
        case BarcodeTypeCodabar:
            return @"Codabar";
        case BarcodeTypeCodablockF:
            return @"Codablock F";
        case BarcodeTypeCode11:
            return @"Code 11";
        case BarcodeTypeCode128:
            return @"Code 128";
        case BarcodeTypeCode16K:
            return @"Code 16K";
        case BarcodeTypeCode32:
            return @"Code 32";
        case BarcodeTypeCode39:
            return @"Code 39";
        case BarcodeTypeCode49:
            return @"Code 49";
        case BarcodeTypeCode93:
            return @"Code 93";
        case BarcodeTypeComposite:
            return @"EAN-UCC Composite Code";
        case BarcodeTypeD2of5:
            return @"Discreate 2 of 5";
        case BarcodeTypeDataMatrix:
            return @"Data Matrix";
        case BarcodeTypeEAN128:
            return @"UCC/EAN-128";
        case BarcodeTypeEAN13:
            return @"EAN-13";
        case BarcodeTypeEAN13CouponCode:
            return @"EAN-13 with Extended Coupon Code";
        case BarcodeTypeEAN8:
            return @"EAN-8";
        case BarcodeTypeI2of5:
            return @"Interleaved 2 of 5";
        case BarcodeTypeIATA:
            return @"IATA 2 of 5";
        case BarcodeTypeISBT128:
            return @"ISBT 128";
        case BarcodeTypeISBT128Concat:
            return @"ISBT-128 Concat.";
        case BarcodeTypeJapanesePost:
            return @"Japanese Post";
        case BarcodeTypeKixPost:
            return @"Kix (Netherlands) Post";
        case BarcodeTypeKoreaPost:
            return @"Korea Post";
        case BarcodeTypeMacroMicroPDF:
            return @"Macro Micro PDF";
        case BarcodeTypeMaxiCode:
            return @"MaxiCode";
        case BarcodeTypeMicroPDF:
            return @"Micro PDF 417";
        case BarcodeTypeMSI:
            return @"MSI";
        case BarcodeTypeMultipacketFormat:
            return @"";
        case BarcodeTypeOCR:
            return @"OCR";
        case BarcodeTypeParameterFNC3:
            return @"Parameter (FNC3)";
        case BarcodeTypePDF417:
            return @"PDF-417";
        case BarcodeTypePlanetCode:
            return @"Planet Code";
        case BarcodeTypePlesseyCode:
            return @"Plessey Code";
        case BarcodeTypePosiCode:
            return @"PosiCode";
        case BarcodeTypePostnet:
            return @"Postnet";
        case BarcodeTypeQRCode:
            return @"QR Code";
        case BarcodeTypeR2of5:
            return @"Straight 2 of 5";
        case BarcodeTypeRSS:
            return @"RSS";
        case BarcodeTypeScanletWebcode:
            return @"Scanlet Webcode";
        case BarcodeTypeTelepen:
            return @"Telepen";
        case BarcodeTypeTLC39:
            return @"TCIF Linked Code 39";
        case BarcodeTypeTriopticCode:
            return @"Trioptic Code 39";
        case BarcodeTypeUPCA:
            return @"UPC-A";
        case BarcodeTypeUPCE:
            return @"UPC-E";
        case BarcodeTypeVeriCode:
            return @"VeriCode";
        case BarcodeTypeX2of5:
            return @"Matrix 2 of 5";
        case BarcodeTypeChineseSensible:
            return @"Chinese-Sensible Code";
        case BarcodeTypeRSSLimited:
            return @"DataBar";
        case BarcodeTypeRSSExpanded:
            return @"Compostie";
        default:
            return @"Unknown";
    }
}
#pragma mark ---AsRingDeviceSDK---
- (void)getAsRingModelNumber:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *asRingModelNumber = @"";
    if (self.mReader) {
        asRingModelNumber = [[AsRingDeviceSDK sharedAsRingDeviceSDK] getAsRingModelNumber];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:asRingModelNumber];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)getAsRingSerialNumber:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *asRingSerialNumber = @"";
    if (self.mReader) {
        asRingSerialNumber = [[AsRingDeviceSDK sharedAsRingDeviceSDK] getAsRingSerialNumber];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:asRingSerialNumber];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getAsRingFirmwareRevision:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *asRingFirmwareRevision = @"";
    if (self.mReader) {
        asRingFirmwareRevision = [[AsRingDeviceSDK sharedAsRingDeviceSDK] getAsRingFirmwareRevision];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:asRingFirmwareRevision];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getAsRingHardwareRevision:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    NSString *asRingHardwareRevision = @"";
    if (self.mReader) {
        asRingHardwareRevision = [[AsRingDeviceSDK sharedAsRingDeviceSDK] getAsRingHardwareRevision];
    }
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:asRingHardwareRevision];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)outputRFIDCSV:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    NSArray *array = [arguments objectAtIndex:0];
    BOOL isEpc = [[arguments objectAtIndex:1] boolValue];
    if (array.count > 0) {
        if ([CSVData isFileExist:@"rfid.csv"]) {
            [CSVData deleteFileForFileName:@"rfid.csv"];
        }
        [CSVData createCSVWithFileName:@"rfid.csv"];
        [CSVData exportRfidCSV:@"rfid.csv" withArray:array isEpc:isEpc];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)outputBarocdeCSV:(CDVInvokedUrlCommand *)command {
    NSLog(@"%s,called",__PRETTY_FUNCTION__);
    CDVPluginResult* pluginResult = nil;
    NSArray *arguments = command.arguments;
    NSArray *array = [arguments objectAtIndex:0];
    if (array.count > 0) {
        if ([CSVData isFileExist:@"barcode.csv"]) {
            [CSVData deleteFileForFileName:@"barcode.csv"];
        }
        [CSVData createCSVWithFileName:@"barcode.csv"];
        [CSVData exportBarCodeCSV:@"barcode.csv" withArray:array];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
