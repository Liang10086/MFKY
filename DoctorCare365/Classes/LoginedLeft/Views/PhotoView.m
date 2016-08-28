//
//  PhotoView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PhotoView.h"

@implementation PhotoView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

//- (void)drawRect:(CGRect)rect {
////    [self retangle];
//}


- (instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
     
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        UIImageView *vc = [[UIImageView alloc]init];
        
        vc.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"C1C1C2"];
        
        vc.frame = CGRectMake(w*0.05, w*0.05,w*0.9, w*0.9);
        
        [self addSubview:vc];
        
        
        UIButton *testButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [testButton setTitle:@"拍照" forState: UIControlStateNormal];
        
        [testButton.layer setMasksToBounds:YES];
        [testButton.layer setCornerRadius:5];
        [testButton.layer setBorderWidth:1];
        
        [testButton addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:testButton];
        
        [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w*0.9 /2 - 5, 30));
            make.leftMargin.equalTo(vc);
            make.top.equalTo(vc.mas_bottom).offset(10);
        }];
        
        
        
        
        UIButton *icon = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [icon setTitle:@"本地图片" forState:UIControlStateNormal];
        
        [icon.layer setMasksToBounds:YES];
        [icon.layer setCornerRadius:5];
        [icon.layer setBorderWidth:1];
        
        [icon addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:icon];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w*0.9 /2 - 5, 30));
            make.rightMargin.equalTo(vc);
            make.top.equalTo(vc.mas_bottom).offset(10);
        }];

        
        
        
        
    }
    return self;
}

- (void)testClick{

    NSLog(@"点击了拍照");

}

- (void)iconClick{

    NSLog(@"点击了本地图片");

}

@end
