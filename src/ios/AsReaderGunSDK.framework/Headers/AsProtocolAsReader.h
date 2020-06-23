#import <Foundation/Foundation.h>
#import "AsRfidValues.h"
#import "AsPacket.h"
#import "AsReaderDelegate.h"
#import "AsReaderGUN.h"

#define WATCHER_INTERVAL        1

@interface AsProtocolAsReader : NSObject {
@private
    NSCondition *mRecvSync;
    NSThread *mRecvThread;
    NSThread *mWatchThread;
    NSMutableData *mRecvData;
    
    AsPacketManager *mPackets;
    CommandType mAction;
    
 	AsReaderGUN * mAsReaderGUN;
    BOOL mIsBarcodeContinueMode;
    BOOL isUserKeyStop;
    ReaderType _readertype;
}

@property (weak, nonatomic) id<AsReaderDelegate> delegate;
@property (nonatomic, assign) BOOL isBarcodeMode;
@property (nonatomic, assign) int dataType;
@property (nonatomic, assign) int versionCode;
@property (nonatomic, assign) BOOL isReportRssi;
@property (nonatomic, assign) ScanMode scanMode;


- (id)initWithAsReaderGUN:(AsReaderGUN *)asReaderGUN delegate:(id<AsReaderDelegate>)receiver;

- (void)disconnect;

- (CommandType)getAction;

- (NSString *)getProperty:(PropertyType)type;
- (NSString *)getProperty:(PropertyType)type withParameter:(NSString *)param;
- (ResultCode)setProperty:(PropertyType)type;
- (ResultCode)setProperty:(PropertyType)type withParameter:(NSString *)param;
- (ResultCode)command:(CommandType)command;
- (ResultCode)command:(CommandType)command withParameter:(NSString *)param;
- (AsResultData *)commandSync:(CommandType)command withParameter:(NSString *)param;
- (ResultCode)debug:(DebugType)debugType;
- (ResultCode)debug:(DebugType)debugType withParameter:(NSString*)param;
- (AsResultData *)debugSync:(DebugType)command withParameter:(NSString *)param;

- (void)wakeUpBarcode;
- (ResultCode)postSSI:(SSICommand)command;
- (ResultCode)postSSI:(SSICommand)command withData:(NSData*)data;
- (AsResultData *)sendSSI:(SSICommand)command;
- (AsResultData *)sendSSI:(SSICommand)command withData:(NSData*)data;

- (NSData *)getBarcodeProperty:(PropertyType)type withParameter:(NSData *)param;
- (AsResultData *)setBarcodeProperty:(PropertyType)type withParameter:(NSData *)param;
- (void)setBarcodeContinueMode:(BOOL)isContinueMode;

- (void) receiveData;

- (void) setReaderType:(ReaderType)readertype;
@end
