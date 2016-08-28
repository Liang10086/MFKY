//
//  WeekButton.m
//  doctorList
//
//  Created by ios on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "WeekButton.h"

@implementation WeekButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGRect iconRect = [super imageRectForContentRect:contentRect];
    
//    iconRect.origin.y = 
    
    return iconRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect textRect = [super titleRectForContentRect:contentRect];
    
    textRect.origin.x -= 15;
    
    return textRect;
    
}

@end
