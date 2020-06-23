#import <Foundation/Foundation.h>
#import "AsProtocolAsReader.h"
#import "AsRfidValues.h"

#define NIBBLE_UNIT                 4
#define MIN_OFFSET                  16

@protocol AsReaderDelegate;

@interface AsModuleAsReader : NSObject {
    AsProtocolAsReader* mProtocol;
    int mVersionCode;
    ReaderType _readertype;
}

- (id)initWithProtocol:(AsProtocolAsReader *)protocol;

- (NSString *)regionName;
- (NSString *)UHFVersion;

- (NSString *)firmwareVersion;
- (CMinMaxValue)powerGainRange;
- (ResultCode)readMemory:(MemoryBank)bank offset:(int)offset length:(int)length;
- (ResultCode)writeMemory:(MemoryBank)bank offset:(int)offset value:(NSString *)value;
- (ResultCode)lock:(int)action mask:(int)mask;
- (ResultCode)permaLock:(int)action mask:(int)mask;
- (ResultCode)kill:(NSString *)killPassword;
- (ResultCode)blockWrite:(MemoryBank)bank offset:(int)offset value:(NSString *)value;
- (ResultCode)blockErase:(MemoryBank)bank offset:(int)offset length:(int)length;
- (ResultCode)saveStoredTag:(NSString *)tag;

- (MaskTargetType)getMaskTarget:(int)index;
- (void)setMaskTarget:(int)index maskTargetType:(MaskTargetType)target;
- (MaskActionType)getMaskAction:(int)index;
- (void)setMaskAction:(int)index maskActionType:(MaskActionType)action;
- (MemoryBank)getMaskBank:(int)index;
- (void)setMaskBank:(int)index maskBank:(MemoryBank)bank;
- (int)getMaskOffset:(int)index;
- (void)setMaskOffset:(int)index maskOffset:(int)offset;
- (NSArray *)getMask:(int)index;
- (void)setMask:(int)index mask:(NSString *)mask;
- (void)setMask:(int)index mask:(NSString *)mask length:(int)length;

- (BOOL)getMaskUsed:(int)index;
- (void)setMaskUsed:(int)index used:(BOOL)used;

- (void)clearEpcMask;
- (void)saveEpcMask;
- (unsigned long long)getEpcMaskCount;
- (void)addEpcMask:(AsSelectMaskEPCParam *)param;
- (AsSelectMaskEPCParam *)getEpcMask:(int)index;

- (BOOL)getEpcMaskMatchMode;
- (void)setEpcMaskMatchMode:(BOOL)enabled;

- (unsigned long long)getLBTMask;
- (unsigned long long)getLBT;
- (void)setLBT:(long)table;
- (unsigned long long)getLBTFrequency:(int)index;

- (void)setTagDataType:(int)tagData;
- (NSData *)getBarcodeParam:(NSData *)data;
- (ResultCode)setBarcodeParam:(NSData *)data;
- (int)barcodePowerState;
- (void)setBarcodePowerState:(int)state;

- (int)getBarcodeState;
- (bool)getBarcodeMode;

- (void)setVersionCode:(int)versionCode;

- (void)setDebugMode:(BOOL)enabled;
- (BOOL)getDebugConfig:(NSString *) barcode;
- (void)setReaderType:(ReaderType)readertype;
@end
