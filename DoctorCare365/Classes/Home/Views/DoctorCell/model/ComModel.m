//
//  ComModel.m
//  DoctorCare365
//
//  Created by ss on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ComModel.h"
#import <AFNetworking.h>

@implementation ComModel

+ (instancetype) initWithDict:(NSDictionary *)dict{
    ComModel *model = [[ComModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}

+ (void) JSONModelwithUrlstr:(NSString *)urlstr withDict:(NSDictionary *)dict successBlock:(void (^)(NSArray *))successBlock errorBlock:(void (^)(NSError *))errorBlock
{
    
    [[NetWorkTool sharedNetWorkToolWithBaseURL] POSTWithURlString:urlstr parameterDict:dict success:^(id responseObject) {
        
        NSDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *JsonArray = [JSONDict objectForKey:@"data"];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        [JsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ComModel *model = [ComModel initWithDict:obj];
            
            [arrayM addObject:model];
            
        }];
        
        if (successBlock) {
            
            successBlock(arrayM.copy);
            
        }
        
    } failure:^(NSError *error) {
        if (errorBlock) {
            
            errorBlock(error);
            
        }
    }];
    
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
