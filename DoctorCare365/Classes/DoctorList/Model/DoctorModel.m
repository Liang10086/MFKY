//
//  DoctorModel.m
//  doctorList
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorModel.h"
#import "AFNetworking.h"

@implementation DoctorModel

+ (instancetype)doctorModelWithDict:(NSDictionary *)dict {
    
    DoctorModel *model = [[DoctorModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;


}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {


}

+ (void)doctorModelsWithFinshedBlock:(void(^)(NSArray *dataArr))finshBlock {
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    NSDictionary *param = @{@"ci1_id":@(1),@"ci2_id":@(3),@"ci3_id":@(3),@"diagnosis_type":@(0),@"page_size":@(15),@"is_confirmed":@(1),@"user_id":@(1000089), @"page":@(1 ),@"has_diagnosis":@(2)};
    
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:@"http://iosapi.itcast.cn/doctor/matchDoctors.json.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *array = dict[@"data"];
        
            NSMutableArray *arrayM = [NSMutableArray array];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            DoctorModel *model = [DoctorModel doctorModelWithDict:obj];
            
            [arrayM addObject:model];
            
        }];
        
         finshBlock(arrayM.copy);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    

    
}

@end
