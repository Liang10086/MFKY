//
//  DepartmentSmallController.m
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DepartmentSmallController.h"
#import "FindViewController.h"
#import "FindDoctorTableViewController.h"
#import "SmallModel.h"

//科室
@interface DepartmentSmallController ()


@property (strong , nonatomic) NSMutableArray *arrayM;

//发送通知到预约医生界面里的内容
@property (copy, nonatomic) NSString *notificationText;
@property (assign, nonatomic) NSInteger notificationIndex;
@end

@implementation DepartmentSmallController
-(NSMutableArray *)arrayM{

    if (_arrayM == nil) {
        _arrayM = [SmallModel smallModel];
    }
    return _arrayM;
}

- (NSMutableArray *)smallArr {
    return self.arrayM;
}

- (void)setSmallArr:(NSMutableArray *)smallArr{
    self.arrayM = smallArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"indnti"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification) name:@"didload" object:nil];
}
- (void)didReceiveNotification{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"smallToAppointment" object:nil userInfo:@{@"title":[NSString stringWithFormat:@"%@",self.notificationText],@"index":@(self.notificationIndex)}];
}

//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayM.count;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"indnti" forIndexPath:indexPath];
    SmallModel *model = self.arrayM[indexPath.row];
    
    cell.textLabel.text = model.name;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
    
}

//点击小科室，跳转到地图界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取点击cell的文字
    SmallModel *model = self.arrayM[indexPath.row];
    
    self.notificationText = model.name;
    self.notificationIndex = indexPath.row;
    
    //跳转
    if (self.index == DepartmentToHospital) {
        
        FindDoctorTableViewController *findDoctorVc = [[FindDoctorTableViewController alloc]init];
        
        findDoctorVc.cellStr = model.name;
        findDoctorVc.intag = (indexPath.row % 5) + 1;
 
        
        
        [self.navigationController pushViewController:findDoctorVc animated:YES];
        
    }else{
    
        FindViewController *findVc = [[FindViewController alloc]init];
        findVc.idx = DepartmentToHospital;
        findVc.nameStr = model.name;
 
        
        [self.navigationController pushViewController:findVc animated:YES];
    
    }
}



@end
