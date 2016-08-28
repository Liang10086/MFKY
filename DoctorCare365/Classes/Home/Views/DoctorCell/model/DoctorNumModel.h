//
//  DoctorModel.h
//  DoctorCare365
//
//  Created by ss on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorNumModel : NSObject
//医生个数属性
@property (nonatomic,strong) NSNumber *doctor_count;

+ (void)JSONModelwithUrlstr:(NSString *)urlstr withDict:(NSDictionary *)dict successBlock:(void(^)(DoctorNumModel *model))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

@end
