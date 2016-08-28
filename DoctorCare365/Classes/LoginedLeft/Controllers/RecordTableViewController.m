//
//  RecordTableViewController.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RecordTableViewController.h"
#import "RecordHeadView.h"
#import "RecordFootView.h"
#import "RecordTableViewCell.h"
@interface RecordTableViewController ()

@end

@implementation RecordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self upHead];
    
    [self upFoot];
    
    [self.tableView registerClass:[RecordTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickBarButton)];
}

- (void)clickBarButton{

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)upFoot{

    RecordFootView *foot = [[RecordFootView alloc]init];
    
    foot.frame = CGRectMake(0, 0, 0, [UIScreen mainScreen].bounds.size.height * 0.1);
    
//    foot.backgroundColor = [UIColor redColor];
    
    self.tableView.tableFooterView = foot;
    
}
- (void)upHead{
    RecordHeadView *head = [[RecordHeadView alloc]init];
    
    head.frame = CGRectMake(0, 0, 0, 160);
    
    self.tableView.tableHeaderView = head;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    return [UIScreen mainScreen].bounds.size.height * 0.6;

}


@end
