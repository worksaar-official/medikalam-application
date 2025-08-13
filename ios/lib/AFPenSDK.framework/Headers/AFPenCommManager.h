//
//  AFPenCommManager.h
//  AFPenSDK
//
//  Created by Chien-chuTsang on 2018/2/8.
//  Copyright © 2018年 ophaya. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AFNode.h"
@class AFNode;
#import "AFPenCommManagerUpdaterDelegate.h"
typedef NS_ENUM(NSInteger, AFPenCommManPenConnectionStatus)
{
    AFPenCommManPenConnectionStatusNone,
    AFPenCommManPenConnectionStatusDisconnected,
    AFPenCommManPenConnectionStatusConnected,
    AFPenCommManPenConnectionStatusScanStarted,
    AFPenCommManPenConnectionStatusConnectTimeout,
};
typedef NS_ENUM(NSInteger, AFPenCommManStartStatus)
{
    AFPenCommManStartStatusSucceed,
    AFPenCommManStartStatusIsConnecting,
    AFPenCommManStartStatusPowerOff,
    AFPenCommManStartStatusUnknown
};
typedef NS_ENUM(NSInteger, PenOfflineModeEnum) {
    PenOfflineModeAll,
    PenOfflineModeOfflineOnly
};

typedef NS_ENUM(NSInteger, PenGripStyle)
{
    PenGripStyleNA,
    PenGripStyleNormal,
    PenGripStyleReverse,
};
@protocol AFPenBLEDataDelegate <NSObject>
@required
- (void) DataToPen:(NSData *)data;
@end

@protocol AFOfflineDataDelegate <NSObject>
- (void) offlineDataDidReceiveDataInfo:(NSDictionary *)infoDictionary; //key:count
- (void) offlineDataDidReceivePenData:(NSDictionary *)dataDictionary; //key: list,readedCnt
@optional
- (void) offlineSectionDidReceive:(NSString*) jsonstr;
- (void) offlineSectionDidSet:(NSString*) penName;
@end

@protocol AFPenCommManagerNewPeripheral <NSObject>
@optional
- (void) processConnectionStatus:(AFPenCommManPenConnectionStatus)connectionStatus;
- (void) AFPenCommDidReceivePeripheralList:(NSArray<AFDevice*>*)penList;
@end

@protocol AFPenCommParserStrokeHandler <NSObject>
@required

- (void) processNode:(NSArray<AFNode*>*) arrAFNode;
- (void) onReceiveGripStyle:(PenGripStyle) penGripStyle;
- (void) rawResponse:(NSData*) data;
@end
@protocol AFPenCommManagerProtocol <NSObject>
- (void) setAFPenCommParserStrokeHandler:(id<AFPenCommParserStrokeHandler>)delegate;
- (void) setAFPenCommManagerNewPeripheral:(id<AFPenCommManagerNewPeripheral>)delegate;
- (void) setAFOfflineDataDelegate:(id<AFOfflineDataDelegate>)delegate;
- (void) setAFBLEDataDelegate:(id<AFPenBLEDataDelegate>)delegate;
- (NSString*) getSDKVerStr;
- (void) disConnect;
- (AFPenCommManStartStatus) btStartForPeripheralsList;

- (BOOL) connect : (NSString*) penName;
- (BOOL) connect ;
- (AFPenCommManPenConnectionStatus) getConnectionStatus;
- (BOOL) requestOfflineDataWithRange:(UInt32)startOffset count:(uint64_t)count;
- (void) requestOfflineDataInfo;
- (void) requestReadBatt : (void (^)(uint16_t ))result;

- (void) btStopSearchPeripheralsList;
-(BOOL) isConnected;
- (NSString*) getConnectedDevice;
-(void) requestDeleteOfflineData:(void (^)(BOOL))result;
- (uint64_t) GetFlashCapacity;
- (void) GetFlashUsedAmount:(void (^)(uint64_t bytesUsed))result;
- (void) SetPaperSize:(NSArray<PaperSize*>*) list;
- (void) enableDejitter:(bool) bEnable;
-(BOOL) requestAllOfflineData;
-(int) getOfflineAvailableCnt;
@end
#if 1
@interface AFPenCommManager : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
+ (AFPenCommManager *) sharedInstance;

- (void) setAFPenCommParserStrokeHandler:(id<AFPenCommParserStrokeHandler>)delegate;
- (void) setAFPenCommManagerNewPeripheral:(id<AFPenCommManagerNewPeripheral>)delegate;
- (void) setAFOfflineDataDelegate:(id<AFOfflineDataDelegate>)delegate;

- (BOOL) isRegister;
- (NSString*) getSDKVerStr;
- (void) disConnect;
- (AFPenCommManStartStatus) btStartForPeripheralsList;
- (BOOL) connect : (NSString*) penName;
- (AFPenCommManPenConnectionStatus) getConnectionStatus;
- (BOOL) requestOfflineDataWithRange:(UInt32)startOffset count:(uint64_t)count;
- (void) requestOfflineDataInfo;
- (void) requestReadBatt : (void (^)(uint16_t ))result;
- (void) btStopSearchPeripheralsList;
- (BOOL) isConnected;

- (NSString*) getConnectedDevice;
-(void) requestDeleteOfflineData:(void (^)(BOOL))result;

- (uint64_t) GetFlashCapacity;
- (void) GetFlashUsedAmount:(void (^)(uint64_t bytesUsed))result;
- (void) SetPaperSize:(NSArray<PaperSize*>*) list;
- (void) SetPaperSizeMilimeter:(NSArray<PaperSize*>*) list;
- (void) enableDejitter:(bool) bEnable;
-(BOOL) requestAllOfflineData;
-(int) getOfflineAvailableCnt;
-(void) setOfflineSectionInfoAsync : (NSString*) penName withData:(NSString*) jsonstr;
-(void) requestOfflineSectionInfoAsync : (NSString*) penName;
- (NSString*) getFWVer;
- (void) requestFWVer : (void (^)(NSString *data))result;

-(void) requestSetWorkingModeOTA: (void (^)(uint16_t ))result;
-(void) requestSetWorkingModeNormal: (void (^)(uint16_t ))result;
-(void) sendOTAFile : (NSData*) d ;
-(void) requestOTAWriteStart;
- (void) requestOTAUpgradeStart : (void (^)(uint8_t,uint8_t ))result;
- (void) setAFBLEUpdaterDelegate:(id<AFPenCommManagerUpdaterDelegate>)delegate;
- (void) requestGetStandbyTime : (void (^)(uint16_t sec_standby,uint16_t min_powerdown ))result;
- (void) requestSetPowerDownTime: (uint16_t) powerdowntime
                          result:(void (^)(BOOL b ))result;
- (void) requestSetStandbyTime: (uint16_t) standbytime
                        result:(void (^)(BOOL b ))result;
- (void) requestGetPenGripNotify : (void (^)(bool ))result;
-(void) requestEnablePenGripNotify : (bool) b
                           callback: (void (^)(bool ))result;
-(void)cmdToPen:(NSString*) pktstr;
-(void) requestSetWorkingModeCalib: (void (^)(uint16_t ))result ;
- (void) requestCalibrate;
- (void) requestCalibrate : (void (^)(uint16_t ))result;
- (void) requestGetCalibratePara : (void (^)(NSData* ))result;
- (void) requestSetPowerDownTime: (uint16_t) powerdowntime
                  AndStandbyTime: (uint16_t) standbytime
                          result:(void (^)(BOOL b ))result;
@end
#endif
