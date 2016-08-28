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
#import "DCHeadCellTwo.h"
#import "DiseasesViewController.h"
#import "FindDoctorTableViewController.h"
#import "DoctorTableViewController.h"

@interface FindViewController ()

@property (strong,nonatomic) NSMutableArray *arrayData;

@property (strong,nonatomic) NSMutableArray *oldArrayData;

@property (strong, nonatomic) UITextField *textField;

@end

@implementation FindViewController
//懒加载
-(NSMutableArray *)arrayData{
    
    if (_arrayData == nil) {
        _arrayData = [DCFindModel findModel];
    }
    
    return _arrayData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.tableView registerClass:[DCFindCell class] forCellReuseIdentifier:@"cell"];
    
    //调用
    [self setUpUI];
    
    
    
    //接收
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(demo:) name:@"bba" object:nil];
    
}

-(void)demo:(NSNotification *)sender{

    if(self.arrayData.count != 0){
        //如果有内容的时候，点击为空
        self.oldArrayData = self.arrayData;
        self.arrayData = nil;
    }else{
        self.arrayData = self.oldArrayData;
    }
    [self.tableView reloadData];
    
}

//给文字赋值
-(void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    [self setUpUI];
}

//设置索引判断点击
-(void)setIdx:(NSInteger)idx{
    _idx = idx;
    [self setUpUI];
}

//设置界面
-(void)setUpUI{
    //提取
    DCHeadCell *cell;
    
    //如果等于2跳转到DCHeadCellTwo
    if(self.idx == DepartmentToHospital){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DCHeadCellTwo" owner:nil options:nil]lastObject];
        
        //发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Department" object:nil userInfo:@{@"title":[NSString stringWithFormat:@"%@",self.nameStr]}];
        
    } else if (self.idx == 333){
        
    }else{
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"DCHeadCell" owner:nil options:nil]lastObject];
        
    }
    
    self.tableView.tableHeaderView = cell;
    
    //固定行高
    self.tableView.rowHeight = 80;

    [self setNavigationItem];

    //设置tableView背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
}



//设置导航栏文字
-(void)setNavigationItem{
    
    //设置导航栏左侧的图标
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backToHomeVc)];
    
    //创建文本框
    UITextField *textField = [[UITextField alloc]init];
    
    //文本框的位置
    textField.frame = CGRectMake(self.view.center.x, 0, 180, 30);
    
    //切圆角
    textField.layer.cornerRadius = 8;
    textField.layer.masksToBounds = YES;
    
    //UITextField 的右边view 出现模式
    textField.rightViewMode=UITextFieldViewModeAlways;
    
    //设置textField的颜色
    textField.backgroundColor = [UIColor whiteColor];
    
    //设置textField的属性
    textField.placeholder = @"  输入医院名称查找";
    textField.textColor = [UIColor redColor];
    textField.font = [UIFont systemFontOfSize:14];
    
    //创建搜索按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:@"u16"] forState:UIControlStateNormal];
    
    //添加
    textField.rightView = btn;
    
    [btn addTarget:self action:@selector(searchForHospital) forControlEvents:UIControlEventTouchUpInside];
    
    //赋值
    self.navigationItem.titleView = textField;
    
    self.textField = textField;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)searchForHospital{
    //  模糊查询数据，使用谓词， 通过数组查找
    [self.textField resignFirstResponder];
    NSString *filter = [NSString stringWithFormat:@"name like '*%@*'", self.textField.text];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:filter];
    
    if (self.textField.text.length == 0) {
         self.arrayData = [DCFindModel findModel];
        
    } else {
        NSArray *tempArray = [self.arrayData filteredArrayUsingPredicate:predicate];
        
        [self.arrayData removeAllObjects];
        [self.arrayData addObjectsFromArray:tempArray];
        
    }
    [self.tableView reloadData];
}



//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell，并进行注册
    DCFindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.arrayData[indexPath.row];
    
    FindDoctorTableViewController *findDoctorVc = [[FindDoctorTableViewController alloc]init];
    findDoctorVc.cellStr = cell.textLabel.text;
    findDoctorVc.intag = (cell.tag % 5) + 1;
    
    return cell;
}

//左侧的图标点击
-(void)backToHomeVc{
    //返回主界面
    [self.navigationController popViewControllerAnimated:YES];
}

//选中的行进行跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.idx == DepartmentToHospital) {
        FindDoctorTableViewController *findDoctorVc = [[FindDoctorTableViewController alloc]init];
        [self.navigationController pushViewController:findDoctorVc animated:YES];
    }else{
    
        DiseasesViewController *diseasesVc = [[DiseasesViewController alloc]init];
        
        diseasesVc.departmentToHospital = DepartmentToHospital;
        
        [self.navigationController pushViewController:diseasesVc animated:YES];
    
    }
    
   
}

@end
