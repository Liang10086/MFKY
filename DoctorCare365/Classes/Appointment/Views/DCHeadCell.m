//
//  DCHeadCell.m
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCHeadCell.h"
#import "DCHeadButton.h"

@interface DCHeadCell()

@property (assign ,nonatomic)NSInteger index;

@end

@implementation DCHeadCell

-(void)awakeFromNib{

    self.index = 1;

}


- (IBAction)ButtonClick:(UIButton *)sender {

    // 记录图片框transform的变量
    CGAffineTransform transform;
    
    if (self.index) {
        self.index = 0;
        transform = CGAffineTransformMakeRotation(M_PI * 0.999);
        
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

    
    
    
    
    
}



@end
