//
//  PersonalCenterModel.h
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalCenterModel : NSObject

@property (strong, nonatomic)NSArray *title;

@property (copy, nonatomic)NSString *name;

+ (instancetype)loginedLeftWithDict:(NSDictionary *) dict;

@end
