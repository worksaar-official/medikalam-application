//
//  RLMPenAction.h
//  btpen
//
//  Created by Chien-chuTsang on 2017/4/28.
//  Copyright © 2017年 com.seesall.btpent1. All rights reserved.
//
#import <Foundation/Foundation.h>
#if VENDOR==1
typedef NS_ENUM(NSInteger, PenAction) {
    PenActionNone, PenActionPenDown,PenActionPenUp
};
@interface AFNode : NSObject
@property (nonatomic) long long page;
@property (nonatomic) float X;
@property (nonatomic) float Y;
@property (nonatomic) PenAction type;
@property (nonatomic) int book_no;
@property (nonatomic) int book_width;
@property (nonatomic) int book_height;
@property (nonatomic) int reserved1;
-(NSData*) toBytes;
@end
#endif

