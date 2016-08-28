//
//  DCHeadButton.m
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCHeadButton.h"
#import "UIView+MDRExtension.h"

@implementation DCHeadButton

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 互换位置
    self.titleLabel.x = 45;
    self.imageView.x = self.titleLabel.width + 45; // 间距为45
    
}

@end
