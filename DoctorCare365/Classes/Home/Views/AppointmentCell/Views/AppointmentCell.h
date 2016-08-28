//
//  AppointmentCell.h
//  DoctorCare365
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentCell : UITableViewCell

@property(copy ,nonatomic) void(^successBlock)(NSInteger Number);

//-(void)successBlock:(void(^)(NSInteger Number))successBlock;

@end
