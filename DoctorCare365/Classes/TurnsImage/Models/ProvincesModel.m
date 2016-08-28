//
//  ProvincesModel.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ProvincesModel.h"

@implementation ProvincesModel
+ (instancetype) provinceWithDict:(NSDictionary *) dict;
{
    ProvincesModel * pro = [[self alloc] init];
    
    [pro setValuesForKeysWithDictionary:dict];
    
    return pro;
}
@end
