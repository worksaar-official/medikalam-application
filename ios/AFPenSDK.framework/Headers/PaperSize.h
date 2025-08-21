//
//  PaperSize.h
//  AFPenSDK
//
//  Created by Chien-chuTsang on 2019/10/14.
//  Copyright © 2019年 ophaya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaperSize : NSObject
@property (nonatomic) int pageFrom;
@property (nonatomic) int pageTo;
@property (nonatomic) int width;
@property (nonatomic) int height;
@property (nonatomic) int bookNum;
@property (nonatomic) int flipmode;
@property (nonatomic) int offsetX;
@property (nonatomic) int offsetY;
@end

NS_ASSUME_NONNULL_END
