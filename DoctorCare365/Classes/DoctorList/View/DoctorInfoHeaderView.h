//
//  DoctorInfoHeaderView.h
//  doctorList
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorModel.h"

@interface DoctorInfoHeaderView : UIView

@property (strong,nonatomic) DoctorModel *model;

@property (assign,nonatomic)CGFloat rowH;


- (void)setupSubView;
@end
