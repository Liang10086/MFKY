//
//  DCFindModel.h
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCFindModel : NSObject

//图片
@property (copy ,nonatomic)NSString *icon;

//医院名称
@property (copy , nonatomic)NSString *name;

//医院等级
@property (copy , nonatomic)NSString *rank;

//医院地址
@property (copy , nonatomic)NSString *address;

//地址图标
@property (copy , nonatomic)NSString *addressIcon;

//右箭头
@property (copy ,nonatomic)NSString *btnImage;


+(NSMutableArray *)findModel;

@end
