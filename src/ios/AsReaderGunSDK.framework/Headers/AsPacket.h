#import <Foundation/Foundation.h>
#import "AsReaderGUN.h"
// Declare Packet Type Codes
typedef enum {
    PacketSSI = 0x00,                   // '\0'
    PacketResponse = 0x20,              // ' '
    PacketReqSetProperty = 0x77,        // 'w'
    PacketResSetProperty = 0x57,        // 'W'
    PacketReqGetProperty = 0x72,        // 'r'
    PacketResGetProperty = 0x52,        // 'R'
    PacketCommand = 0x61,               // 'a'
    PacketCommandAck = 0x41,            // 'A'
    PacketEvent = 0x65,                 // 'e'
    PacketDebug = 0x64,                 // 'd'
    PacketDebugAck = 0x44,              // 'D'
    PacketErrorAck = 0x45,              // 'E'
} PacketType;

// Declare Property Type Codes
typedef enum {
    PropertyBuzzer = 0x62,              // 'b'
    PropertyVibrator = 0x71,            // 'q'
    PropertyContinuousMode = 0x63,      // 'c'
    PropertyLimitTagCount = 0x6C,       // 'l'
    PropertyFirmwareVersion = 0x76,     // 'v'
    PropertyPowerGain = 0x70,           // 'p'
    PropertyPowerGainRange = 0x61,      // 'a'
    PropertyRegion = 0x67,              // 'g'
    PropertyOperationTime = 0x69,       // 'i'
    PropertyInventoryTime = 0x32,       // '2'
    PropertyIdleTime = 0x30,            // '0'
    PropertySameTagReport = 0x31,       // '1'
    PropertyAutoOffTime = 0x74,         // 't'
    PropertyAccessPassword = 0x77,      // 'w'
    PropertyInventorySession = 0x73,    // 's'
    PropertySessionFlag = 0x66,         // 'f'
    PropertyMaskTarget = 0x54,          // 'T'
    PropertyMaskAction = 0x41,          // 'A'
    PropertyMaskBank = 0x42,            // 'B'
    PropertyMaskOffset = 0x4F,          // 'O'
    PropertyMask = 0x4D,                // 'M'
    PropertyMaskUsed = 0x45,            // 'E'
    PropertyMaskTrunc = 0x52,           // 'R'
    PropertyUseSelectionMask = 0x55,    // 'U'
    PropertyUHFVersion = 0x56,          // 'V'
    PropertyKeyAction = 0x6B,           // 'k'
    PropertyBatteryStatus = 0x65,       // 'e'
    PropertyTime = 0x72,                // 'r'
    PropertySerialNo = 0x53,            // 'S'
    PropertyStoredMode = 0x49,          // 'I'
    PropertyStoredTagCount = 0x43,      // 'C'
    PropertyReportMode = 0x6D,          // 'm'
    PropertyAlgorithm = 0x47,           // 'G'
    PropertyMinQ = 0x4E,                // 'N'
    PropertyMaxQ = 0x58,                // 'X'
    PropertyRegister = 0x6A,            // 'j'
    PropertyEpcMask = 0x64,             // 'd'
    PropertyEpcMaskData = 0x44,         // 'D'
    PropertyEpcMaskMode = 0x75,         // 'u'
    PropertyLBT = 0x4C,                 // 'L'
    PropertyLBTFrequency = 0x46,        // 'F'
    PropertyLBTMask = 0x39,             // '9'
    PropertyReportRSSI = 0x38,          // '8'
    PropertyBarcodePower = 0x52,        // 'R'
    PropertyRemoteMode = 0x68,          // 'h'
    PropertyTagDataType = 0x23,         // '#'
    PropertyBarcode =  0x48,            // 'H'  // cc barcode
    PropertyBarcodeOpertationMode = 0x6F,  // 'o'  // cc barcode
    PropertyBarcodeState = 0x78,        // 'x'  // cc barcode
    PropertyBarcodeRevision = 0x4B,     // 'K'  // cc barcode
    PropertyQValue = 0x51,              // 'Q'
    PropertyLinkProfile = 0x34,         // '4'
    PropertyDefaultLinkProfile = 0x35,  // '5'
    PropertyMaskType = 0x57,            // 'W'
    PropertySleepTime = 0x79,           // 'y'
} PropertyType;

// Declare Sub Command Type Codes
typedef enum {
    CommandInventory = 0x66,    		// 'f'
    CommandReadMemory = 0x72,    		// 'r'
    CommandWriteMemory = 0x77,          // 'w'
    CommandKill = 0x6B,    				// 'k'
    CommandLock = 0x6C,    				// 'l'
    CommandUnlock = 0x6D,   			// 'm'
    CommandPermaLock = 0x70,            // 'p'
    CommandBlockWrite = 0x57,           // 'W'
    CommandBlockErase = 0x45,           // 'E'
    CommandStop = 0x73,    				// 's'
    CommandLoadStoredTag = 0x4C,        // 'L'
    CommandSaveStoredTag = 0x54,        // 'T'
    CommandRemoveAllStoredTag = 0x44,   // 'D'
    CommandSoftReset = 0x62,            // 'b'
    CommandHardReset = 0x68,            // 'h'
    CommandDefaultParam = 0x61,         // 'a'
    CommandSaveParam = 0x53,            // 'S'
    CommandEnterBypass = 0x42,          // 'B'
    CommandEnterBarcodeBypass = 0x59,   // 'Y'
    CommandLeaveBypass = 0x43,          // 'C'
    CommandDecodeStart = 0x64,          // 'd'
    CommandBuzzerStart = 0x75,          // 'u'
    CommandVibratorStart = 0x76,        // 'v'
} CommandType;

// Declare Event Type Codes
typedef enum {
    EventTagValue = 0x54,               // 'T'
    EventStoredTagValue = 0x46,         // 'F'
    EventAccessResult = 0x41,           // 'A'
    EventRemoteKey = 0x42,              // 'B'
    EventBarcodeValue = 0x43,           // 'C'
} EventType;

// Declare Debug Type Codes
typedef enum {
    DebugMessage = 0x64,                // 'd'
    DebugMode = 0x73,                   // 's'
    DebugBleVer = 0x67,                 // 'g'
    DebugConfig = 0x31,                 // '1' 
    DebugFactory = 0x46,                 // 'F'
} DebugType;

// Declare Error Type Codes
typedef enum {
    ErrorModule = 0x45,                 // 'E'
} ErrorType;

// Declare SSI Command
typedef enum {
    SSI_UNKNOWN = 0x00,
    SSI_AIM_OFF = 0xC4,
    SSI_AIM_ON = 0xC5,
    SSI_BEEP = 0xE6,
    SSI_CAPABILITIES_REPLY = 0xD4,
    SSI_CAPABILITIES_REQUEST = 0xD3,
    SSI_ACK = 0xD0,
    SSI_NAK = 0xD1,
    SSI_DECODE_DATA =0xF3,
    SSI_EVENT = 0xF6,
    SSI_LED_OFF = 0xE8,
    SSI_LED_ON = 0xE7,
    SSI_PARAM_DEFAULTS = 0xC8,
    SSI_PARAM_REQUEST = 0xC7,
    SSI_PARAM_SEND = 0xC6,
    SSI_REPLY_ID = 0xA6,
    SSI_REPLY_REVISION = 0xA4,
    SSI_REQUEST_ID = 0xA3,
    SSI_REQUEST_REVISION = 0xA3,
    SSI_SCAN_ENABLE = 0xEA,
    SSI_SCAN_DISABLE = 0xE9,
    SSI_SLEEP = 0xEB,
    SSI_START_DECODE = 0xE4,
    SSI_STOP_DECODE = 0xE5,
    SSI_REMOTE_KEY_ACTION = 0xF5
} SSICommand;

typedef enum {
    RFIDScanMode,
    BarcodeScanMode,
} ScanMode;

@interface AsPacket : NSObject {
@private
    PacketType mPacketType;
    uint8_t mSubType;
    NSCondition *mSync;
    int mTimeoutCount;
}

@property (nonatomic) NSInteger errorCode;
@property (strong, nonatomic) NSData *data;

- (id)initWithPacketType:(PacketType)type subType:(uint8_t)subType;

- (PacketType)type;
- (uint8_t)subType;

- (void)signal;
- (void)wait;

- (BOOL)equalPacket:(PacketType)type subType:(uint8_t)subType;
- (BOOL)checkTimeoutInterval:(int)interval withTimeout:(int)maxTimeout;

@end

@interface AsPacketManager : NSObject {
@private
    NSMutableArray *mPackets;
}

- (void)addPacket:(AsPacket *)packet;
- (AsPacket *)waitPacket:(PacketType)type subType:(uint8_t)subType;
- (AsPacket *)findPacket:(PacketType)type subType:(uint8_t)subType;
- (AsPacket *)firstPacket;
- (void)removePacket:(AsPacket *)packet;
- (BOOL)isWaitPacket;

@end
