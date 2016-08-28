//
//  DCPerson.h
//  DoctorCare365
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCPerson : NSObject

//名字
@property (copy, nonatomic) NSString *name;

//身份证号
@property (copy, nonatomic) NSString *personNum;

//电话号码
@property (copy, nonatomic) NSString *phoneNum;

@end
