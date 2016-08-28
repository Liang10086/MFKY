//
//  HospitalprofileViewController.m
//  DoctorCare365
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "HospitalprofileViewController.h"
#import "HospitalprofileTableViewCell.h"

@interface HospitalprofileViewController ()

@end

@implementation HospitalprofileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置cell样式
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;

    
    [self setUpUI];
}

-(void)setUpUI{
    
    //设置导航栏左侧的图标
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToVc)];
    
    self.navigationItem.title =@"医院简介";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

//点击右侧按钮，回到上一个界面
- (void)backToVc{
    [self.navigationController popViewControllerAnimated:YES];
}

//左侧的图标点击
-(void)backToHomeVC{
    //返回主界面
    [self.navigationController popToRootViewControllerAnimated:YES];;
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DCHospitalprofile" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 600;
}
 

@end







