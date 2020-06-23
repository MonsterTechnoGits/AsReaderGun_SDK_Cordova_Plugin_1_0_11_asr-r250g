#import <Foundation/Foundation.h>

#pragma makr - Declare Enumerlator

typedef enum {
    ResultNoError = 0x0000,
    // Device Error
    ResultOtherError = 0x0001,
    ResultUndefined = 0x0002,
    ResultMemoryOverrun = 0x0003,
    ResultMemoryLocked = 0x0004,
    ResultInsufficientPower = 0x000B,
    ResultNonSpecificError = 0x000F,
    // SDK Error
    ResultInOperation = 0xE000,
    ResultOutOfRange = 0xE001,
    ResultNotConnected = 0xE100,
    ResultInvalidParameter = 0xE200,
    ResultInvalidResponse = 0xE300,
    ResultNotSupportFirmware = 0xEE00,
    ResultTimeout = 0xEFFF,
    // Operation Error
    ResultHandleMismatch = 0xF001,
    ResultCRCError = 0xF002,
    ResultNoTagReply = 0xF003,
    ResultInvalidPassword = 0xF004,
    ResultZeroKillPassword = 0xF005,
    ResultTagLost = 0xF006,
    ResultCommandFormatError = 0xF007,
    ResultReadCountInvalid = 0xF008,
    ResultOutOfRetries = 0xF009,
    ResultParamError = 0xFFFB,
    ResultBusy = 0xFFFC,
    ResultInvalidCommand = 0xFFFD,
    ResultLowBattery = 0xFFFE,
    ResultOperationFailed = 0xFFFF
} ResultCode;

typedef enum {
    Bank_Reserved,
    Bank_EPC,
    Bank_TID,
    Bank_User
} MemoryBank;

typedef enum {
    Lock_NoChange,
    Lock_Unlock,
    Lock_Lock,
    Lock_PermaLock
} LockState;

typedef enum {
    Buzzer_Off,
    Buzzer_Low,
    Buzzer_High
} BuzzerState;

typedef enum {
    Vibrator_Off,
    Vibrator_On,
} VibratorState;

typedef enum {
    Region_Korea,
    Region_Japan,
    Region_Euro,
    Region_USA,
    Region_China,
    Region_Tiwan,
    Region_Brazil,
    Region_Malaysia,
    Region_Asia
} RegionType;

typedef enum {
    Session_S0,
    Session_S1,
    Session_S2,
    Session_S3
} SessionType;

typedef enum {
    SessionFlag_A,
    SessionFlag_B,
    SessionFlag_AB
} SessionFlag;

typedef enum {
    SelectFlag_NotUsed,
    SelectFlag_SL,
    SelectFlag_NOT_SL,
    SelectFlag_All
} SelectFlag;

typedef enum {
    MaskTarget_S0,
    MaskTarget_S1,
    MaskTarget_S2,
    MaskTarget_S3,
    MaskTarget_SL
} MaskTargetType;

typedef enum {
    MaskAction_AB,
    MaskAction_AN,
    MaskAction_NB,
    MaskAction_MN,
    MaskAction_BA,
    MaskAction_BN,
    MaskAction_NA,
    MaskAction_NM
} MaskActionType;

typedef enum {
    MaskType_NO_MASK,
    MaskType_Selection,
    MaskType_EPC
} MaskType;

#pragma mark - Declare structure
typedef enum
{
    READER_TYPE_RFPRISMA = 0,
    READER_TYPE_ASREADER = 1
}ReaderType;

typedef struct {
    int min;
    int max;
} CMinMaxValue;

typedef struct {
    LockState KillPassword;
    LockState AccessPassword;
    LockState EPC;
    LockState TID;
    LockState User;
} CLockParam;

@interface LockParam : NSObject

@property (nonatomic) BOOL killPassword;
@property (nonatomic) BOOL accessPassword;
@property (nonatomic) BOOL epc;
@property (nonatomic) BOOL tid;
@property (nonatomic) BOOL user;

- (int)value;

@end

#pragma mark Declare Classes

@interface AsResultCode : NSObject
+(NSString *)msg:(ResultCode)code;
@end

@interface AsResultData : NSObject {
@private
    ResultCode mResult;
    NSData * mData;
}

- (id)initWithResultCode:(ResultCode)result data:(NSData *)data;
- (ResultCode)result;
- (NSData *)data;

@end

@interface AsSelectMaskParam : NSObject <NSCoding>{
@private
    int mIndex;
}

- (int)index;
@property (nonatomic) MaskTargetType target;
@property (nonatomic) MaskActionType action;
@property (nonatomic) MemoryBank bank;
@property (nonatomic) int offset;
@property (strong, nonatomic) NSString *mask;
@property (nonatomic) int length;
@property (nonatomic) BOOL used;

- (id)initWithIndex:(int)index;
- (id)initWithParameterIndex:(int)index target:(MaskTargetType)maskTarget action:(MaskActionType)maskAction bank:(MemoryBank)maskBank offset:(int)maskOffset mask:(NSString *)maskData used:(BOOL)usedMask;
- (id)initWithParameterLength:(int)index target:(MaskTargetType)maskTarget action:(MaskActionType)maskAction bank:(MemoryBank)maskBank offset:(int)maskOffset mask:(NSString *)maskData length:(int)maskLength used:(BOOL)usedMask;

@end

@interface AsSelectMaskEPCParam : NSObject<NSCoding>

@property (nonatomic) int offset;
@property (nonatomic) int length;
@property (strong, nonatomic) NSString *mask;

@end

@interface LbtItem : NSObject

@property (nonatomic) int mSlot;
@property (nonatomic) BOOL mIsUsed;
@property (strong, nonatomic) NSString *frequency;

-(id)init;
-(id)initWithSlot:(int)slot isUsed:(BOOL)isUsed;

@end
