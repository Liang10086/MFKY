//
//  LeftTableViewController.m
//  DoctorCare365
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "LeftTableViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "SettingController.h"
#import "OpinionViewController.h"

@interface LeftTableViewController ()

@end

@implementation LeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建头部视图
    [self addHeadView];
    
    //创建底部视图
    [self addFootView];
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"loginCell"];
}


//创建头部视图
-(void)addHeadView{
    //创建view
    UIView  *headView = [[UIView alloc]init];
    
    headView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    
    headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav"]];
    
    self.tableView.tableHeaderView = headView;
    
    //创建头像
    
    UIImageView *nameimage = [[UIImageView alloc] init];
    
    nameimage.image = [UIImage imageNamed:@"name"];
    
    [headView addSubview:nameimage];
    
    
    //创建登录按钮
    UIButton *loginBtn = [[UIButton alloc] init];
    
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //打开边框线
    [loginBtn.layer setMasksToBounds:YES];
    [loginBtn.layer setCornerRadius:9.0];
    [loginBtn.layer setBorderWidth:1.2];
    
    [headView addSubview:loginBtn];
    
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
    //创建注册按钮
    UIButton *registerBtn = [[UIButton alloc] init];
    
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    
    [registerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [registerBtn.layer setMasksToBounds:YES];
    [registerBtn.layer setCornerRadius:9.0];
    [registerBtn.layer setBorderWidth:1.2];
    
    [headView addSubview:registerBtn];
    
    [registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    
    //创建label
    UILabel *isLogin = [[UILabel alloc] init];
    
    [isLogin setText:@"未登录"];
    
    isLogin.textColor = [UIColor grayColor];
    
    [isLogin setTextAlignment:NSTextAlignmentCenter];
    
    [headView addSubview:isLogin];
    

    
    //设置头像位置
    [nameimage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@30);
        make.width.height.equalTo(@80);
    }];
    
    //设置登录位置
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@35);
        make.bottom.equalTo(@-25);
        make.width.equalTo(@70);
        
        
    }];
    
    //设置注册位置
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(@-35);
        make.bottom.equalTo(@-25);
        make.width.equalTo(@70);
        
    }];
    
    //label位置
    [isLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(nameimage.mas_centerX);
        make.top.mas_equalTo(nameimage.mas_bottom).mas_offset(@10);
        make.height.equalTo(@20);
        make.width.equalTo(@80);
        
    }];
}

//登录
- (void)loginClick
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    [vc2 pushViewController:loginVC animated:YES];
}

//注册
- (void)registerClick
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    [vc2 pushViewController:registerVC animated:YES];
}


//创建底部视图
-(void)addFootView{
    UIView  *footView = [[UIView alloc]init];
    self.tableView.tableFooterView = footView;

}

#pragma mark - Table view data source

//设置每组里有多少个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}



//设置每个cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loginCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"设置与帮助";
    }
    else
    {
        cell.textLabel.text = @"意见与反馈";
    }
    
    
    //设置cell右侧的箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    return cell;
}

//选中cell的是,跳转界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        //设置与帮助
        SettingController *settingVC = [[SettingController alloc] init];
        
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        MMDrawerController *vc1 = (MMDrawerController *)vc;
        
        [vc1 closeDrawerAnimated:YES completion:nil];
        
        id vc2 = vc1.centerViewController;
        
        [vc2 pushViewController:settingVC animated:YES];
    }else {
        //意见反馈
        OpinionViewController *opinionVC = [[OpinionViewController alloc] init];
        
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        MMDrawerController *vc1 = (MMDrawerController *)vc;
        
        [vc1 closeDrawerAnimated:YES completion:nil];
        
        id vc2 = vc1.centerViewController;
        
        [vc2 pushViewController:opinionVC animated:YES];

    }
}

@end
