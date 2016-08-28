//
//  NetWorkTool.m
//  DoctorCare365
//
//  Created by mac on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//
#define BASEURL @"http://iosapi.itcast.cn/"
#import "NetWorkTool.h"


@implementation NetWorkTool
static NetWorkTool *_instancetype;

//单例创建manager 并且指定baseURL
+ (instancetype)sharedNetWorkToolWithBaseURL{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instancetype = [[self alloc]initWithBaseURL:[NSURL URLWithString:BASEURL]];
        
        _instancetype.requestSerializer = [AFJSONRequestSerializer serializer];
        
         _instancetype.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _instancetype.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
    });
    return _instancetype;
}

//单例创建manager 不指定baseURL
+ (instancetype)sharedNetWorkTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instancetype = [self manager];
        
        _instancetype.requestSerializer = [AFJSONRequestSerializer serializer];
        
        _instancetype.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _instancetype.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
 
    });
    return _instancetype;
}

//post请求
- (void)POSTWithURlString:(NSString *)url parameterDict:(NSDictionary *)parameterDict success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    [self POST:url parameters:parameterDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

//get请求
- (void)GETWithURlString:(NSString *)url parameterDict:(NSDictionary *)parameterDict success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    [self GET:url parameters:parameterDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}


@end
