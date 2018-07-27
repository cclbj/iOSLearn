//
//  ViewController.m
//  iOSLearn
//
//  Created by lcc on 2018/7/17.
//  Copyright © 2018年 come.lcc. All rights reserved.
//

#import "ViewController.h"
#import "LCEventLearnVC.h"
#import "LCHomeVC.h"

static NSString * const cellID = @"cellID";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[@"事件传递机制",@"组件化"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 36;
    
    [self invokeUseDemo:self withAction:@selector(testMe:) WithParameter:@{@"parameter":@"hello"}];
    
}

/**
 invoke 的使用
 */
- (id)invokeUseDemo:(NSObject *)target withAction:(SEL)selecter WithParameter:(NSDictionary *) dict{

    NSString *value = dict[@"parameter"];
    
    NSMethodSignature* signature = [target methodSignatureForSelector:selecter];
    
    if (signature == nil) {
        return nil;
    }
    
    const char *returnType = signature.methodReturnType;
    
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setArgument:&value atIndex:2];
    [invocation setTarget:target];
    [invocation setSelector:selecter];
    
    [invocation invoke];
    
    
    //返回值为字符串的话
    if (strcmp(returnType, @encode(NSString)) == 0) {
        NSString *returnStr;
        [invocation getReturnValue:&returnStr];
        
        return returnStr;
    }
   
    return nil;
}


- (NSString *)testMe:(NSString *)testStr{
    
    NSLog(@"testMsg:%@",testStr);
    
    return @"消息发送成功";
}
 
#pragma -mark- dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vc = nil;
    
    if (indexPath.row == 0) {
        vc = [LCEventLearnVC new];
    }
    
    else if (indexPath.row == 1){
        vc = [LCHomeVC new];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}




@end
