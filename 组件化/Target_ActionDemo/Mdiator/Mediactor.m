//
//  Mediactor.m
//  iOSLearn
//
//  Created by lcc on 2018/7/26.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "Mediactor.h"

static NSString* const KTargetPrefix = @"ModulTarget";
static NSString *const KActionPrefix = @"Target";

@interface Mediactor()

@property (nonatomic,copy) NSMutableDictionary *cacheModulTarget;

@end

@implementation Mediactor

- (id)performTarget:(NSString *)target withSelecter:(NSString *)action withParamter:(NSDictionary *)paramter isCached:(BOOL)isCached{
    
    NSString *targetStr = [NSString stringWithFormat:@"%@%@", KTargetPrefix, target];
    NSString *actionStr = [NSString stringWithFormat:@"%@%@", KActionPrefix, action];
    
    //获取对应的 class与方法
    SEL sel = NSSelectorFromString(actionStr);
    Class targetCls = self.cacheModulTarget[targetStr];
    
    if (targetCls == nil) {
        
        NSLog(@"缓存中不存在当前的target");
        targetCls = NSClassFromString(targetStr);
    }
    
    //如果当前的 action 存在，则向当前的 Target 发送消息
    if ([targetCls respondsToSelector:sel]) {
    
        return [self safePeformTarget:targetCls withAction:sel withParameter:paramter isCached:YES];
        
    }
    
    else{
        
        return nil;
    }
    
}


- (id )safePeformTarget:(id)target withAction:(SEL)sel withParameter:(NSDictionary *)parameter isCached:(BOOL)isCached{
    
    
    NSMethodSignature *signature = [target methodSignatureForSelector:sel];
    
    if(signature == nil){
        NSLog(@"无效的方法");
        return nil;
    }
    
    //判断当前的方法的返回值，从而确定发送消息的类型
    const char *returnType = [signature methodReturnType];
    
    if (strcmp(returnType, @encode(void))) {
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        //处理消息参数
        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation setArgument:&parameter atIndex:2];
        
        [invocation invoke];
        
        
        return nil;
        
    }
    
    else if (strcmp(returnType, @encode(NSInteger))){
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget: target];
        [invocation setSelector:sel];
        [invocation setArgument:&parameter atIndex:2];
        
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        
        return @(result);
    }
    
    else if (strcmp(returnType, @encode(BOOL))){
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation setArgument:&parameter atIndex:2];
        
        BOOL result = NO;
        [invocation getReturnValue:&result];
        
        return @(result);
    }

    else if (strcmp(returnType, @encode(CGFloat))){
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:target];
        [invocation setSelector:sel];
        [invocation setArgument:&parameter atIndex:2];
        
        CGFloat result;
        [invocation getReturnValue:&result];
        
        return @(result);
        
    }
    
#pragma clang diagnostic
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    
    return [target performSelector:sel withObject:parameter];
#pragma clang diagnostic pop
    
}


+ (id)shareInstance{
    if (!instance) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
             instance = [[Mediactor alloc]init];
        });
    }
    
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    return [Mediactor shareInstance];
}

- (id)copy{
    
    return [Mediactor shareInstance];
}

- (id)mutableCopy{
    return [Mediactor shareInstance];
}


- (NSMutableDictionary *)cacheModulTarget{
    
    if (!_cacheModulTarget) {
        _cacheModulTarget = [NSMutableDictionary new];
    }
    
    return _cacheModulTarget;
    
}


@end
