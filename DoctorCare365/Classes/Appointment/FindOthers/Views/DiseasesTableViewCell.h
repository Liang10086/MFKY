//
//  DiseasesTableViewCell.h
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiseasesModel.h"

@interface DiseasesTableViewCell : UITableViewCell

//接收DiseasesModel传递来的数据
@property (strong , nonatomic) DiseasesModel *model;

@end
