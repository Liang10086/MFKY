//
//  OpinionViewController.m
//  DoctorCare365
//
//  Created by fly on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "OpinionViewController.h"
#import "DCNavigationController.h"
#import "HomeTableViewController.h"
@interface OpinionViewController ()  <UITextViewDelegate>

@end

@implementation OpinionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //按钮的样式修改
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVC)];
    
    [self setUpUI];
}

//返回按钮方法
- (void)backToHomeVC
{
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if(textView.tag == 0) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        textView.tag = 0;
    }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView
{
    if([textView.text length] == 0)
    {
        textView.text = @"";
        textView.textColor = [UIColor grayColor];
        textView.tag = 1;
    }
    else
    {
        textView.textColor = [UIColor blackColor];
        textView.tag = 1;
    }
}





- (void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"意见与反馈";
    
    //设置默认的navigationBar上的title的字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];

    
    
    
    
    //创建输入反馈意见文本框
    UITextView *feedbackTextView = [[UITextView alloc] init];
    
    [feedbackTextView.layer setMasksToBounds:YES];
    [feedbackTextView.layer setCornerRadius:9.0];
    [feedbackTextView.layer setBorderWidth:1.2];
    
    feedbackTextView.text = @"请输入反馈意见";
    
    feedbackTextView.textColor = [UIColor grayColor];
    
    feedbackTextView.font = [UIFont systemFontOfSize:18];
    
    [self.view addSubview:feedbackTextView];
    
    feedbackTextView.delegate = self;
    
    
    
    
    
    //创建label
    UILabel *lab = [[UILabel alloc] init];
    
    lab.text = @"欢迎您致电联系我们:";
    lab.textAlignment = NSTextAlignmentCenter;
    
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:lab];
    
    
    //创建电话图片点击按钮
    UIButton *phoneBtn = [[UIButton alloc] init];
    
    [phoneBtn setBackgroundImage:[UIImage imageNamed:@"电话图标默认"] forState:UIControlStateNormal];
    
    [phoneBtn setBackgroundImage:[UIImage imageNamed:@"电话图标选中"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:phoneBtn];
    
    //客户拨打电话方法
    [phoneBtn addTarget:self action:@selector(phoneClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    //创建完成递交反馈
    UIButton *feedbackBtn = [[UIButton alloc] init];
    //设置背景图片
    UIImage *backgroudImage = [UIImage imageNamed:@"nav"];
    [feedbackBtn setBackgroundImage:backgroudImage forState:UIControlStateNormal];
    
    [feedbackBtn setBackgroundImage:[UIImage imageNamed:@"link_button_01"] forState:UIControlStateHighlighted];
    
    //设置文字颜色
    [feedbackBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [feedbackBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //设置文字内容
    [feedbackBtn setTitle:@"提交反馈" forState:UIControlStateNormal];
    [feedbackBtn setTitle:@"提交反馈" forState:UIControlStateHighlighted];
    
    [feedbackBtn.layer setMasksToBounds:YES];
    [feedbackBtn.layer setCornerRadius:9.0];
    
    [self.view addSubview:feedbackBtn];
    
    //提交反馈点击时间
    [feedbackBtn addTarget:self action:@selector(clickfeedbackBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    //反馈文本框
    [feedbackTextView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(@30);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@250);
    }];
    
    //联系我们
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@300);
        make.left.equalTo(@40);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    
    //电话图片
    [phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@300);
        make.left.equalTo(@240);
        make.right.equalTo(@-40);
        make.height.equalTo(@40);
    }];
    
    //提交反馈按钮
    [feedbackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@380);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@40);
    }];
}


//拨打电话联系客户
- (void)phoneClick
{
    //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}


//点击提交反馈方法实现
- (void)clickfeedbackBtn
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"感谢您的反馈" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    [alertVC addAction:action];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}






@end












