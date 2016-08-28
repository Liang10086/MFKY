//
//  DiseasesModel.m
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DiseasesModel.h"

@implementation DiseasesModel

//字典转模型
+(instancetype)withDiseasesModel:(NSDictionary *)dict{
    
    DiseasesModel *model = [[DiseasesModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}


//懒加载
+(NSArray *)diseases{

    //获取plist文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"disease.plist" ofType:nil];
    
    //获取数据
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //循环接收每个数据存入arrayM
    for (NSDictionary *dict in array) {
        
        DiseasesModel *model = [self withDiseasesModel:dict];
        
        [arrayM addObject:model];
    }
    
    return arrayM.copy;

}

@end
