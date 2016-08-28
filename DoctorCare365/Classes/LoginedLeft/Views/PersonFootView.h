//
//  PersonFootView.h
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonFootView : UIView

//外部调用传递 年龄 身高 体重 家庭住址
- (void)PersonAge:(NSString *)age personHeight:(NSString *)height personWeight:(NSString *)weight personAddress:(NSString *)address;

@property (assign, nonatomic) NSInteger index;

@end
