//
//  FindViewController.m
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "FindViewController.h"
#import "DCFindModel.h"
#import "DCFindCell.h"
#import "DCHeadButton.h"
#import "DCHeadCell.h"

@interface FindViewController ()

@property (strong,nonatomic) NSArray *arrayData;


@end

@implementation FindViewController

-(NSArray *)arrayData{

    if (_arrayData == nil) {
        _arrayData = [DCFindModel findModel];
    }

    return _arrayData;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[DCFindCell class] forCellReuseIdentifier:@"cell"];
    
    //调用
    [self setUpUI];
    
    DCHeadCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"DCHeadCell" owner:nil options:nil]lastObject];
    
    self.tableView.tableHeaderView = cell;
    
}



//设置界面
-(void)setUpUI{
    

    self.tableView.rowHeight = 80;
    [self setNavigationItem];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:1];
    
//    UITableView *tableViewTwo = [[UITableView alloc]initWithFrame:CGRectMake(100, 0, self.view.bounds.size.width - 100, self.view.bounds.size.height)];
    
//    tableViewTwo.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) /255.0 green:arc4random_uniform(256) /255.0 blue:arc4random_uniform(256) /255.0 alpha:1];
    

//    [self.view addSubview:tableViewTwo];
    
    
    
}

-(void)setNavigationItem{

    //设置跳转view的颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏左侧的图标
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVc)];
    
    
    
    //创建文本框
    UITextField *textField = [[UITextField alloc]init];
    
    //文本框的位置
    textField.frame = CGRectMake(self.view.center.x, 0, 100, 30);
    
    //切圆角
    textField.layer.cornerRadius = 8;
    textField.layer.masksToBounds = YES;
    
    //UITextField 的右边view 出现模式
    textField.rightViewMode=UITextFieldViewModeAlways;
    
    //设置textField的颜色
    textField.backgroundColor = [UIColor whiteColor];
    
    //创建搜索按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:@"u16"] forState:UIControlStateNormal];
    
    //添加
    textField.rightView = btn;
    
    self.navigationItem.titleView = textField;




}


//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell，并进行注册
    DCFindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.arrayData[indexPath.row];
    
    return cell;
}


//左侧的图标点击
-(void)backToHomeVc{
    
    //返回主界面
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
