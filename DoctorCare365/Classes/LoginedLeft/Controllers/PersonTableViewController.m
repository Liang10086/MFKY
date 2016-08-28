//
//  PersonTableViewController.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PersonTableViewController.h"
#import "LoginedLeftTabController.h"

#import "PersonHeaderView.h"
#import "PersonFootView.h"
@interface PersonTableViewController ()

@property (strong, nonatomic)NSArray *arrM;

@property (strong, nonatomic) PersonFootView *personFooterView;

@end

@implementation PersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self upheader];
    
    [self upFoot];
    
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(clickRight)];
    self.navigationItem.rightBarButtonItem = right;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickleft)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma
#pragma mark -- 确定点击事件
- (void)clickRight{
    
    [self.navigationController popViewControllerAnimated:YES];
    self.personFooterView.index = 123;
}
- (void)clickleft{
    
 [self.navigationController popViewControllerAnimated:YES];

}

#pragma
#pragma mark -- 头部视图
- (void)upheader{

    PersonHeaderView *vc = [[PersonHeaderView alloc]init];

    vc.frame = CGRectMake(0, 0, 0, 130);
    
    vc.backgroundColor = [UIColor whiteColor];
    
    self.tableView.tableHeaderView = vc;
   
}

#pragma
#pragma mark -- 尾部视图
- (void)upFoot{

    PersonFootView *vc = [[PersonFootView alloc]init];
    
    vc.backgroundColor = [UIColor whiteColor];
    
    vc.frame = CGRectMake(0, 0, 0, 150);
    
    self.tableView.tableFooterView = vc;
    
    self.personFooterView = vc;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


@end
