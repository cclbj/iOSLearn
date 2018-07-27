//
//  LCButton.m
//  iOSLearn
//
//  Created by lcc on 2018/7/19.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCButton.h"

@implementation LCButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了 button");
    [super touchesBegan:touches withEvent:event];
}

@end
