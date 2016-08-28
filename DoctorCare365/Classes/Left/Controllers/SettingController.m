//
//  SettingController.m
//  DoctorCare365
//
//  Created by fly on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "SettingController.h"
#import "ProtocolViewController.h"
#import "LeftTableViewController.h"
@interface SettingController () <UITableViewDelegate>

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置返回的按钮样式
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVC)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"设置与帮助";
    
    //设置默认的navigationBar上的title的字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    //创建底部视图
    [self addFootView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



//返回按钮调用方法
- (void)backToHomeVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

//创建底部视图
-(void)addFootView{
    UIView  *footView = [[UIView alloc]init];
    self.tableView.tableFooterView = footView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

//设置每个cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    //判断到底是那一行cell
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"联系客服";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"检查更新";
        //设置箭头前的文字
        cell.detailTextLabel.text = @"当前版本:1.0.0";
    }
    else
    {
        cell.textLabel.text = @"用户协议";
    }

    
    //设置cell右侧的箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {

//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    }
    else if (indexPath.row == 1)
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"已是最新版本" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alertVC addAction:action];
        
        [self presentViewController:alertVC animated:YES completion:nil ];
        
    }
    else if (indexPath.row == 2)
    {
        ProtocolViewController *nextView = [[ProtocolViewController alloc] init];
        
        [self.navigationController pushViewController:nextView animated:YES];
    }
}

- (void)setIndex:(NSInteger)index{
    _index = index;
    if (index == 111) {
        [self setUpOut];
    }
}

//退出按钮
- (void)setUpOut{
    UIButton *button = [[UIButton alloc] init];
    [self.tableView addSubview:button];
    [button setTitle:@"注销" forState:UIControlStateNormal];
    [button setTitle:@"注销" forState:UIControlStateHighlighted];
    
    button.backgroundColor = [UIColor redColor];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.tableView);
        make.width.mas_equalTo(@150);
        make.height.mas_equalTo(@30);
    }];
    
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    
    [button addTarget:self action:@selector(quitOut) forControlEvents:UIControlEventTouchUpInside];
    
}
//注销
- (void)quitOut{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确定要注销登录吗?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不,我只是不小心按错了" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"是的,我要注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        BOOL isLogined = NO;
        [[NSUserDefaults standardUserDefaults] setBool:isLogined forKey:@"isLogined"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        MMDrawerController *vc1 = (MMDrawerController *)vc;
        
        [vc1 closeDrawerAnimated:YES completion:nil];
        
        vc1.leftDrawerViewController = nil;
        
        LeftTableViewController *leftVC = [[LeftTableViewController alloc] init];
        vc1.leftDrawerViewController = leftVC;
        
        
        [self.navigationController popToRootViewControllerAnimated:leftVC];
    }];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:doneAction];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

@end
