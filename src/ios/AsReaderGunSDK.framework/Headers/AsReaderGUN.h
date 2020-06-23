#import <Foundation/Foundation.h>
#import <AsRingAccessorySDK/AsRingAccessorySDK.h>

#define BYTE                            unsigned char
#define LPBYTE                          BYTE *

@protocol AsReaderGUNReadDataDelegate <NSObject>

- (void)readData:(NSData *)data;

@end

@interface AsReaderGUN : AsRingAccessoryBaseSDK

@property (weak, nonatomic) id<AsReaderGUNReadDataDelegate> delegate;
@property (strong,nonatomic) NSString * deviceModel;
@property (assign,nonatomic) BOOL isConnect;

- (instancetype)initWithDeviceModel:(NSString *)deviceModel;
- (NSString *)deviceModel;
- (NSString *)address;

- (void)disconnect;
- (void)writeData:(NSData *)data;
- (NSString *)getAsReaderGUNVersion;

@end
