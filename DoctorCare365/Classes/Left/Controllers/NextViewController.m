//
//  NextViewController.m
//  DoctorCare365
//
//  Created by fly on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "NextViewController.h"
#import "RegisterViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置返回按钮的样式
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToRegister)];
    
    [self setUpUI];
}
- (void)setName:(NSString *)name{
    _name = name;
}

- (void)setPersonNum:(NSString *)personNum{
    _personNum = personNum;
}

-(void)setPhoneNum:(NSString *)phoneNum{
    _phoneNum = phoneNum;
}

- (void)backToRegister
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"用户注册";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    //创建label
    UILabel *hintLab = [[UILabel alloc] init];
    
    hintLab.text = @"请您确认注册信息";
    
    hintLab.textColor = [UIColor blueColor];
    
    hintLab.textAlignment = NSTextAlignmentCenter;
    
    hintLab.font = [UIFont systemFontOfSize:22];
    
    [self.view addSubview:hintLab];
    
    
    
    //名字label
    UILabel *nameLeftLab = [[UILabel alloc] init];
    
    nameLeftLab.textAlignment = NSTextAlignmentCenter;
    
    nameLeftLab.text = @"真实姓名:";
    
    UILabel *nameRightLab = [[UILabel alloc] init];
    
    nameRightLab.text = self.name;

    [self.view addSubview:nameLeftLab];
    
    [self.view addSubview:nameRightLab];
    
    nameLeftLab.textColor = [UIColor grayColor];
    
    
    
    //证件类型label
    UILabel *IDStyleLeft = [[UILabel alloc] init];
    
    IDStyleLeft.textAlignment = NSTextAlignmentCenter;
    
    IDStyleLeft.text = @"证件类型:";
    
    UILabel *IDStyleRight = [[UILabel alloc] init];
    
    IDStyleRight.text = @"身份证";
    
    [self.view addSubview:IDStyleLeft];
    
    [self.view addSubview:IDStyleRight];
    
    IDStyleLeft.textColor = [UIColor grayColor];
    
    
    
    //证件号码label
    UILabel *IDNubLeft = [[UILabel alloc] init];
    
    IDNubLeft.textAlignment = NSTextAlignmentCenter;
    
    IDNubLeft.text = @"证件号码:";
    
    UILabel *IDNubRight = [[UILabel alloc] init];
    
    IDNubRight.text = self.personNum;
    

    IDNubRight.font = [UIFont systemFontOfSize:17];
    
    IDNubRight.numberOfLines = 0;

    [self.view addSubview:IDNubLeft];
    
    [self.view addSubview:IDNubRight];
    
    IDNubLeft.textColor = [UIColor grayColor];
    
    
    
    
    
    //手机号码label
    UILabel *phoneNumLeft = [[UILabel alloc] init];
    
    phoneNumLeft.textAlignment = NSTextAlignmentCenter;
    
    phoneNumLeft.text = @"电话号码:";
    
    UILabel *phoneNumRight = [[UILabel alloc] init];
    
    phoneNumRight.text = self.phoneNum;
    
    phoneNumRight.font = [UIFont systemFontOfSize:17];
    
    [self.view addSubview:phoneNumLeft];
    
    [self.view addSubview:phoneNumRight];
    
    phoneNumLeft.textColor = [UIColor grayColor];
    
    
    
    
    
    
    
    //创建完成注册按钮
    UIButton *registerBtn = [[UIButton alloc] init];
    //设置背景图片
    UIImage *backgroudImage = [UIImage imageNamed:@"nav"];
    [registerBtn setBackgroundImage:backgroudImage forState:UIControlStateNormal];
    
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"link_button_01"] forState:UIControlStateHighlighted];
    
    //设置文字颜色
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //设置文字内容
    [registerBtn setTitle:@"完成注册" forState:UIControlStateNormal];
    [registerBtn setTitle:@"完成注册" forState:UIControlStateHighlighted];
    
    [registerBtn.layer setMasksToBounds:YES];
    [registerBtn.layer setCornerRadius:9.0];
    
    [self.view addSubview:registerBtn];
    
    [registerBtn addTarget:self action:@selector(goToHomeVC) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //提醒label的位置
    [hintLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@30);
        make.width.equalTo(@260);
        make.height.equalTo(@50);
    }];
    
    
    //姓名位置
    [nameLeftLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.top.equalTo(@100);
        make.width.equalTo(@85);
        make.height.equalTo(@35);
    }];
    
    [nameRightLab mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.left.equalTo(@115);
        make.right.equalTo(@-30);
        make.height.equalTo(@35);
    }];
    
    
    //证件类型位置
    [IDStyleLeft mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.top.equalTo(@160);
        make.width.equalTo(@85);
        make.height.equalTo(@35);
    }];
    
    [IDStyleRight mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@160);
        make.left.equalTo(@115);
        make.right.equalTo(@-30);
        make.height.equalTo(@35);
    }];
    
    
    
    //证件号码位置
    [IDNubLeft mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.top.equalTo(@220);
        make.width.equalTo(@85);
        make.height.equalTo(@35);
    }];
    
    [IDNubRight mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@220);
        make.left.equalTo(@115);
        make.right.equalTo(@-30);
    }];
    
    
    
    //手机号位置
    [phoneNumLeft mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.top.equalTo(@280);
        make.width.equalTo(@85);
        make.height.equalTo(@35);
    }];
    
    [phoneNumRight mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@280);
        make.left.equalTo(@115);
        make.right.equalTo(@-30);
        make.height.equalTo(@35);
    }];
    
    
    //logBtn位置
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@350);
        make.width.equalTo(@260);
        make.height.equalTo(@40);
    }];
}

//点击注册完成跳转回主界面
- (void)goToHomeVC
{   //改为登录状态
    BOOL isLogined = YES;
    [[NSUserDefaults standardUserDefaults] setBool:isLogined forKey:@"isLogined"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //数据库存储
    DCPerson *person = [[DCPerson alloc] init];
    person.name = self.name;
    person.personNum = self.personNum;
    person.phoneNum = self.phoneNum;
    [DCsqLite insertWithPerson:person];
    
    //返回根控制器
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
