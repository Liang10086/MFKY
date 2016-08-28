//
//  RegisterInterfaceCell.m
//  DoctorCare365
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RegisterInterfaceCell.h"
#import "AppointmentsuccessController.h"
#import "DCNavigationController.h"
#import "AppointmentsuccessTableCell.h"

@interface RegisterInterfaceCell()

@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@end

@implementation RegisterInterfaceCell


- (void)awakeFromNib {
    //让button置顶
    [self bringSubviewToFront:self.doneBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"RegisterInterfaceCell" owner:nil options:0] lastObject];
    }
    return self;
}

//跳转界面
- (IBAction)appointmentBtn:(id)sender {
    
    AppointmentsuccessController *appointmentVc = [AppointmentsuccessController new];
    
    MMDrawerController *drawer = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;

    DCNavigationController *nav = (DCNavigationController *)(drawer.centerViewController);

    [nav pushViewController:appointmentVc animated:YES];
    
}


@end
