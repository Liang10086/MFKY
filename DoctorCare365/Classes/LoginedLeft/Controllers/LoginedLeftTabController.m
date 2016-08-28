//
//  LoginedLeftTabController.m
//  DoctorCare365
//
//  Created by fly on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "LoginedLeftTabController.h"
#import "PersonalCenterModel.h"
#import "LoginedHeaderCell.h"
#import "PayTableViewController.h"
#import "RegisterController.h"
#import "RecordTableViewController.h"

#import "FamousViewController.h"

#import "SettingController.h"
#import "OpinionViewController.h"

#import "CollectViewController.h"
#import "FindViewController.h"
@interface LoginedLeftTabController ()

@property (strong, nonatomic)NSArray *arr;
@end

@implementation LoginedLeftTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self upHeader];

    self.tableView.tableFooterView = [[UIView alloc]init];
    
//    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    
   
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}


- (void)upHeader{

    LoginedHeaderCell *VC = [[LoginedHeaderCell alloc]init];
    
    VC.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav"]];
    
    VC.frame = CGRectMake(0, 0, 0, 110);
    
//    VC.backgroundColor = [UIColor redColor];

    self.tableView.tableHeaderView = VC;
    
}

- (void)upFoot{

    UIView *vc = [UIView new];
    
    vc.backgroundColor = [UIColor redColor];
    
    vc.frame = CGRectMake(0, 0, 0, 20);
    
  
    
}

#pragma
#pragma mark -- 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (!indexPath.section) {
        
        if (indexPath.row == 0) {
            
            [self appointment];
        
        }else if(indexPath.row == 1){
        
            [self famous];
            
        }else if(indexPath.row == 2){
        
            [self record];
        
        }else if(indexPath.row == 3){

            [self myCollect];
        }else if(indexPath.row == 4){
        
            [self pay];
       
        }
    }else{
        
        if (indexPath.row == 0) {
            
            [self setAndHelp];
        
        }else if(indexPath.row == 1){
        
            [self opinion];
        }
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    PersonalCenterModel *model = self.arr[section];
    
    NSArray *arr = model.title;
    
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    
    PersonalCenterModel *model = self.arr[indexPath.section];
    
    NSArray *title = model.title;
    
    cell.textLabel.text = title[indexPath.row][@"name"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }else {
        return 0;
    }
   
}



#pragma
#pragma mark -- 懒加载
- (NSArray *)arr{

    if (_arr == nil) {
      
        NSString *path = [[NSBundle mainBundle]pathForResource:@"LoginedLeft.plist" ofType:nil];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
        
            PersonalCenterModel *model = [PersonalCenterModel loginedLeftWithDict:dic];
            
            [arrM addObject:model];
            
        }
        _arr = arrM.copy;
    }
    return _arr;
}

#pragma mark -我的收藏
- (void)myCollect {
    CollectViewController *collectVC = [[CollectViewController alloc] init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    
    
    [vc2 pushViewController:collectVC animated:YES];
    

}


#pragma mark -设置与帮助
- (void)setAndHelp{
    SettingController *setVC = [[SettingController alloc] init];
    setVC.index = 111;
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    [vc2 pushViewController:setVC animated:YES];
}

- (void)opinion {
    
    OpinionViewController *opinionVC = [[OpinionViewController alloc] init];
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    [vc2 pushViewController:opinionVC animated:YES];
}

#pragma
#pragma mark -- 预约挂号
- (void)appointment{
  
    RegisterController *appoint = [[RegisterController alloc]init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    [vc2 pushViewController:appoint animated:YES];

}
#pragma
#pragma mark -- 支付
- (void)pay{

    PayTableViewController *pay = [[PayTableViewController alloc]init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;

    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    pay.title = @"支付明细";
    
    [vc2 pushViewController:pay animated:YES];
}

#pragma
#pragma mark -- 病历管理
- (void)record{

    RecordTableViewController *record = [[RecordTableViewController alloc]init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    record.title = @"病历管理";
    
    [vc2 pushViewController:record animated:YES];

}

#pragma
#pragma mark -- 名医通申请
- (void)famous{
    FamousViewController *famous = [[FamousViewController alloc]init];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    [vc1 closeDrawerAnimated:YES completion:nil];
    
    id vc2 = vc1.centerViewController;
    
    famous.title = @"名医管理";
    
    [vc2 pushViewController:famous animated:YES];


}



@end
