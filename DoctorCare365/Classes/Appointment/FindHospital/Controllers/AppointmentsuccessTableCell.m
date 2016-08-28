//
//  AppointmentsuccessTableCell.m
//  DoctorCare365
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AppointmentsuccessTableCell.h"
#import "DCNavigationController.h"

@interface AppointmentsuccessTableCell ()
@property(nonatomic, weak) UIView *view;

@property (weak, nonatomic) IBOutlet UIButton *homeBtn;

@property (weak, nonatomic) IBOutlet UIButton *personBtn;

@end

@implementation AppointmentsuccessTableCell

- (void)awakeFromNib {
    //让button置顶
    [self bringSubviewToFront:self.homeBtn];
    [self bringSubviewToFront:self.personBtn];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"AppointmentsuccessCell" owner:self options:0]lastObject];
        self.view = view;
        [self.contentView addSubview:view];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.view.frame = self.bounds;
}

//点击返回主界面
- (IBAction)backToHome:(id)sender {
    
    MMDrawerController *drawer = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    DCNavigationController *nav = (DCNavigationController *)(drawer.centerViewController);
    
    [nav popToRootViewControllerAnimated:YES];
 
}

////点击返回到首页,显示效果首页和主界面都显示（一半一半）
- (IBAction)personCenter:(id)sender {
    
    MMDrawerController *drawer = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    DCNavigationController *nav = (DCNavigationController *)(drawer.centerViewController);
    
    [nav popToRootViewControllerAnimated:YES];
    
    [drawer toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}

@end
