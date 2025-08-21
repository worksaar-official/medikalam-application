//
//  AFStrokeBuilder.h
//  AFPenDemo
//
//  Created by fancy on 2021/8/11.
//  Copyright © 2021 ophaya. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFStrokeOptions.h"
#import "AFNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface AFStrokeBuilder : NSObject
@property (nonatomic,strong) AFStrokeOptions* options;
-(NSArray<NSArray<NSNumber*>*>*) getStrokePoints : (NSArray<AFNode*>*) dots;
-(UIBezierPath*) buildPath : (NSArray<NSArray<NSNumber*>*>*) dots scale:(float)scale;

-(NSArray<NSArray<NSNumber*>*>*) getStrokePoints2;
-(void) addPoints: (NSArray<AFNode*>*) dots;
-(NSMutableArray<NSMutableArray<NSNumber*>*>*) getStrokeOutlinePoints2;
@end

NS_ASSUME_NONNULL_END
