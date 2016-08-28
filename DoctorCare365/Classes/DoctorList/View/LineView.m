//
//  LineView.m
//  doctorList
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "LineView.h"
#import "HexColors.h"

@implementation LineView {
    
    CGFloat _screenWidth;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        for (NSInteger i = 0; i < 3; i ++) {
            
            UILabel *label = [[UILabel alloc]init];
            
            label.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"999999" alpha:0.2];
            
            label.frame = CGRectMake(_screenWidth / 3 * i,0,_screenWidth / 3, 1);
            
            [self addSubview:label];
        }
    }
    
    return self;
}

@end
