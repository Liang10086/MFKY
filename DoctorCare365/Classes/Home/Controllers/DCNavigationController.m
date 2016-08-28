//
//  DCNavigationController.m
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCNavigationController.h"

@interface DCNavigationController ()

@end

@implementation DCNavigationController

+ (void)initialize {
    // 系统初始化,当前类时调用!
    
    // 统一设置导航条外观
    // 直接决定了导航条的外观! -> 以后其他所有此类型的对象,显示效果都一样!
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // MARK: - 1设置背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    
    // MARK: - 2.设置标题颜色
    [navBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    
    // MARK: - 3.修改导航栏两侧按钮的颜色
    [navBar setTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
