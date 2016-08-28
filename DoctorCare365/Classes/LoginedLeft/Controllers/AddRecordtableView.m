//
//  AddRecordtableView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AddRecordtableView.h"
#import "AddRecordHead.h"
#import "AddRecordFoot.h"
@interface AddRecordtableView ()

@end

@implementation AddRecordtableView

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self upHead];
    
    [self upFoot];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickButton)];
}

- (void)clickButton{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)upHead{
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    
    AddRecordHead *head = [[AddRecordHead alloc]init];
    
//    head.backgroundColor = [UIColor blueColor];
    
    head.frame = CGRectMake(0, 0, 0, 350);
    
    self.tableView.tableHeaderView = head;

}

- (void)upFoot{

    CGFloat h = [UIScreen mainScreen].bounds.size.height;
   
    AddRecordFoot *Foot = [[AddRecordFoot alloc]init];
    
//    Foot.backgroundColor = [UIColor redColor];
    
    Foot.frame = CGRectMake(0, 0, 0, 200);
    
    self.tableView.tableFooterView = Foot;


}
@end
