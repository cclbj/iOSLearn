//
//  LCFunctionOneVC.m
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCFunctionOneVC.h"
#import "LCMediator.h"
#import "LCMGModiator.h"

@interface LCFunctionOneVC ()

@end

@implementation LCFunctionOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"跳转到FunctionTwo" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushEvent) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.centerY.mas_equalTo(0);
        
    }];
    
}

- (void)pushEvent{
//    [self.navigationController pushViewController:[LCMediator functionTwoVC:@"90"] animated:YES];
    [[LCMGModiator initComponent] pushWithParameter:@{@"ddig":@"df"} withUrl:functionOneStr];
}


/**
 提供组件模块之间的跳转功能

 @param useID 跳转需要的 ID
 @return  当前实例的对象
 */
+ (UIViewController *)pushVC:(NSString *)useID{
    
    return [self new];
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
