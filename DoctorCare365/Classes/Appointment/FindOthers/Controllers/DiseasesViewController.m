//
//  DiseasesViewController.m
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DiseasesViewController.h"
#import "FindViewController.h"
#import "DepartmentBigController.h"
#import "DepartmentSmallController.h"
#import "HospitalprofileTableViewCell.h"
#import "HospitalprofileViewController.h"
#import "SmallModel.h"

//疾病科
@interface DiseasesViewController ()

@property (strong , nonatomic)DepartmentBigController *leftTableVc;

@property (strong , nonatomic)DepartmentSmallController *rightTableVc;

@property (strong ,nonatomic)UIView *headView;

@property (strong , nonatomic)UILabel *hospital;

@property (strong ,nonatomic)UILabel *hospitalLevel;

@property (strong ,nonatomic)UILabel *addresLabel;

@property (strong ,nonatomic) UIButton *btn;

@property (strong ,nonatomic)UIImageView *fineImage;


@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) NSMutableArray *arrayData;

@end

@implementation DiseasesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //界面
    [self setUpUI];
    
    
    [self setNavigationItem];
    
    if (self.departmentToHospital == DepartmentToHospital) {
        
        [self setHeadView];
        
    }
    
    
}


-(void)setHeadView{
    //创建底部view
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:headView];
    self.headView = headView;
    
    //创建医院名称
    self.hospital = [[UILabel alloc]init];
    self.hospital.text = @"北京协和医院";
    self.hospital.font = [UIFont systemFontOfSize:18];
    //添加
    [headView addSubview:self.hospital];
    
    //创建医院等级
    self.hospitalLevel = [[UILabel alloc]init];
    self.hospitalLevel.text = @"二级甲等";
    self.hospitalLevel.font = [UIFont systemFontOfSize:14];
    //添加
    [headView addSubview:self.hospitalLevel];
    
    //创建医院详情label
    self.btn = [[UIButton alloc]init];
    [self.btn setTitle:@"查看医院详情" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.btn.titleLabel.font =[UIFont systemFontOfSize:14];
    [self.btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加
    [headView addSubview:self.btn];
    
    //创建地址lable
    self.addresLabel = [[UILabel alloc]init];
    self.addresLabel.text = @"北京市东城区帅府园一号   1km";
    self.addresLabel.textColor = [UIColor blueColor];
    
    //添加
    [headView addSubview:self.addresLabel];
    
    //创建定位图片
    self.fineImage = [[UIImageView alloc]init];
    self.fineImage.image = [UIImage imageNamed:@"u86"];
    //添加
    [headView addSubview:self.fineImage];
    
}

-(void)clickButton:(UIButton*)sender{
    HospitalprofileViewController *hospital = [[HospitalprofileViewController alloc]init];
    
    
    [self.navigationController pushViewController:hospital animated:YES];
    
}

//布局子控件不能在viewDidLoad中操作
-(void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    //手写tableVc的约束
    [self.leftTableVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.mas_equalTo(self.view);
        //if如果等于宏定义的话走这个方法
        if (self.departmentToHospital == DepartmentToHospital) {
            make.top.mas_equalTo(self.view).offset(65);
        }else{
            make.top.mas_equalTo(self.view);
        }
        
        make.width.mas_equalTo(150);
        
    }];
    
    [self.rightTableVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.view);
        if (self.departmentToHospital == DepartmentToHospital) {
            make.top.mas_equalTo(self.view).offset(65);
        }else{
            make.top.mas_equalTo(self.view);
        }
        
        make.left.mas_equalTo(self.leftTableVc.view.mas_right);
        
    }];
    
    //头部视图
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(65);
        
    }];
    
    //医院名称
    [self.hospital mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.headView).offset(8);
        make.width.mas_equalTo(150);
    }];
    
    //医院等级
    [self.hospitalLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.hospital);
        make.left.mas_equalTo(self.hospital.mas_right).offset(8);
        make.width.mas_equalTo(80);
    }];
    
    //详细信息
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.hospital);
        make.right.mas_equalTo(self.headView.mas_right).offset(-10);
    }];
    
    //地址图片
    [self.fineImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.hospital.mas_bottom).offset(5);
        make.left.mas_equalTo(self.headView).offset(8);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(20);
    }];
    
    //地址label
    [self.addresLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fineImage.mas_right).offset(8);
        make.top.mas_equalTo(self.hospital.mas_bottom).offset(8);
    }];
    
}

//设置界面
-(void)setUpUI{
    self.view.backgroundColor = [UIColor redColor];
    
    //左侧 科室tableView
    DepartmentBigController *leftTableVc = [[DepartmentBigController alloc]init];
    
    //右侧 科室tableView
    DepartmentSmallController *rightTableVc = [[DepartmentSmallController alloc]init];
    
    rightTableVc.index = self.departmentToHospital;
    
    //添加到view
    [self.view addSubview:leftTableVc.view];
    [self.view addSubview:rightTableVc.view];
    
    [self addChildViewController:leftTableVc];
    [self addChildViewController:rightTableVc];
    
    self.leftTableVc = leftTableVc;
    self.rightTableVc = rightTableVc;
    
}



//设置导航栏文字
-(void)setNavigationItem{
    
    //设置导航栏左侧的图标
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backHomeVc)];
    
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
    if (self.index == 3) {
        textField.placeholder = @"  输入疾病名称查找";
    }else{
        textField.placeholder = @"  输入科室名称查找";
    }
    
    textField.textColor = [UIColor redColor];
    textField.font = [UIFont systemFontOfSize:14];
    
    //创建搜索按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:@"u16"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(searchForHospital) forControlEvents:UIControlEventTouchUpInside];
    
    
    //添加
    textField.rightView = btn;
    
    //赋值
    self.navigationItem.titleView = textField;
    
    self.textField = textField;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSMutableArray *)arrayData{
    if (_arrayData == nil) {
        _arrayData = self.rightTableVc.smallArr;
    }
    return _arrayData;
}

- (void)searchForHospital{
    //  模糊查询数据，使用谓词， 通过数组查找
    [self.textField resignFirstResponder];
    NSString *filter = [NSString stringWithFormat:@"name like '*%@*'", self.textField.text];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:filter];
    
    
    if (self.textField.text.length == 0) {
        self.rightTableVc.smallArr = [SmallModel smallModel];
    } else {
        NSArray *tempArray = [self.arrayData filteredArrayUsingPredicate:predicate];
        
        [self.rightTableVc.smallArr removeAllObjects];
        [self.rightTableVc.smallArr addObjectsFromArray:tempArray];
        
    }
    
    [self.rightTableVc.tableView reloadData];
}

//导航栏左边返回按钮
-(void)backHomeVc{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


//跳转
-(void)profileAction{
    
    HospitalprofileViewController *profileVc = [[HospitalprofileViewController alloc]init];
    
    [self.navigationController pushViewController:profileVc animated:YES];
    
}

@end
