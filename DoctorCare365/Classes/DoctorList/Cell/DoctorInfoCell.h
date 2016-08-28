//
//  DoctorInfoCell.h
//  doctorList
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorModel.h"

@interface DoctorInfoCell : UITableViewCell

@property (strong,nonatomic)DoctorModel *model;

- (void)showViewWith:(NSInteger)tag;

@end
