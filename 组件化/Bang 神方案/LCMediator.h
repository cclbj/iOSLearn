//
//  LCMediator.h
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LCMediator : NSObject

+ (UIViewController *)functionOneVC:(NSString *)useID;

+ (UIViewController *)functionTwoVC:(NSString *)useID;

+ (UIViewController *)functionThreeVC:(NSString *)useID;

+ (UIViewController *)functionHomeVC:(NSString *)useID;

@end
