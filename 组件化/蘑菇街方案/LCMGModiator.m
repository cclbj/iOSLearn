//
//  LCMGModiator.m
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCMGModiator.h"
#import "LCFunctionOneVC.h"
#import "LCFunctionTwoVC.h"
#import "LCFunctionThreeVC.h"
#import "LCHomeVC.h"


@implementation LCMGModiator


+ (id)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!shareInstance) {
            shareInstance = [LCMGModiator new];
        }
        
    });

    return shareInstance;
    
}

+ (instancetype)initComponent{
    
    [[self shareInstance] registerClass:functionOneStr block:^(id parameter) {
        
        LCFunctionOneVC *vc = [LCFunctionOneVC new];
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController pushViewController:vc animated:YES];
        
    }];
    
    [[self shareInstance] registerClass:functionTwoStr block:^(id parameter) {
        
        LCFunctionTwoVC *vc = [LCFunctionTwoVC new];
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController pushViewController:vc animated:YES];
    }];

    
    [[self shareInstance] registerClass:functionThreeStr block:^(id parameter) {
        
        LCFunctionThreeVC *vc = [LCFunctionThreeVC new];
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController pushViewController:vc animated:YES];
    }];
    
    [[self shareInstance] registerClass:HomeStr block:^(id parameter) {
        LCHomeVC *vc = [LCHomeVC new];
        [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController pushViewController:vc animated:YES];
        
    }];

    
    return [self shareInstance];

    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    return [self shareInstance];
}

- (id)copy{
    
    return [LCMGModiator shareInstance];
}

- (id)mutableCopy{
    
    return [LCMGModiator shareInstance];
}

- (void)registerClass:(NSString *)url block:(pushBlock)block{
    
    [self.cache setObject:block forKey:url];
}

- (void)pushWithParameter:(id)parameter withUrl:(NSString *)url{
    
    pushBlock block = [self.cache objectForKey:url];
    if (block) {
        block(parameter);
    }
}

@end
