//
//  AFStrokeOptions.h
//  AFPenDemo
//
//  Created by fancy on 2021/8/11.
//  Copyright © 2021 ophaya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFStrokeOptions : NSObject
@property (nonatomic,assign) float size;
@property (nonatomic,assign) float thinning;
@property (nonatomic,assign) float smoothing;
@property (nonatomic,assign) float streamline;
@property (nonatomic,assign) float dotscale;
@property (nonatomic,assign) bool simulatePressure;
@property (nonatomic,assign) float taperend;
@property (nonatomic,assign) float taperstart;
@property (nonatomic,assign) bool last;
@property (nonatomic,assign) bool capStart;
@property (nonatomic,assign) bool capEnd;
@property (nonatomic,assign) float noisesize;

@end

NS_ASSUME_NONNULL_END
