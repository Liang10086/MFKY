//
//  DoctorModel.h
//  doctorList
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorModel : NSObject

@property (strong,nonatomic) NSNumber *flower;

@property (strong,nonatomic) NSNumber *banner;

@property (strong,nonatomic) NSNumber *operation_count;

@property (copy,nonatomic) NSString *doctor_hospital_name;

@property (copy,nonatomic) NSString *doctor_name;

@property (copy,nonatomic) NSString *doctor_portrait;

@property (copy,nonatomic) NSString *accuracy;

@property (copy,nonatomic) NSString *doctor_title_name;

@property (copy,nonatomic) NSNumber *doctor_id;

+ (void)doctorModelsWithFinshedBlock:(void(^)(NSArray *dataArr))finshBlock;
@end
