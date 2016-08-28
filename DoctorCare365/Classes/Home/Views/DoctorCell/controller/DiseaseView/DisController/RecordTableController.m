//
//  RecordTableController.m
//  DoctorCare365
//
//  Created by ss on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RecordTableController.h"
#import "JSONModel.h"
#import "ComModel.h"
#import "RecordTableCell.h"

@interface RecordTableController ()

@property (nonatomic,strong) NSArray *array;

@property (nonatomic,copy) void(^successBlock)(NSString *buttonName,NSInteger tag);

@property (nonatomic,strong) JSONModel *JsonModel;

@property (nonatomic,strong) ComModel *ComModel;

@property (nonatomic,strong) NSMutableArray *arrayM;

@property (nonatomic,strong) NSMutableArray *cellArrayM;

@property (nonatomic,copy) void(^cellBlock)(NSArray *cellArray);
//创建一个存储没有重复点的cell
@property (nonatomic,strong) NSMutableArray *didCell;

@end

@implementation RecordTableController

-(NSMutableArray *)didCell{
    if (_didCell == nil) {
        _didCell = [NSMutableArray array];
    }
    return _didCell;
}

- (NSMutableArray *)arrayM{
    
    if (_arrayM == nil) {
 
        _arrayM = [NSMutableArray array];
    }
    return _arrayM;
}

-(NSMutableArray *)cellArrayM{
    if (_cellArrayM == nil) {
        
        _cellArrayM = [NSMutableArray array];
    }
    return _cellArrayM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    创建导航控制器左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickResule)];
    
    [self.tableView registerClass:[RecordTableCell class] forCellReuseIdentifier:@"decordCell"];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (void)dataArray:(NSArray *)dataArray cellBlock:(void (^)(NSArray *arrayCell))cellBlock{
    
    self.array = dataArray;
    
    self.cellBlock = cellBlock;
    
    [self.tableView reloadData];
}

-(void)dataArray:(NSArray *)dataArray successBlock:(void (^)(NSString *headName, NSInteger tag))successBlock
{
    
    self.array = dataArray;
    
    self.successBlock = successBlock;
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source
/**数据源方法*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RecordTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"decordCell" forIndexPath:indexPath];
    
    if (self.array.count < 10) {
        
        self.ComModel = self.array[indexPath.row];
        
        cell.model = self.ComModel;
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(clickResule)];
        [self.arrayM addObject:cell];
        
        return cell;
        
    }else{
        
        self.JsonModel = self.array[indexPath.row];
        
        cell.textLabel.text = self.JsonModel.ci3_name;
        
        cell.imageView.image = [UIImage imageNamed:@"ok"];
        
        cell.imageView.hidden = YES;
        
        return cell;
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger tag= indexPath.row;
    
    if (self.array.count < 10) {
        
    }else{
        self.JsonModel = self.array[indexPath.row];
        
        //            将所点击的cell上的文字回传到按钮上
        self.successBlock(self.JsonModel.ci3_name,tag);
        
        //            返回到上一个控制器
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

//点击确定按钮所对应的事件
- (void) clickResule{
    
    NSMutableArray *didArrayM = [NSMutableArray array];
    
    if (self.array.count < 10) {
        
        for (ComModel *model in self.array) {
            //      如果点击了图片，将图片的model存储到didArrayM中
            if (model.bl == YES) {
                
                [didArrayM addObject:model];
            }
        }
        if (didArrayM.count > 0) {
            
            if (self.cellBlock) {
                
                self.cellBlock(didArrayM);
            }
        }
    }
    //    跳转控制器
    [self.navigationController popViewControllerAnimated:YES];
}

@end
