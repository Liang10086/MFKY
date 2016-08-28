//
//  HospitalPriceButton.m
//  doctorList
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "HospitalPriceButton.h"

@implementation HospitalPriceButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
   
    CGRect iconRect = [super imageRectForContentRect:contentRect];
    
    iconRect.origin.x -= 10;// 右偏
    
    return iconRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect textRect = [super titleRectForContentRect:contentRect];
    
    textRect.origin.x -= 15;
    
    return textRect;
    
}


@end
