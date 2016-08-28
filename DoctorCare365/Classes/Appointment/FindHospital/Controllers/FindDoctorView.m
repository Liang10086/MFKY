//
//  FindDoctorView.m
//  DoctorCare365
//
//  Created by mac on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "FindDoctorView.h"
#import "RegisterInterfaceController.h"
#import "FindDoctorTableViewController.h"
#import "DCNavigationController.h"
#import "DiseaseViewController.h"

@implementation FindDoctorView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didload" object:nil];
    
}

//点击预约按钮
- (IBAction)findToDoctor:(id)sender {
    
    RegisterInterfaceController *registerIfVC = [[RegisterInterfaceController alloc] init];
 
    MMDrawerController *drawer = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    DCNavigationController *nav = (DCNavigationController *)(drawer.centerViewController);
    
    [nav pushViewController:registerIfVC animated:YES];
    
    
    
}

//疾病选择界面
- (IBAction)diseaseSelection:(id)sender {
    
    DiseaseViewController *diseaseVC = [[DiseaseViewController alloc] init];
    
    diseaseVC.tag = self.intag;

    diseaseVC.headName = self.cellStr;
    
    MMDrawerController *drawer = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    DCNavigationController *nav = (DCNavigationController *)(drawer.centerViewController);
    
    [nav pushViewController:diseaseVC animated:YES];
    
    
}


@end

