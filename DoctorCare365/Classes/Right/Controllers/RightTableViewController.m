//
//  RightTableViewController.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RightTableViewController.h"
#import "RightTableViewCell.h"

@interface RightTableViewController ()

@end

@implementation RightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    
    [self.tableView registerClass:[RightTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVC)];
    
    //设置tableView的预估行高
    self.tableView.estimatedRowHeight = 300;
    
    //设置tableView的行高自动计算
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}
//返回按钮
- (void)backToHomeVC{
    //判断是否点进去看了系统通知,如果点了,就认为是已经读了
    BOOL isReaded = YES;
    [[NSUserDefaults standardUserDefaults] setBool:isReaded forKey:@"isReaded"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    


    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



@end
