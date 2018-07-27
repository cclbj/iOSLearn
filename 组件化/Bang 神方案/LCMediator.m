//
//  LCMediator.m
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCMediator.h"
#import <objc/runtime.h>


static NSString *const functionOneStr = @"LCFunctionOneVC";
static NSString *const functionTwoStr = @"LCFunctionTwoVC";
static NSString *const functionThreeStr = @"LCFunctionThreeVC";
static NSString *const HomeStr = @"LCHomeVC";

@implementation LCMediator


+ (UIViewController *)functionOneVC:(NSString *)useID{
    
    return [self pushWithClassStr:functionOneStr withID:useID];
}

+ (UIViewController *)functionTwoVC:(NSString *)useID{
    
    return [self pushWithClassStr:functionTwoStr withID:useID];
}

+ (UIViewController *)functionThreeVC:(NSString *)useID{
    
    return [self pushWithClassStr:functionThreeStr withID:useID];
}

+ (UIViewController *)functionHomeVC:(NSString *)useID{
    
    return [self pushWithClassStr:HomeStr withID:useID];
}

+ (UIViewController *)pushWithClassStr:(NSString *)className withID:(id)parameter{
    
    Class cls = NSClassFromString(className);
    
    return [cls performSelector:@selector(pushVC:) withObject:@{@"uid":@"200"}];
}

@end
