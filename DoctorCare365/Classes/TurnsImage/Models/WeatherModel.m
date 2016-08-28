//
//  WeatherModel.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel
//字典转模型
+(instancetype)WeatherModelWithdict:(NSDictionary *)dict{


    WeatherModel *model = [[WeatherModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];

    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


@end
