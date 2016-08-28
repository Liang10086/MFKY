//
//  PayTableViewController.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PayTableViewController.h"
#import "PayTableViewCell.h"
@interface PayTableViewController ()

@end

@implementation PayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UITableView alloc]init];
    
    [self.tableView registerClass:[PayTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(click)];

}

- (void)click
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //医生名字
    cell.name.text = @"王医生";
    NSArray *price = @[
                     @"- 4.00",
                     @"- 49.00",
                     @"- 49.00"
                     ];
    
    NSArray *gift = @[
                      @"鲜花",
                      @"锦旗",
                      @"10次咨询服务"
                      ];
    NSArray *render = @[
                        @"赠送",
                        @"赠送",
                        @"购买"
                        ];
    
    cell.priceLabel.text = price[indexPath.row];
    
    cell.gift.text = gift[indexPath.row];
    
    cell.render.text = render[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}


@end
