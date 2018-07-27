//
//  LCHomeVC.m
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCHomeVC.h"
#import "LCMediator.h"
#import <Masonry.h>

@interface LCHomeVC ()

@end

@implementation LCHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"跳转到FunctionOne" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushEvent) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.centerY.mas_equalTo(0);
        
    }];
}

- (void)pushEvent{
    [self.navigationController pushViewController:[LCMediator functionOneVC:@"11"] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIViewController *)pushVC:(NSString *)useID{
    
    return [self new];
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
