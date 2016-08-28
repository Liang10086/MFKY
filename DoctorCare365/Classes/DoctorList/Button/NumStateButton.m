//
//  NumStateButton.m
//  doctorList
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "NumStateButton.h"

@implementation NumStateButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGRect iconRect = CGRectMake(0, 0, contentRect.size.width, contentRect.size.height / 2);
    
    return iconRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect textRect = CGRectMake(0, contentRect.size.height / 2, contentRect.size.width, contentRect.size.height / 2);

    return textRect;
    
}

@end
