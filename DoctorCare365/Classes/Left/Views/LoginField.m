//
//  LoginField.m
//  DoctorCare365
//
//  Created by fly on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "LoginField.h"

@implementation LoginField

//重写系统的 textField 里面的 leftView的的布局方法
-(CGRect) leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏
    return iconRect;
}


- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super textRectForBounds:bounds];
    
    textRect.origin.x += 5;
    
    return textRect;
    

}

@end
