//
//  DCHeadCellTwo.m
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCHeadCellTwo.h"
#import "DCHeadButton.h"
#import "UIView+MDRExtension.h"

@interface DCHeadCellTwo()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (assign , nonatomic)NSInteger index;

//创建点击按钮出现tableview
@property (nonatomic, weak) UITableView *tableV;

@end

@implementation DCHeadCellTwo


-(void)awakeFromNib{
    //创建通知中心
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(demo:) name:@"Department" object:nil];
    
    self.index = 1;
    
}

//响应通知
-(void)demo:(NSNotification*)notification{
    self.nameLabel.text = notification.userInfo[@"title"];
}



//删除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (IBAction)buttonClick:(UIButton *)sender {
    
    // 记录图片框transform的变量
    CGAffineTransform transform;
 
    if (self.index) {
        self.index = 0;
        transform = CGAffineTransformMakeRotation(M_PI_2 * 0.999);
        [self demo];
    } else {
        self.index = 1;
        // 没有任何的形变
        transform = CGAffineTransformIdentity;
        
    }
    
    // 赋值
    // 通过动画进行改变!
    [UIView animateWithDuration:0.5 animations:^{
        sender.imageView.transform = transform;
    }];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"bba" object:nil];
    
    
}


-(void)demo{
    UITableView *tableV = [[UITableView alloc]init];
    tableV.x = 0;
    tableV.y = 64;
    tableV.width = [UIScreen mainScreen].bounds.size.width;
    tableV.height = 0;
    
    tableV.backgroundColor = [UIColor redColor];
    //赋值
    self.tableV = tableV;
    [self addSubview:tableV];
    
    
    if (self.index == 1) {
        self.index = 0;
        tableV.height = 0;
    }else{
        
        self.index = 0;
        tableV.height = 0;
    }
    
    
}




@end
