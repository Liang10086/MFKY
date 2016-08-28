//
//  CollectViewController.m
//  DoctorCare365
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "CollectViewController.h"
#import "FindViewController.h"
#import "DoctorTableViewController.h"
#import "DiseasesViewController.h"

@interface CollectViewController ()

@property (assign, nonatomic) NSInteger Index;

@property (strong, nonatomic) UITableView *view1;
@property (strong, nonatomic) UITableView *view2;
@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FindViewController *findVC = [[FindViewController alloc] init];
    findVC.idx = 333;
    
    
    //    //设置导航栏左侧的图标
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVc)];
    
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"关注的医院",@"关注的医生", nil];
    
    //初始化UISegmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.bounds = CGRectMake(0, 0, 140, 30);
    // 设置默认选择项索引
    segmentedControl.selectedSegmentIndex = 1;
    
    [segmentedControl addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    
    DoctorTableViewController *doctorVC = [[DoctorTableViewController alloc] init];
    
    [self addChildViewController:findVC];
    [self addChildViewController:doctorVC];
    
    self.view1 = findVC.tableView;
    self.view2 = doctorVC.tableView;
    
    self.view1.frame = self.view.bounds;
    self.view2.frame = self.view.bounds;
    
    [self.view addSubview:self.view2];
}

-(void)didClicksegmentedControlAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    self.Index = Index;
    
    if (Index == 0) {
        [self.view2 removeFromSuperview];
        [self.view addSubview:self.view1];
    }else if (Index == 1){
        [self.view1 removeFromSuperview];
        [self.view addSubview:self.view2];
    }
}

-(void)backToHomeVc{
    //返回主界面
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
