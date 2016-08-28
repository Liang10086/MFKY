//
//  RightTableViewCell.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (void)drawRect:(CGRect)rect{
    // 字符串
    NSString *str;
    //判断是否登录
    BOOL isLogined = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogined"];
    
    if (isLogined == YES){
        str = @"欢迎使用医护365,愿您安康";
        
    }else{
        str = @"请登录,方便我们为您提供更好的服务";
    }
    
    
    // 属性字典
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:20],
                           };
    
    
    // 从rect开始绘制,自动换行
    [str drawInRect:CGRectMake(20, 20, rect.size.width - 20, rect.size.height) withAttributes:dict];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, rect.size.width - 20, rect.size.height - 20) cornerRadius:10];
    [path stroke];
    
    //对系统通知是否已经读取进行判断
    BOOL isReaded = [[NSUserDefaults standardUserDefaults] boolForKey:@"isReaded"];
    if (isReaded != YES) {
        //画右上角小红点代码
        UIBezierPath *pathRed = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.size.width - 20, 5 , 15, 15)];
        [[UIColor redColor] set];
        [pathRed fill];
    }
}


@end
