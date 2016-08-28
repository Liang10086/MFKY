//
//  DoctorTableViewCell.h
//  DoctorCare365
//
//  Created by ss on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorTableViewCell : UITableViewCell

//创建回传变量的属性successBlock
@property (copy,nonatomic) void(^successBlock)(NSInteger intag,NSString *headName);

@end
