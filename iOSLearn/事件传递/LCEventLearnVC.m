//
//  LCEventLearnVC.m
//  iOSLearn
//
//  Created by lcc on 2018/7/17.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCEventLearnVC.h"
#import "LCViewOne.h"
#import "LCViewTwo.h"
#import "LCViewThree.h"
#import "LCButton.h"

@interface LCEventLearnVC ()

@end

@implementation LCEventLearnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self mutiSuperViewResponseEvent];
    
    
}


- (void)touchEventReceive{
    
    LCViewOne *viewOne = [LCViewOne new];
    
    UIButton *viewTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [viewTwo addTarget:self action:@selector(viewTwoTouch) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewThree = [UIButton buttonWithType:UIButtonTypeCustom];
    [viewThree addTarget:self action:@selector(viewThreeTouch) forControlEvents:UIControlEventTouchUpInside];
    
    viewOne.backgroundColor = [UIColor redColor];
    viewTwo.backgroundColor = [UIColor greenColor];
    viewThree.backgroundColor = [UIColor orangeColor];
    
    [viewOne addSubview:viewThree];
    [viewOne addSubview:viewTwo];
    [self.view addSubview:viewOne];
    
    [viewThree mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(60);
        make.trailing.top.bottom.mas_equalTo(0);
    }];
    
    [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(60);
        make.leading.top.bottom.mas_equalTo(0);
        
    }];
    
    [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(150);
        
    }];

}


/**
 多个 view 响应同一个事件实例
 */
- (void)mutiSuperViewResponseEvent{
    
    
    LCViewOne *bgView = [LCViewOne new];
    LCButton *buttonView = [LCButton buttonWithType:UIButtonTypeCustom];
    
    bgView.backgroundColor = [UIColor redColor];
    buttonView.backgroundColor = [UIColor greenColor];
    
    [bgView addSubview:buttonView];
    [self.view addSubview:bgView];
    
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(60);
        make.centerX.centerY.mas_equalTo(0);
        
    }];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(150);
        
    }];
    
    
}

#pragma -mark- eventTouch
- (void)viewThreeTouch{
    NSLog(@"buttonTree touch!!");
}

- (void)viewTwoTouch{
    NSLog(@"buttonTwo touch!!");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
