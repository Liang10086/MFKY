//
//  NetWorkTool.h
//  DoctorCare365
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTool : AFHTTPSessionManager
/**
 * 单例创建manager 并且指定baseURL
 */
+ (instancetype)sharedNetWorkToolWithBaseURL;

/**
 * 单例创建manager 不指定baseURL
 */
+ (instancetype)sharedNetWorkTool;

/**
 * get 请求
 */
- (void)GETWithURlString:(NSString *)url parameterDict:(NSDictionary *)parameterDict success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 * post 请求
 */
- (void)POSTWithURlString:(NSString *)url parameterDict:(NSDictionary *)parameterDict success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
