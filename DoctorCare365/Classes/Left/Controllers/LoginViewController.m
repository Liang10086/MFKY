//
//  LoginViewController.m
//  DoctorCare365
//
//  Created by fly on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//
#include <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "RegisterViewController.h"

#import "LoginField.h"
@interface LoginViewController ()

@property (nonatomic, assign) BOOL isLogined;
//解决键盘挡住界面问题
@property (strong, nonatomic) TPKeyboardAvoidingScrollView *scrollView;

//名字
@property (nonatomic, weak) UITextField *usernameText;
//身份证号
@property (nonatomic, weak) UITextField *iDText;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置返回按钮的样式
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVC)];
    
    [self setUpUI];
}



//返回按钮调用方法
- (void)backToHomeVC
{
    [self.navigationController popViewControllerAnimated:YES];
}



//设置界面
- (void)setUpUI
{
    //创建一个scrollView
    self.scrollView = [[TPKeyboardAvoidingScrollView alloc] init];
    
    self.scrollView.frame = self.view.bounds;
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 1.3);
    
    [self.view addSubview:self.scrollView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"用户登录";
    
    //设置默认的navigationBar上的title的字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    
    //设置导航栏右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"快速注册" style:UIBarButtonItemStylePlain target:self action:@selector(goToRegister)];
    
    
    
    
    //创建logo
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"product_img_logo_nor.png"]];
    
    UIImageView *logoNameView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"product_text_logo_nor.png"]];
    
    [self.scrollView addSubview:logoView];
    
    [self.scrollView addSubview:logoNameView];
    
    
    //创建用户名文本框
    UITextField *usernameText = [[UITextField alloc]init];
    
    //设置文本框的边框颜色
    usernameText.layer.borderColor = [[UIColor grayColor] CGColor];
    usernameText.layer.borderWidth = 2.0;
    
    //设置textField的颜色
    usernameText.backgroundColor = [UIColor whiteColor];
    
    usernameText.placeholder = @"请输入用户姓名";
    
    //创建文本框左边的图片
    UIImage *image = [UIImage imageNamed:@"用户"];
    
    UIImageView *imageview =  [[UIImageView alloc] initWithImage:image];
    
    //设置左侧图片的偏移量
    imageview.frame = CGRectMake(0, 0, 32, 0);
    
    //创建文本框左边视图
    usernameText.leftView = imageview;
    
    usernameText.leftView.contentMode = UIViewContentModeCenter;
    
    usernameText.leftViewMode = UITextFieldViewModeAlways;
    
    [self.scrollView addSubview:usernameText];
    
    self.usernameText = usernameText;
    
    
    
    
    //创建密码文本框
    UITextField *passwordText = [[UITextField alloc]init];
    
    //设置文本框的边框颜色
    passwordText.layer.borderColor = [[UIColor grayColor] CGColor];
    passwordText.layer.borderWidth = 2.0;
    
    //设置textField的颜色
    passwordText.backgroundColor = [UIColor whiteColor];
    
    passwordText.placeholder = @"请输入用户身份证号码";
    
    passwordText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"请输入证件号码左边图标"]];
    
    passwordText.leftView.frame = CGRectMake(0, 0, 32, 0);
    
    //创建文本框左边的图片
    passwordText.leftView.contentMode = UIViewContentModeCenter;
    
    passwordText.leftViewMode = UITextFieldViewModeAlways;
    
    [self.scrollView addSubview:passwordText];
    
    self.iDText = passwordText;
    
    
    
    //创建label
    UILabel *hintLab = [[UILabel alloc] init];
    
    hintLab.text = @"温馨提示:请使用实名制账号登录";
    
    hintLab.textColor = [UIColor blueColor];
    
    hintLab.textAlignment = NSTextAlignmentCenter;
    
    [self.scrollView addSubview:hintLab];
    
    
    
    
    
    //创建登录按钮
    UIButton *logBtn = [[UIButton alloc] init];
    
    //设置背景图片
    UIImage *backgroudImage = [UIImage imageNamed:@"nav"];
    [logBtn setBackgroundImage:backgroudImage forState:UIControlStateNormal];
    
    [logBtn setBackgroundImage:[UIImage imageNamed:@"link_button_01"] forState:UIControlStateHighlighted];
    
    //设置文字颜色
    [logBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //设置文字内容
    [logBtn setTitle:@"登录" forState:UIControlStateNormal];
    [logBtn setTitle:@"登录" forState:UIControlStateHighlighted];
    
    [logBtn.layer setMasksToBounds:YES];
    [logBtn.layer setCornerRadius:9.0];
    
    [self.scrollView addSubview:logBtn];
    
    //登录按钮点击事件
    [logBtn addTarget:self action:@selector(clickToLogin) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    //添加logo的位置
    [logoView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@30);
        make.width.equalTo(@160);
        make.height.equalTo(@200);
    }];
    
    //添加logo名字的位置
    [logoNameView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@240);
        make.width.equalTo(@160);
        make.height.equalTo(@70);
    }];
    
    //用户名文本框的位置
    [usernameText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@340);
        make.width.equalTo(@260);
        make.height.equalTo(@40);
        
    }];
    
    //密码文本框的位置
    [passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@400);
        make.width.equalTo(@260);
        make.height.equalTo(@40);
        
    }];
    
    
    //label的位置
    [hintLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@450);
        make.width.equalTo(@260);
        make.height.equalTo(@30);
    }];
    
    
    //logBtn位置
    [logBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@500);
        make.width.equalTo(@260);
        make.height.equalTo(@40);
    }];
    
}

//点击登录事件
- (void)clickToLogin
{
        
    NSString *inputName = self.usernameText.text;
    NSString *inputPersonNum = self.iDText.text;

    
    NSArray *arr = [DCsqLite queryPersonWithKeyWord:inputName];
    
    if (arr.count == 0) {

        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的姓名,或者前往注册" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"重新输入" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.iDText.text = nil;
            self.usernameText.text = nil;
        }];
        UIAlertAction *registerAction = [UIAlertAction actionWithTitle:@"前往注册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            RegisterViewController *registerVC = [[RegisterViewController alloc] init];
            
            [self.navigationController pushViewController:registerVC animated:YES];
            self.iDText.text = nil;
            self.usernameText.text = nil;
        }];
        
        [alerVC addAction:doneAction];
        [alerVC addAction:registerAction];
        [self presentViewController:alerVC animated:YES completion:nil];
    
    }else{
        if (inputName.length == 0) {
            UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入姓名" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.iDText.text = nil;
            }];
            [alerVC addAction:doneAction];
            [self presentViewController:alerVC animated:YES completion:nil];
        }else {
        
            [arr enumerateObjectsUsingBlock:^(DCPerson *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([inputPersonNum isEqualToString:obj.personNum]) {
                    //记录登录
                    self.isLogined = YES;
                    
                    //让系统通知变为没有读取
                    BOOL isReaded = YES;
                    [[NSUserDefaults standardUserDefaults] setBool:isReaded forKey:@"isReaded"];
                    
                    [[NSUserDefaults standardUserDefaults] setBool:self.isLogined forKey:@"isLogined"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功,感谢您的使用" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        self.iDText.text = nil;
                        self.usernameText.text = nil;
                        [self.navigationController popToRootViewControllerAnimated:YES];
                    }];
                    [alerVC addAction:doneAction];
                    [self presentViewController:alerVC animated:YES completion:nil];
                    
                }else{
                    //                DCLog(@"对不起,请输入您正确的身份证号");
                    UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入您正确的身份证号" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        self.iDText.text = nil;
                    }];
                    [alerVC addAction:doneAction];
                    [self presentViewController:alerVC animated:YES completion:nil];
                }
                
            }];
        }
    }
    

    
}

//点击跳转注册
- (void)goToRegister
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
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