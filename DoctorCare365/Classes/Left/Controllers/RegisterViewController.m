//
//  RegisterViewController.m
//  DoctorCare365
//
//  Created by fly on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RegisterViewController.h"
#import "NextViewController.h"

#import "ProtocolViewController.h"

#import <SMS_SDK/SMSSDK.h>

@interface RegisterViewController ()
@property (nonatomic, assign) BOOL bl;
//名字
@property (nonatomic, weak) UITextField *usernameText;
//身份证号
@property (nonatomic, weak) UITextField *iDText;
//电话号码
@property (nonatomic, weak) UITextField *phoneNumText;
//验证码文本框
@property (nonatomic, weak) UITextField *verifyText;
//登录按钮
@property (nonatomic, weak) UIButton *logBtn;
//获取验证码
@property (nonatomic, weak) UIButton *verifyButton;

@property (strong, nonatomic) NSTimer *timer;

//解决键盘挡住界面问题
@property (strong, nonatomic) TPKeyboardAvoidingScrollView *scrollView;
@end

@implementation RegisterViewController

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
    
    
    self.scrollView.frame = [UIScreen mainScreen].bounds;
    
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height);
    
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"用户注册";
    
    //设置默认的navigationBar上的title的字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    

    //创建用户名文本框
    UITextField *usernameText = [[UITextField alloc]init];
    
    //设置文本框的边框颜色
    usernameText.layer.borderColor = [[UIColor grayColor] CGColor];
    usernameText.layer.borderWidth = 2.0;
    
    //设置textField的颜色
    usernameText.backgroundColor = [UIColor whiteColor];
    
    usernameText.placeholder = @"请输入真实姓名";
    
    //创建文本框左边的图片
    UIImage *image = [UIImage imageNamed:@"用户"];
    
    usernameText.leftView = [[UIImageView alloc] initWithImage:image];
    
    usernameText.leftView.bounds = CGRectMake(0, 0, 32, 0);
    
    usernameText.leftView.contentMode = UIViewContentModeCenter;
    
    usernameText.leftViewMode = UITextFieldViewModeAlways;
    
    [self.scrollView addSubview:usernameText];
    
    self.usernameText = usernameText;
    
    
    
    //创建身份证文本框
    UITextField *iDText = [[UITextField alloc]init];
    
    //设置文本框的边框颜色
    iDText.layer.borderColor = [[UIColor grayColor] CGColor];
    iDText.layer.borderWidth = 2.0;
    
    //设置textField的颜色
    iDText.backgroundColor = [UIColor whiteColor];
    
    iDText.placeholder = @"请输入身份证";
    
    //创建文本框左边的图片
    iDText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"请输入证件号码左边图标"]];
    
    iDText.leftView.bounds = CGRectMake(0, 0, 32, 0);
    
    iDText.leftView.contentMode = UIViewContentModeCenter;
    
    iDText.leftViewMode = UITextFieldViewModeAlways;
    
    [self.scrollView addSubview:iDText];
    
    self.iDText = iDText;
    
    
    
    //创建用手机号文本框
    UITextField *phoneNumText = [[UITextField alloc]init];
    
    //设置文本框的边框颜色
    phoneNumText.layer.borderColor = [[UIColor grayColor] CGColor];
    phoneNumText.layer.borderWidth = 2.0;
    
    //设置textField的颜色
    phoneNumText.backgroundColor = [UIColor whiteColor];
    
    phoneNumText.placeholder = @"请输入手机号";
    
    //创建文本框左边的图片
    phoneNumText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shouji"]];
    
    phoneNumText.leftView.bounds = CGRectMake(0, 0, 34, 0);
    
    phoneNumText.leftView.contentMode = UIViewContentModeCenter;
    
    phoneNumText.leftViewMode = UITextFieldViewModeAlways;
    
    [self.scrollView addSubview:phoneNumText];
    self.phoneNumText = phoneNumText;
    
    
    
    //创建验证码输入框
    UITextField *verifyText = [[UITextField alloc]init];
    
    //设置文本框的边框颜色
    verifyText.layer.borderColor = [[UIColor grayColor] CGColor];
    verifyText.layer.borderWidth = 2.0;
    
    //设置textField的颜色
    verifyText.backgroundColor = [UIColor whiteColor];
    
    verifyText.placeholder = @"请输入验证码";
    
    //创建文本框左边的图片
    verifyText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"请输入证件号码左边图标"]];
    
    verifyText.leftView.bounds = CGRectMake(0, 0, 32, 0);
    
    verifyText.leftView.contentMode = UIViewContentModeCenter;
    
    verifyText.leftViewMode = UITextFieldViewModeAlways;
    
    [self.scrollView addSubview:verifyText];
    
    self.verifyText = verifyText;
    
    
    //创建验证码输入框旁边的验证按钮
    UIButton *verifyButton = [[UIButton alloc] init];
    
    //普通状态下
    [verifyButton setBackgroundColor:[UIColor grayColor]];
    
    [verifyButton addTarget:self action:@selector(buttonNormal:) forControlEvents:UIControlEventTouchUpInside];
    
    //高亮状态下
    [verifyButton addTarget:self action:@selector(buttonHeight:) forControlEvents:UIControlEventTouchDown];
    
    
    //设置文字颜色
    [verifyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [verifyButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    //设置文字内容
    [verifyButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [verifyButton setTitle:@"获取验证码" forState:UIControlStateHighlighted];
    
    [self.scrollView addSubview:verifyButton];
    
    self.verifyButton = verifyButton;
    
    
    
    //创建用户是否同意按钮
    UIButton *agreeBtn = [[UIButton alloc] init];
    
    [self.scrollView addSubview:agreeBtn];
    
    [agreeBtn setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
    
    self.bl = YES;
    
    
    [agreeBtn addTarget:self action:@selector(clickAgreeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //创建用户同意label
    UILabel *agreeLab = [[UILabel alloc] init];
    
    agreeLab.text = @"用户已阅读并同意";
    
    agreeLab.backgroundColor = [UIColor whiteColor];
    
    [self.scrollView addSubview:agreeLab];
    
    
    
    
    //创建用户协议按钮
    UIButton *protocolBtn = [[UIButton alloc] init];
    
    [protocolBtn setTitle:@"用户协议" forState:UIControlStateNormal];
    [protocolBtn setTitle:@"用户协议" forState:UIControlStateHighlighted];
    
    [protocolBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [protocolBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [self.scrollView addSubview:protocolBtn];
    
    
    [protocolBtn addTarget:self action:@selector(protocolClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
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
    [logBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [logBtn setTitle:@"下一步" forState:UIControlStateHighlighted];
    
    [logBtn.layer setMasksToBounds:YES];
    [logBtn.layer setCornerRadius:9.0];
    
    [self.scrollView addSubview:logBtn];
    self.logBtn = logBtn;
    self.logBtn.enabled = NO;
    
    //下一步按钮点击事件
    [logBtn addTarget:self action:@selector(NextClick) forControlEvents:UIControlEventTouchUpInside];

    //用户名文本框的位置
    [usernameText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.equalTo(@250);
        make.height.equalTo(@40);
        
    }];
    
    //id文本框的位置
    [iDText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@110);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.equalTo(@250);
        make.height.equalTo(@40);
        
    }];
    
    
    //手机号文本框的位置
    [phoneNumText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@170);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.equalTo(@250);
        make.height.equalTo(@40);
        
    }];
    
    
    //验证码文本框
    [verifyText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@230);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(-25);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
        
    }];
    
    //验证密码按钮
    [verifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@230);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(75);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        
    }];
    
    //用户同意按钮
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@290);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(-120);
        make.width.equalTo(@25);
        make.height.equalTo(@25);
        
    }];
    
    //用户同意label
    [agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@290);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(-25);
        make.width.equalTo(@150);
        make.height.equalTo(@25);
        
    }];
    
    //用户协议按钮
    [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@290);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(85);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
        
    }];
    
    //logBtn位置
    [logBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(@350);
        make.width.mas_equalTo(@250);
        make.height.equalTo(@40);
    }];


}





//获取验证码的点击修改背景颜色 并且发送短信
- (void)buttonNormal:(UIButton *)sender
{
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
     *  @param result            请求结果回调(Results of the request)
     */
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumText.text
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error){
                                     if (!error) {
                                         UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"获取验证码成功,请注意查收" preferredStyle:UIAlertControllerStyleAlert];

                                         
                                         [self presentViewController:alerVC animated:YES completion:nil];
                                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                             //0.5秒后自己关闭弹窗
                                             [alerVC dismissViewControllerAnimated:YES completion:^{
                                                 self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
                                                 [[NSRunLoop mainRunLoop] addTimer: self.timer forMode: NSRunLoopCommonModes];
                                             }];
                                         });

                                     } else {
                                         UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号码" preferredStyle:UIAlertControllerStyleAlert];
                                         UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                             self.phoneNumText.text = nil;
                                         }];
                                         [alerVC addAction:doneAction];
                                         [self presentViewController:alerVC animated:YES completion:nil];
                                     }
                                 }
     ];
    
    sender.backgroundColor = [UIColor grayColor];
    
}



//计时器的方法
- (void)countdown{
    static int timeCount = 60;
    timeCount --;
    
    if (timeCount == 0) {
        //invalidate: 使....无效
        [self.timer invalidate];
        
        //然后赋值为nil
        self.timer = nil;
        self.verifyButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self.verifyButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.verifyButton setTitle:@"获取验证码" forState:UIControlStateHighlighted];
        self.verifyButton.enabled = YES;
    }else {
        self.verifyButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.verifyButton setTitle:[NSString stringWithFormat:@"重新发送%ds",timeCount] forState:UIControlStateNormal];
        self.verifyButton.enabled = NO;
    }
}

- (void)buttonHeight:(UIButton *)sender
{
    sender.backgroundColor = [UIColor whiteColor];
}


//是否选中按钮
- (void)clickAgreeBtn:(UIButton *)agreeBtn
{
    [self.view endEditing:YES];
    
    if (self.bl == NO)
    {
        [agreeBtn setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
        self.logBtn.enabled = NO;
        self.bl = YES;
    }
    else if (self.bl == YES)
    {
        [agreeBtn setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateNormal];
        self.logBtn.enabled = YES;
        self.bl = NO;
    }
}


//用户协议跳转
- (void)protocolClick
{
   ProtocolViewController *nextView = [[ProtocolViewController alloc] init];
    
    [self.navigationController pushViewController:nextView animated:YES];
}


//点击跳转下一页
- (void)NextClick
{
    if (self.usernameText.text.length == 0) {

        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入姓名" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.usernameText.text = nil;
        }];
        [alerVC addAction:doneAction];
        [self presentViewController:alerVC animated:YES completion:nil];
    }else if (self.iDText.text.length == 0) {
        
        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入身份证号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.iDText.text = nil;
        }];
        [alerVC addAction:doneAction];
        [self presentViewController:alerVC animated:YES completion:nil];
    }else if (self.iDText.text.length != 18) {
        
        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的身份证号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.iDText.text = nil;
        }];
        [alerVC addAction:doneAction];
        [self presentViewController:alerVC animated:YES completion:nil];
        
    }else if (self.phoneNumText.text.length == 0) {

        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入手机号码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.phoneNumText.text = nil;
        }];
        [alerVC addAction:doneAction];
        [self presentViewController:alerVC animated:YES completion:nil];
    }else if (self.phoneNumText.text.length != 11) {
        
        UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.phoneNumText.text = nil;
        }];
        [alerVC addAction:doneAction];
        [self presentViewController:alerVC animated:YES completion:nil];

    }else {
        [SMSSDK commitVerificationCode: self.verifyText.text phoneNumber:self.phoneNumText.text zone:@"86" result:^(NSError *error) {
            
            if (!error) {
                
                NextViewController *nextView = [[NextViewController alloc] init];
                nextView.name = self.usernameText.text;
                nextView.personNum = self.iDText.text;
                nextView.phoneNum = self.phoneNumText.text;
                [self.navigationController pushViewController:nextView animated:YES];
                
            }
            else
            {
                UIAlertController *alerVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误,请输入正确验证码" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alerVC addAction:doneAction];
                [self presentViewController:alerVC animated:YES completion:nil];
                
            }
        }];
    }

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
