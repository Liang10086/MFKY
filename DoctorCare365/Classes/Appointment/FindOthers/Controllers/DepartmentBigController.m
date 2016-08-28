//
//  DepartmentBigController.m
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DepartmentBigController.h"

@interface DepartmentBigController ()

//接收数据
@property (strong , nonatomic) NSArray *arr;

@end

@implementation DepartmentBigController

- (void)viewDidLoad {
    [super viewDidLoad];

    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ident"];
  
    //设置行高
    self.tableView.rowHeight = 100;
    
}

//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arr.count;
    
}

//注册cell
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ident" forIndexPath:indexPath];
    
    cell.textLabel.text = self.arr[indexPath.row];
    
    return cell;
}

//懒加载
-(NSArray *)arr{
    if (_arr == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"disease.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        _arr = array;
    }
       return _arr;
}



@end
