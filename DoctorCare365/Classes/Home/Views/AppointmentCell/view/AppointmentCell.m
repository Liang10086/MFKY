//
//  AppointmentCell.m
//  DoctorCare365
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AppointmentCell.h"

@implementation AppointmentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"AppointmentCell" owner:nil options:nil]lastObject];
    }
    
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
