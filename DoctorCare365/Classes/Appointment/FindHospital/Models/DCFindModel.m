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


//懒加载
+(NSMutableArray *)findModel{
    //获取plist文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"hospitalIn.plist" ofType:nil];
    
    //获取数据
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //循环接收每个数据存入arrayM
    for (NSDictionary *dict in array) {
        
        DCFindModel *model = [self withDCFindModel:dict];
        
        [arrayM addObject:model];
    }

    return arrayM;
}

@end
