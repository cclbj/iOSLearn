//
//  Mediactor.h
//  iOSLearn
//
//  Created by lcc on 2018/7/26.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Mediactor;

static Mediactor *instance;

@interface Mediactor : NSObject

+ (id)shareInstance;


- (void)performTarget:(NSString *)target withSelecter:(NSString *)action withParamter:(NSDictionary *)paramter isCached:(BOOL)isCached;

@end
