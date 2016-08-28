//
//  ProvincesModel.h
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvincesModel : NSObject

@property (nonatomic, strong) NSArray * cities;
@property (nonatomic, copy) NSString * name;

+ (instancetype)provinceWithDict:(NSDictionary *) dict;
@end
