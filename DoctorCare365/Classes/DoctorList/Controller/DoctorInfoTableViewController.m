//
//  DoctorInfoTableViewController.m
//  doctorList
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorInfoTableViewController.h"
#import "DoctorInfoHeaderView.h"
#import "DoctorInfoCell.h"
#import "CollectViewController.h"
#import "LoginViewController.h"

@implementation DoctorInfoTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"医生详情";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(careDoctor)];
    
    
    DoctorInfoHeaderView *view = [[DoctorInfoHeaderView alloc]init];
    
    view.model = self.model;

    self.tableView.tableHeaderView = view;
    
    self.tableView.separatorStyle = NO;
    
    [self.tableView registerClass:[DoctorInfoCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView reloadData];
    

}
- (void)careDoctor{
    
    BOOL isLogined = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogined"];
    if (isLogined == YES) {
        CollectViewController *collectVC = [[CollectViewController alloc] init];
        [self.navigationController pushViewController:collectVC animated:YES];
    }else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请先登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            LoginViewController *loginVC = [[LoginViewController alloc] init];
            [self.navigationController pushViewController:loginVC animated:YES];
        }];
        [alertVC addAction:doneAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DoctorInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = self.model;
    
    cell.highlighted = NO;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return  [UIScreen mainScreen].bounds.size.height
    - self.tableView.tableHeaderView.bounds.size.height;
    
//    - tableView.tableHeaderView.bounds.size.height;
    
   
    
  
}
//
//- (BOOL)prefersStatusBarHidden {
//    
//    return YES;
//}




@end
