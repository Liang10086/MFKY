//
//  FindDoctorTableViewController.m
//  DoctorCare365
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "FindDoctorTableViewController.h"
#import "FindDoctorTableViewCell.h"
#import "DCFindModel.h"
#import "DCFindCell.h"
#import "RegisterInterfaceController.h"
#import "FindDoctorView.h"
#import "FindViewController.h"


@interface FindDoctorTableViewController ()

@property (strong,nonatomic) NSArray *arrayData;

@end

@implementation FindDoctorTableViewController

//懒加载
-(NSArray *)arrayData{
    
    if (_arrayData == nil) {
        _arrayData = [DCFindModel findModel];
    }
    
    return _arrayData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerNotification:) name:@"smallToAppointment" object:nil];
    
    //注册cell(地图)
    [self.tableView registerClass:[DCFindCell class] forCellReuseIdentifier:@"cellID"];
    
    //注册cell
    [self.tableView registerClass:[FindDoctorTableViewCell class] forCellReuseIdentifier:@"cellHead"];
    
    //把FindDoctor.xib添加为头部视图
    FindDoctorView *findDoctorView = [[[NSBundle mainBundle]loadNibNamed:@"FindDoctor" owner:self options:nil]lastObject];
    
    self.tableView.tableHeaderView = findDoctorView;

    findDoctorView.intag = self.intag;
    
    findDoctorView.cellStr = self.cellStr;
    
    //导航栏左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToVc)];
    
    self.navigationItem.title = @"北京医学院";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)observerNotification:(NSNotification *)notification{
    
    NSString *str = notification.userInfo[@"title"];
    NSInteger index = [notification.userInfo[@"index"] intValue];
    self.intag = index %5 +1;
    self.cellStr = str;
}

//返回到科室界面
-(void)backToVc{

    [self.navigationController popViewControllerAnimated:YES];
}

//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

//cell(地图)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell，并进行注册
    DCFindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.model = self.arrayData[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//点击tableview进行跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    FindViewController *findVc = [[FindViewController alloc]init];
    
    [self.navigationController pushViewController:findVc animated:YES];

}

-(void)setIntag:(NSInteger)intag{
    _intag = intag;    
}

-(void)setCellStr:(NSString *)cellStr{
    _cellStr = cellStr;
}


@end
