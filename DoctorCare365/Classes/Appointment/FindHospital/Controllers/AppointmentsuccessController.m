//
//  AppointmentsuccessController.m
//  DoctorCare365
//
//  Created by mac on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AppointmentsuccessController.h"
#import "AppointmentsuccessTableCell.h"

@interface AppointmentsuccessController ()

@end

@implementation AppointmentsuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条内容
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backUpVc)];
    
    self.navigationItem.title = @"已提交审核";
    
    
    //注册cell
    [self.tableView registerClass:[AppointmentsuccessTableCell class] forCellReuseIdentifier:@"success"];

    self.tableView.rowHeight = [UIScreen mainScreen].bounds.size.height + 64;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //cell
    AppointmentsuccessTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"success"];
    
    //取消tableView选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


//返回到上一个界面
-(void)backUpVc{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
