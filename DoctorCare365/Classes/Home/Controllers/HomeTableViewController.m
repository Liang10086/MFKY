//
//  HomeTableViewController.m
//  DoctorCare365
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "HomeTableViewController.h"
#import "DoctorTableViewCell.h"
#import "AppointmentCell.h"
#import "TGCell.h"
#import "FindViewController.h"
#import "SettingController.h"
#import "OpinionViewController.h"
#import "DiseaseViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "DiseasesViewController.h"
#import "RightTableViewController.h"
#import "LoginedLeftTabController.h"

//调试
#import "FamousViewController.h"


#import "FindDoctorTableViewController.h"
#import "LeftTableViewController.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>



@interface HomeTableViewController ()

@property (strong , nonatomic)NSMutableArray *arrayM;

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerViewController  *playerView;

@end

@implementation HomeTableViewController

-(NSMutableArray *)arrayM{

    if (_arrayM == nil) {
        _arrayM = [NSMutableArray array];
    }
    return _arrayM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
    
    [self regestCell];
    
    [self setupHeaderView];
    
    
    [self.view endEditing:YES];
    
    
}


- (void)regestCell{
    
    //詹伟注册cell位置
    [self.tableView registerClass:[AppointmentCell class] forCellReuseIdentifier:@"appointmentCell"];
    
    //佘乾雷注册cell位置
    [self.tableView registerClass:[DoctorTableViewCell class] forCellReuseIdentifier:@"doctorCell"];
    
    
}


- (void)setupUI {
    
    self.navigationItem.title = @"医护365";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_line"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] initWithImage:[self redPointImage] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    
    //对系统通知是否已经读取进行判断
    BOOL isReaded = [[NSUserDefaults standardUserDefaults] boolForKey:@"isReaded"];
    if (isReaded == YES) {
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
        
    }else {
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
    }
    
    
}

//判断右上角按钮是否该有红点
- (UIImage *)redPointImage{
    //对系统通知是否已经读取进行判断
    BOOL isReaded = [[NSUserDefaults standardUserDefaults] boolForKey:@"isReaded"];
    
    //如果已经读了 返回白色正常的图片
    if (isReaded == YES) {
        UIImage *image = [UIImage imageNamed:@"私信"];
        return image;
        
    }else {
        //如果没读 返回红色的图片加红点
        UIImage *image = [UIImage imageNamed:@"私信"];
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width + 8, image.size.height + 8), NO, [UIScreen mainScreen].scale);
        
        [image drawAtPoint:CGPointMake(0, 4)];
        
        UIBezierPath *pathRed = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(image.size.width -4, 0 , 8, 8)];
        
        [[UIColor redColor] setFill];
        
        [pathRed fill];
        UIImage *redImage = UIGraphicsGetImageFromCurrentImageContext();
        // 6. 关闭bitmap 上下文
        UIGraphicsEndImageContext();
        return redImage;
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupUI];
}



#pragma mark --  HeaderView
- (void)setupHeaderView {
    
    
    TGCell *cell = [[TGCell alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 278)];
    
    self.tableView.tableHeaderView = cell;
    
}


//左边弹窗left测试接口
- (void)leftAction {
    
    //创建控制器
    MMDrawerController *rootVC = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    //判断是否登录
    BOOL isLogined = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogined"];
    
    if (isLogined == YES)
    {
        
        LoginedLeftTabController *loginedLeftVC = [[LoginedLeftTabController alloc] init];
        
        //如果已经登录了 更改左边视图的控制器为登录后的控制器
        rootVC.leftDrawerViewController = loginedLeftVC;
    }

    
    //跳转控制器
    [rootVC toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
        
  
}

- (void)setIndex:(NSInteger)index{
    _index = index;
    [self leftAction];
}

#pragma mark -- 系统通知接口
- (void)rightAction {

   
    RightTableViewController *ControllerVC = [[RightTableViewController alloc]init];
    
    ControllerVC.title = @"系统通知";
    
    [self.navigationController pushViewController:ControllerVC animated:YES];
    
}


#pragma mark - Table view data source

//两组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

//每组一行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

//设置cell 两个cell 两种类型
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.section == 0) {
        //詹伟在这个地方测试 identifer 规定appointmentCell
        AppointmentCell *appointmentCell = [tableView dequeueReusableCellWithIdentifier:@"appointmentCell" forIndexPath:indexPath];
        
        [appointmentCell setSuccessBlock:^(NSInteger Number) {
            if(Number == 3 || Number == 2){
                
                DiseasesViewController *findVc = [[DiseasesViewController alloc]init];
 
                    findVc.index = Number;
               
                
                //跳转到选择科室界面
                [self.navigationController pushViewController: findVc animated:YES];
                
            }else if (Number == 1){
                
                FindViewController *findVc = [[FindViewController alloc]init];
                
                //跳转到地图界面
                [self.navigationController pushViewController: findVc animated:YES];
                
            }
        }];
        appointmentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return appointmentCell;
        
    }
    else {
        //        佘乾雷在此处测试cell identifer 规定doctorCell
        DoctorTableViewCell *doctorCell = [tableView dequeueReusableCellWithIdentifier:@"doctorCell" forIndexPath:indexPath];
        
        //        创建要跳转的控制器对象
        
        //       block传多个变量
        [doctorCell setSuccessBlock:^(NSInteger intag, NSString *headName) {
            
            
            if (intag != 6) {
                DiseaseViewController *diseaseVC = [[DiseaseViewController alloc] init];
                //要传递的变量
                diseaseVC.tag = intag;
                diseaseVC.headName = headName;
                diseaseVC.title = @"疾病选择";
                //            跳转控制器
                [self.navigationController pushViewController:diseaseVC animated:YES];
            }else if (intag == 6) {
                
                
                NSString *path = [[NSBundle mainBundle] pathForResource:@"public.mp4" ofType:nil];
                NSURL *url = [NSURL fileURLWithPath:path];
                AVPlayerViewController * play = [[AVPlayerViewController alloc]init];
                play.player = [[AVPlayer alloc]initWithURL:url];
                [self presentViewController:play animated:YES completion:nil];

            }
            
            
        }];
        doctorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return doctorCell;
    }
    
}

//每个cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 105;
    }else {
        return 204;
    }
}

//组间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0;
}

@end
