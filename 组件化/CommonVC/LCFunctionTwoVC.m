//
//  LCFunctionTwoVC.m
//  iOSLearn
//
//  Created by lcc on 2018/7/23.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "LCFunctionTwoVC.h"

@interface LCFunctionTwoVC ()

@end

@implementation LCFunctionTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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
