//
//  TableView.h
//  doctorList
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorModel.h"

@interface TableView : UIView

@property (strong,nonatomic) DoctorModel *model;


- (void) layoutWithViews:(NSArray <UIView *>*)views;

- (void)addContent;



@end
