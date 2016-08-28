//
//  RegisterInterfaceController.m
//  DoctorCare365
//
//  Created by mac on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RegisterInterfaceController.h"
#import "RegisterInterfaceCell.h"
#import "AppointmentsuccessController.h"

@interface RegisterInterfaceController ()

@end

@implementation RegisterInterfaceController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //注册cell
    [self.tableView registerClass:[RegisterInterfaceCell class] forCellReuseIdentifier:@"register"];
    
    //设置滚动行高
    self.tableView.rowHeight = [UIScreen mainScreen].bounds.size.height + 150;
 
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToVc)];
    self.navigationItem.title = @"挂号信息确认";
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//返回到上一个界面
-(void)backToVc{

    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    RegisterInterfaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"register"];
    
    //取消tableView选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;


}


@end
