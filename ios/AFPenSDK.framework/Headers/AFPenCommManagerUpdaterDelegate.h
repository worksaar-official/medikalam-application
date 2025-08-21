//
//  AFPenCommManagerUpdaterDelegate.h
//  AFPenSDK
//
//  Created by fancy on 2021/10/18.
//  Copyright © 2021 ophaya. All rights reserved.
//

#ifndef AFPenCommManagerUpdaterDelegate_h
#define AFPenCommManagerUpdaterDelegate_h

typedef NS_ENUM(NSInteger, AFPenCommManagerUpdaterStatus)
{
    AFPenCommManagerUpdaterStatusNone = 0,
    AFPenCommManagerUpdaterStatusErrFileSize = 1, //file size err
    AFPenCommManagerUpdaterWriteOTAReady = 2, //ota write start
    AFPenCommManagerUpdaterWriteOTAReport = 3, //otr progress
    AFPenCommManagerUpdaterStatusErr = 4,
    AFPenCommManagerUpdaterWriteOTADone = 5, //ota write done
    AFPenCommManagerUpdaterFWWriteReport = 7, //fw write progress
    AFPenCommManagerUpdaterStatusUnknown = 8,    
    AFPenCommManagerUpdaterStatusPktFormatErr = 9,
    AFPenCommManagerUpdaterStatusNoSpace = 10,
    AFPenCommManagerUpdaterStatusBatLowErr = 11,
    AFPenCommManagerUpdaterStatusErrorModeErr = 12,
    AFPenCommManagerUpdaterStatusOTARangeErr = 13,
    AFPenCommManagerUpdaterStatusOTASeqErr = 14,
    AFPenCommManagerUpdaterStatusOTAFileIllegalErr = 15,
    AFPenCommManagerUpdaterStatusFlashWriteErr = 16,
    //chnaged
    AFPenCommManagerUpdaterWokringModeChanged = 17,
    //no resp
    AFPenCommManagerUpdaterStatusErrorWritePageTimeout = 18,
    //when write ota
    AFPenCommManagerUpdaterStatusWriteOTAPktFormatErr = 19,
    AFPenCommManagerUpdaterStatusWriteOTANoSpace = 20,
    AFPenCommManagerUpdaterStatusWriteOTABatLowErr = 21,
    AFPenCommManagerUpdaterStatusWriteOTAModeErr = 22,
    AFPenCommManagerUpdaterStatusWriteOTAUnknown = 23,
    //when update fw
    AFPenCommManagerUpdaterStatusUpdateFWPktFormatErr = 24,
    AFPenCommManagerUpdaterStatusUpdateFWNoSpace = 25,
    AFPenCommManagerUpdaterStatusUpdateFWBatLowErr = 26,
    AFPenCommManagerUpdaterStatusUpdateFWModeErr = 27,
    AFPenCommManagerUpdaterStatusUpdateFWOTARangeErr = 28,
    AFPenCommManagerUpdaterStatusUpdateFWOTAFileIllegalErr = 29,
    AFPenCommManagerUpdaterStatusUpdateFWUnknown = 30,
    AFPenCommManagerUpdaterStatusUpdateFWOTASize = 31,
};
@protocol AFPenCommManagerUpdaterDelegate <NSObject>
@required
- (void) AFPenCommManagerUpdaterDelegateReport:(AFPenCommManagerUpdaterStatus)status progress:(int)progress;
@end

#endif /* AFPenCommManagerUpdaterDelegate_h */
