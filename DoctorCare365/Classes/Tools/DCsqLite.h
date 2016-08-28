//
//  DCsqLite.h
//  DoctorCare365
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCPerson.h"
@interface DCsqLite : NSObject
//增加数据
+(void)insertWithPerson:(DCPerson *)person;
//更改数据
+(void)updateWithPerson:(DCPerson *)person;
//查询数据
+(NSArray *)queryAllPerson;
//通过关键字查询数据
+ (NSArray *)queryPersonWithKeyWord:(NSString *)keyword;

@end
