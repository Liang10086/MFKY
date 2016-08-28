//
//  RecordFootView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RecordFootView.h"
#import "AddRecordtableView.h"
@implementation RecordFootView

- (instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        
       CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        UIView *view = [[UIView alloc]init];
        
        view.backgroundColor = [UIColor blackColor];
        
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w, 1));
            make.top.equalTo(self).offset(1);
     
        }];
        
       
        
        
        
        
        UIButton *button = [[UIButton alloc]init];
        
        [button setTitle:@"添加病历" forState:UIControlStateNormal];
        [button setTitleColor:[HXColor hx_colorWithHexRGBAString:@"AAAAAA"] forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        [button.layer setCornerRadius:10];
        [button.layer setBorderWidth:1];
        [button addTarget:self action:@selector(clickButton) forControlEvents: UIControlEventTouchUpInside];
        
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w - 40, 30));
            make.top.equalTo(view.mas_bottom).offset(5);
            make.centerXWithinMargins.equalTo(self);
        }];
        
    }
    return self;
}

- (void)clickButton{

    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    vc.title = @"添加病历";
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
    id vc2 = vc1.centerViewController;
    
    AddRecordtableView *addRecord = [[AddRecordtableView alloc]init];
    
    [vc2 pushViewController:addRecord animated:YES];

    
}

@end
