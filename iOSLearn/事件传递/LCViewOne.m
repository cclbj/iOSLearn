//
//  LCViewOne.m
//  iOSLearn
//
//  Created by lcc on 2018/7/17.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCViewOne.h"

@implementation LCViewOne


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{


    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog(@"suitView:%@",[view class]);
    
    return view;

}

- (UIView *)findSuitDealEventView:(CGPoint)point withEvent:(UIEvent *)event{
    
    /* 寻找接受事件的子 View 的算法 */
    if(self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.1) return nil;
    
    if ([self pointInside:point withEvent:event] == NO) {
        return nil;
    }
    
    NSArray *childViews = self.subviews;
    
    for (NSInteger i = childViews.count - 1; i >= 0; i--) {
        
        UIView *childView = childViews[i];
        
        CGPoint childPoint = [self convertPoint:point toView:childView];
        
        UIView *filiter = [childView hitTest:childPoint withEvent:event];
        
        if (filiter) {
            
            return filiter;
            
        }else{
            
            return childView;
        }
        
        
    }
    
    return self;
    
}

- (UIView *)cancelCurViewReceiveEvent:(CGPoint)point withEvent:(UIEvent *)event{
    /* 当 view0在当前 view 上，只让 view0接收事件，当前 view 不接受事件的处理方案如下 */
    UIView *view = [super hitTest:point withEvent:event];
    
    //如果是自身，不做事件接收处理
    if (view == self) {
        
        return nil;
    }
    
    return view;   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"开始点击 one");
    [super touchesBegan:touches withEvent:event];
    
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"开始滑动");
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
