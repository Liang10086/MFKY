//
//  AddRecordFoot.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AddRecordFoot.h"

@implementation AddRecordFoot


- (instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
     
        UILabel *lab = [[UILabel alloc]init];
        
        lab.text = @"病历图片 :";
        
        [self addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
            
        }];
       
        
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        UIView *vc1 = [[UIView alloc]init];
        
        vc1.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc1];
        
        [vc1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(1, 40));
            make.left.equalTo(lab.mas_right).offset(5);
            make.centerYWithinMargins.equalTo(lab);
        }];
        
        UIView *vc2 = [[UIView alloc]init];
        
        vc2.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc2];
        
        [vc2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w*0.65, 1));
            make.topMargin.equalTo(vc1);
            make.leftMargin.equalTo(vc1);
            
        }];
        
        UIView *vc3 = [[UIView alloc]init];
        
        vc3.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc3];
        
        [vc3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w*0.65, 1));
            make.bottomMargin.equalTo(vc1);
            make.leftMargin.equalTo(vc1);
            
        }];
        
        UIView *vc4 = [[UIView alloc]init];
        
        vc4.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc4];
        
        [vc4 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(1, 40));
            make.centerYWithinMargins.equalTo(lab);
            make.left.equalTo(vc1).offset(w*0.65);
            
        }];

        UIImageView *img = [[UIImageView alloc]init];
        
        img.image = [UIImage imageNamed:@"ok"];
        
        [self addSubview:img];
        
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.equalTo(vc2.mas_bottom).offset(5);
            make.left.equalTo(vc1.mas_right).offset(20);
            
        }];
        
        
        
        UIButton *button = [[UIButton alloc]init];
        
        
        [button setTitle:@"上传照片" forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(100, 20));
          
            make.centerYWithinMargins.equalTo(img);
        
            make.centerXWithinMargins.equalTo(vc2);
       
        }];
        
        
        UIImageView *im = [[UIImageView alloc]init];
        
        im.image = [UIImage imageNamed:@"2233"];
        
        [self addSubview:im];
        
        [im mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w, 100));
            make.top.equalTo(img.mas_bottom).offset(20);
            make.left.equalTo(self).offset(0);
            
        }];
        
        
        
        UIButton *btn = [[UIButton alloc]init];
        btn.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        [btn.layer setCornerRadius:10];
        [btn.layer setBorderWidth:1];
        [btn addTarget:self action:@selector(clickBtn) forControlEvents: UIControlEventTouchUpInside];
        
        [btn.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w - 40, 30));
            make.centerXWithinMargins.equalTo(self);
            make.bottom.equalTo(self).offset(10);
        }];

        
        
        
    }
    return self;
}

- (void)clickButton{

    
    NSLog(@"上传照片");
    
}

- (void)clickBtn{

    NSLog(@"确定");
    
}
@end
