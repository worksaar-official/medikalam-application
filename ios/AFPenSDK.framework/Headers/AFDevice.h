//
//  AFDevice.h
//  AFPenSDK
//
//  Created by Chien-chuTsang on 2019/11/19.
//  Copyright © 2019年 ophaya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFDevice : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *macAddress;
@property (nonatomic, assign) int rssi;
@property (nonatomic, strong) NSDictionary *advertisementData;
@end

NS_ASSUME_NONNULL_END
