#import <Foundation/Foundation.h>
#import "AsProtocolAsReader.h"
#import "AsModuleAsReader.h"
#import "AsParamValue.h"
#import "AsReaderGUN.h"

#define TAG_PC_LENGTH               4

#define TAG_DATA_TYPE_ASCII         0
#define TAG_DATA_TYPE_HEX           1

#define BARCODE_NONE                0
#define BARCODE_POWER               1
#define BARCODE_AIM                 2
#define BARCODE_TRIGGER             4

#define MIN_SELECTION_MASK          0
#define MAX_SELECTION_MASK          8

#define MAX_LBT                     50
#define BARCODE_MODULE_ENABLED      0x08

#define VER_7_2_5_2                 0x07020502 
#define VER_5_2_2_28                0x0502021C
#define VER_6_0_0_00                0x06000000
#define VERSION_MASK                0x00FFFFFF
#define VER_X_2_2_1                 0x00020201
#define VER_X_2_2_6                 0x00020206
#define VER_X_2_2_20                0x00020214
#define VER_X_2_2_18                0x00020212
#define VER_X_2_2_28                0x0002021C

//#define VERSION_PREFIX              @"ar-"
#define MAX_VERSION                 4

#define VERSION_PREFIX_RFPRISMA  @"bl-"
#define VERSION_PRIFIX_ASREADER  @"ar-"

// Declare AlgorithmType Type Codes
typedef enum {
    FixedQ = 0,                 // 'Fixed Q Value'
    DynamicQ = 1                // 'Dynamic Q Value'
} AlgorithmType;

@protocol AsReaderDelegate;

@interface AsReader : NSObject {
@private
    AsProtocolAsReader *mProtocol;
    AsModuleAsReader *mModule;
    
    CommandType mAction;
    BOOL mIsResult;
    BOOL mIsBarcodeMode;
    
    int mVersionCode;
    
    NSMutableArray *mLbtMask;
}
 
- (id)initWithAsReaderGUN:(AsReaderGUN *)device delegate:(id<AsReaderDelegate>)delegate;

- (void)disconnect;

- (CommandType)getAction;
- (void)setDelegate:(id<AsReaderDelegate>)delegate;

- (void)setScanMode:(ScanMode)scanMode;
- (ScanMode)getScanMode;
- (ResultCode)inventory;
- (ResultCode)readMemory:(MemoryBank)bank offset:(int)offset length:(int)length;
- (ResultCode)writeMemory:(MemoryBank)bank offset:(int)offset value:(NSString *)value;
- (ResultCode)lock:(LockParam *)param;
- (ResultCode)unlock:(LockParam *)param;
- (ResultCode)permaLock:(LockParam *)param;
- (ResultCode)kill:(NSString *)killPassword;
- (ResultCode)blockWrite:(MemoryBank)bank offset:(int)offset value:(NSString *)value;
- (ResultCode)blockErase:(MemoryBank)bank offset:(int)offset length:(int)length;

- (ResultCode)stop;
- (ResultCode)stopSync; 

- (ResultCode)softReset;
- (ResultCode)hardReset;
- (ResultCode)defaultParameter;
- (ResultCode)saveParameter;
- (ResultCode)setDebugMode:(BOOL)enabled;
- (ResultCode)loadDebugMessage;
- (ResultCode)enterBypassMode;
- (ResultCode)enterBarcodeBypassMode;
- (ResultCode)leaveBypassMode;

- (NSString *)regionName;
- (NSString *)serialNumber;
- (NSString *)rFModuleVersion;

- (NSString *)firmwareVersion;
- (CMinMaxValue)powerGainRange;

- (int)storedCount;

- (int)batteryStatus;

- (ResultCode)clearEpcMask;
- (ResultCode)saveEpcMask;
- (int)epcMaskCount;
- (ResultCode)addEpcMask:(int) offset length:(int)length mask:(NSString *)mask;
- (ResultCode)addEpcMask:(AsSelectMaskEPCParam *)mask;
- (AsSelectMaskEPCParam *)getEpcMask:(int)index;

- (NSArray *)getLBTMask;
- (NSArray *)getLBT;
- (void)setLBT:(NSArray *)table;
- (NSString *)getLBTFrequency:(int)slot;
- (ResultCode)startBuzzerWithBuzzerTime:(int)buzzerTime;
- (ResultCode)startVibratorWithVibratorTime:(int)vibratorTime;

- (void)wakeUpBarcode;
- (ResultCode)startDecode;
- (ResultCode)stopDecode;
- (ResultCode)setBarcodeParam:(AsParamValue *)paramData;
- (NSArray *)getBarcodeParams:(NSArray *)paramData;
- (AsParamValue *)getBarcodeParam:(NSNumber *)paramData;
- (ResultCode)aimOff;
- (ResultCode)aimOn;
- (NSString *)getRevision;
- (ResultCode)ledOff;
- (ResultCode)ledOn;

- (BOOL)usedSelectionMask:(int)index;
- (AsSelectMaskParam *)getSelectionMask:(int)index;
- (void)setSelectionMask:(int)index withParam:(AsSelectMaskParam *)param;

- (void)removeSelectionMask:(int)index;
- (void)clearSelectionMask;


@property (nonatomic, strong) AsReaderGUN *mAsReaderGUN;

@property (nonatomic, assign) BuzzerState buzzer;
@property (nonatomic, assign) VibratorState vibrator;
@property (nonatomic, assign) RegionType region;
@property (nonatomic, assign) int operationTime;
@property (nonatomic, assign) int inventoryTime;
@property (nonatomic, assign) int idleTime;
@property (nonatomic, assign) int sleepTime;
@property (nonatomic, assign) int sameReportTime;
@property (nonatomic, assign) int autoOffTime;
@property (nonatomic, strong) NSString *accessPassword;
@property (nonatomic, assign) SessionType inventorySession;
@property (nonatomic, assign) SessionFlag sessionFlag;
@property (nonatomic, strong) AsSelectMaskParam *selectionMask;

@property (nonatomic, strong) NSDate *time;
@property (nonatomic, strong) NSString *serialNumber;

@property (nonatomic, assign) BOOL remoteMode;

@property (nonatomic, assign) BOOL continuousMode;
@property (nonatomic, assign) int limitTagCount;

@property (nonatomic, assign) int powerGain;
@property (nonatomic, assign) BOOL isUseKeyAction;

@property (nonatomic, assign) SelectFlag useSelectionMask;
@property (nonatomic, assign) BOOL reportMode;
@property (nonatomic, assign) BOOL storedMode;
@property (nonatomic, assign) BOOL rssiMode;

@property (nonatomic, assign) BOOL epcMaskMatchMode;

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

@property (nonatomic, assign) AlgorithmType algorithm;
- (AlgorithmType)getAlgorithm;

@property (nonatomic, assign) int minQ;
@property (nonatomic, assign) int maxQ;
@property (nonatomic, assign) int qValue;

@property (nonatomic, assign) int linkProfileValue;
@property (nonatomic, assign) int defaultLinkProfileValue;
@property (nonatomic, assign) int maskTypeValue;

- (NSString *)getRegister;
- (void)setRegister:(NSString *)value;

- (ResultCode)setBarcodeMode:(BOOL)enabled isKeyAction:(BOOL)isKeyOn;
- (BOOL)isBarcodeModule;
- (BOOL)isRFIDModule;
- (void)setBarcodeContinueMode:(BOOL)isContinueMode;

- (void)setTagDataType:(int)value;

- (void)setPropBarcodeMode:(BOOL)mode;
- (ReaderType) getReaderType;

@end
