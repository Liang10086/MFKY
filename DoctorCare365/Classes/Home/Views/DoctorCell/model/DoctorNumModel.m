//
//  DoctorModel.m
//  DoctorCare365
//
//  Created by ss on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorNumModel.h"
#import <AFNetworking.h>

@implementation DoctorNumModel

+ (instancetype) initWithDict:(NSDictionary *)dict{
    DoctorNumModel *model = [[DoctorNumModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}

+ (void) JSONModelwithUrlstr:(NSString *)urlstr withDict:(NSDictionary *)dict successBlock:(void (^)(DoctorNumModel *))successBlock errorBlock:(void (^)(NSError *))errorBlock
{

    [[NetWorkTool sharedNetWorkToolWithBaseURL] POSTWithURlString:urlstr parameterDict:dict success:^(id responseObject) {
        
        NSDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSDictionary *JsonArray = [JSONDict objectForKey:@"data"];
        
        
        DoctorNumModel *model = [DoctorNumModel initWithDict:JsonArray];
        
        if (successBlock) {
            
            successBlock(model);
            
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
