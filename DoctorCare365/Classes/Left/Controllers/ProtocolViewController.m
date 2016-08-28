//
//  ProtocolViewController.m
//  DoctorCare365
//
//  Created by fly on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ProtocolViewController.h"

@interface ProtocolViewController ()

@end

@implementation ProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置返回按钮的样式
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVC)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"用户协议";
    
    //设置默认的navigationBar上的title的字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    [self setUpUI];
}



//返回按钮调用方法
- (void)backToHomeVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUpUI
{
    UITextView *protocolView = [[UITextView alloc] init];
    
    [self.view addSubview:protocolView];
    
    //禁止用户交互
    protocolView.editable = NO;
    
    protocolView.font = [UIFont systemFontOfSize:17];
    
    [protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    //获取plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Protocol List.plist" ofType:nil];
    //添加到数组中
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    //遍历数组取出数据
    for (NSString *str in arr)
    {
        protocolView.text = str;
    }
    
}



@end



















