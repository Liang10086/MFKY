//
//  DiseaseTableViewController.m
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//


/**
 疾病和科室跳转
 */

#import "DiseaseTableViewController.h"

@interface DiseaseTableViewController ()

@property (strong , nonatomic) NSArray *array;

@end

@implementation DiseaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
    
    [self array];
}


//设置界面
-(void)setUpUI{
    
    UIView *rootVc = [[UIView alloc]init];
    
    //左侧 科室tableView
    UITableView *leftTableView = [[UITableView alloc]init];
    
    leftTableView.frame = CGRectMake(0, 0, 150, self.view.bounds.size.height);
    
    leftTableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:1];
        
    //右侧 科室tableView
    UITableView *rightTableView = [[UITableView alloc]init];
    
    rightTableView.frame = CGRectMake(150, 0, self.view.bounds.size.width - 150, self.view.bounds.size.height);
    
    rightTableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:1];
    
    //添加到view
    [rootVc addSubview:leftTableView];
    [rootVc addSubview:rightTableView];
    
}

//懒加载
-(NSArray *)array{

    if (_array == nil) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"disease.plist" ofType:nil];
        
        _array = [NSArray arrayWithContentsOfFile:path];
        
    }

    return _array;

}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row != 0) {
//        
//    }
//}


@end
