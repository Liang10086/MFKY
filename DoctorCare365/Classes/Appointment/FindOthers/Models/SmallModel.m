//
//  SmallModel.m
//  DoctorCare365
//
//  Created by mac on 16/8/2.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "SmallModel.h"

@implementation SmallModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    SmallModel *model = [[SmallModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

+ (NSMutableArray *)smallModel{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"department.plist" ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         SmallModel *model = [self modelWithDict:obj];
        [arrM addObject:model];
    }];
    return arrM;
}
@end
