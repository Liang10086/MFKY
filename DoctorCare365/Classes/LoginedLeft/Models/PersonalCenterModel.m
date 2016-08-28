//
//  PersonalCenterModel.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PersonalCenterModel.h"

@implementation PersonalCenterModel

+ (instancetype)loginedLeftWithDict:(NSDictionary *)dict{

    PersonalCenterModel *model = [[self alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;

}
@end
