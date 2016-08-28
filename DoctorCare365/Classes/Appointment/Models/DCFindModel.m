//
//  DCFindModel.m
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCFindModel.h"

@implementation DCFindModel

//字典转模型
+(instancetype)withDCFindModel:(NSDictionary *)dict{

    DCFindModel *model = [[DCFindModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];

    return model;
}

+(NSArray *)findModel{

    NSString *path = [[NSBundle mainBundle]pathForResource:@"hospitalIn.plist" ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        DCFindModel *model = [self withDCFindModel:dict];
        
        [arrayM addObject:model];
    }

    return arrayM.copy;
}

@end
