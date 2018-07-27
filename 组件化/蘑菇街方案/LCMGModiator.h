//
//  LCMGModiator.h
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LCMGModiator;

static NSString *const functionOneStr = @"LCFunctionOneVC";
static NSString *const functionTwoStr = @"LCFunctionTwoVC";
static NSString *const functionThreeStr = @"LCFunctionThreeVC";
static NSString *const HomeStr = @"LCHomeVC";

static LCMGModiator *shareInstance;

@interface LCMGModiator : NSObject

typedef void (^pushBlock)(id parameter);

@property (nonatomic,copy) NSMutableDictionary *cache;

+ (id)shareInstance;

+ (instancetype)initComponent;

- (void)registerClass:(NSString *)url block:(pushBlock)block;

- (void)pushWithParameter:(id)parameter withUrl:(NSString *)url;

@end
