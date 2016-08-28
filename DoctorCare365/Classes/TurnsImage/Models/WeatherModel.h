//
//  WeatherModel.h
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject
//时间
@property (copy ,nonatomic)NSString *date;
//地点
@property (copy ,nonatomic)NSString *currentCity;
//温度
@property (copy ,nonatomic)NSString *temperature;
//天气
@property (copy ,nonatomic)NSString *weather;


+(instancetype)WeatherModelWithdict:(NSDictionary *)dict;


@end
