//
//  ClickButton.m
//  DoctorCare365
//
//  Created by ss on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ClickButton.h"

@implementation ClickButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGFloat width = self.bounds.size.width;
    
    return CGRectMake(contentRect.origin.x, contentRect.origin.y, width, contentRect.size.height);
    
}
-(void)setHighlighted:(BOOL)highlighted{
}


@end
