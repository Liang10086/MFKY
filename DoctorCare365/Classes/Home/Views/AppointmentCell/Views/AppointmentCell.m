//
//  AppointmentCell.m
//  DoctorCare365
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AppointmentCell.h"
#import "FindViewController.h"
#import "DCNavigationController.h"

@interface AppointmentCell()

@property (assign , nonatomic)NSInteger integer;


@end


@implementation AppointmentCell


- (IBAction)findDisease:(UIButton *)sender {
    if (self.successBlock) {
        self.successBlock(sender.tag);
    }
}

//加载
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"AppointmentCell" owner:nil options:nil]lastObject];
    }
    return self;
}

@end
