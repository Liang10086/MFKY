//
//  DoctorTableViewController.m
//  doctorList
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorTableViewController.h"
#import "DoctorTabViewCell.h"
#import "DoctorModel.h"
#import "DoctorInfoTableViewController.h"

@interface DoctorTableViewController ()

@property (strong,nonatomic)NSArray *dataArray;

@end

@implementation DoctorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"医生选择";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
    
    [DoctorModel doctorModelsWithFinshedBlock:^(NSArray *dataArr) {
        
        self.dataArray = dataArr;
        
        [self.tableView reloadData];
        
    }];
    
    self.tableView.separatorStyle = NO;
    
    [self.tableView registerClass:[DoctorTabViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];


    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorTabViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    DoctorModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DoctorInfoTableViewController *docInfoVC = [[DoctorInfoTableViewController alloc]init];
    
    docInfoVC.navigationItem.title = @"医生信息";
    
    DoctorModel *model = self.dataArray[indexPath.row];
    
    docInfoVC.model = model;
    
    [self.navigationController pushViewController:docInfoVC animated:YES];
    
    
    
    
    
    
    
    
    
    
        


}

@end
