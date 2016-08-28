//
//  JSONModel.h
//  DoctorCare365
//
//  Created by ss on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONModel : NSObject
///病源名称
@property (nonatomic,copy) NSString *ci3_name;
/** */
@property (nonatomic,strong) NSNumber *ci2_id;

@property (nonatomic,strong) NSNumber *ci3_id;

+ (void)JSONModelwithUrlstr:(NSString *)urlstr withDict:(NSDictionary *)dict successBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

@end
