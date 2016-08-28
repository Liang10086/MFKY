//
//  ComModel.h
//  DoctorCare365
//
//  Created by ss on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComModel : NSObject

@property (nonatomic,copy) NSString *complication_name;

@property (nonatomic,copy) NSString *complication_id;

@property (nonatomic,assign) BOOL bl;

+ (void)JSONModelwithUrlstr:(NSString *)urlstr withDict:(NSDictionary *)dict successBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock;

@end
