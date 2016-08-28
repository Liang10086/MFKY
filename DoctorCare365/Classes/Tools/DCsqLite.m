//
//  DCsqLite.m
//  DoctorCare365
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCsqLite.h"
#import "FMDB.h"

@implementation DCsqLite
static FMDatabase *_db;

+(void)initialize
{
    //1.创建一个数据库的路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"person.db"];
    
    //2.创建我们的数据库对象,并且打开
    _db = [FMDatabase databaseWithPath:filePath];
    
    //打开
    BOOL result = [_db open];
    if (result) {//创建并且打开数据库成功
        //建表
        BOOL result2 = [_db executeUpdate:@"create table if not exists t_person(id integer primary key,name text not null,personNum text not null,phoneNum text not null)"];
        if (result2) {
            DCLog(@"建表成功!!!");
        }
        
    }
    
}
//新增数据
+(void)insertWithPerson:(DCPerson *)person
{
    [_db executeUpdateWithFormat:@"insert into t_person(name,personNum,phoneNum) values (%@,%@,%@)",person.name,person.personNum,person.phoneNum];
}
//更改数据
+(void)updateWithPerson:(DCPerson *)person
{
    [_db executeUpdateWithFormat:@"update t_person set name = %@,personNum = %@,phoneNum = %@ where id = 1",person.name,person.personNum,person.phoneNum];
}

//查询数据
+(NSArray *)queryAllPerson
{
    //可变数组
    NSMutableArray *arrM = [NSMutableArray array];
    FMResultSet *resultSet = [_db executeQuery:@"select name,personNum,phoneNum from t_person;"];
    
    while ([resultSet next]) {
        DCPerson *person = [[DCPerson alloc] init];
        person.name = [resultSet stringForColumn:@"name"];
        person.personNum = [resultSet stringForColumn:@"personNum"];
        person.phoneNum = [resultSet stringForColumn:@"phoneNum"];
        [arrM addObject:person];
    }
    
    
    return arrM.copy;
    
}
//通过关键字查询数据
+ (NSArray *)queryPersonWithKeyWord:(NSString *)keyword
{
    //可变数组
    NSMutableArray *arrM = [NSMutableArray array];
    
    
    //    FMResultSet *resultSet = [_db executeQuery:@"select name,age from t_student where name like '%%%@%%';",keyword];
    FMResultSet *resultSet = [_db executeQuery:[NSString stringWithFormat:@"select name,personNum,phoneNum from t_person where name like '%%%@%%'",keyword]];
    
    
    while ([resultSet next]) {
        DCPerson *person = [[DCPerson alloc] init];
        person.name = [resultSet stringForColumn:@"name"];
        person.personNum = [resultSet stringForColumn:@"personNum"];
        person.phoneNum = [resultSet stringForColumn:@"phoneNum"];
        [arrM addObject:person];
    }
    
    
    return arrM.copy;
    
}
@end
