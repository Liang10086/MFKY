//
//  HeadImageTableViewController.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "HeadImageTableViewController.h"
#import "PhotoView.h"
@interface HeadImageTableViewController ()

@end

@implementation HeadImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updata];
    
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *retu = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickRenturn)];
    self.navigationItem.leftBarButtonItem = retu;
    
    UIBarButtonItem *keep = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickAdd)];
    
    self.navigationItem.rightBarButtonItem = keep;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)clickRenturn{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickAdd{
    NSLog(@"保存");
}

- (void)updata{

    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    
    PhotoView *vc = [[PhotoView alloc]init];
    
    vc.frame = CGRectMake(0, 0, 0, h);
    
//    vc.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = vc;

}


@end
