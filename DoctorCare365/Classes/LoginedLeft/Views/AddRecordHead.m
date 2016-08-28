//
//  AddRecordHead.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AddRecordHead.h"

@interface  AddRecordHead()<UITextViewDelegate>

@end

@implementation AddRecordHead

- (instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        
        nameLabel.font = [UIFont systemFontOfSize:w*0.048];
        
        nameLabel.text = @"用户姓名 :";
        
        nameLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:nameLabel];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(0);
        }];
        
        
        
        UILabel *typeLabel = [[UILabel alloc]init];
        
        typeLabel.text = @"疾病类型 :";
        
        typeLabel.textAlignment = NSTextAlignmentCenter;
        
         typeLabel.font = [UIFont systemFontOfSize:w*0.048];
        
        [self addSubview:typeLabel];
        
        [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(nameLabel).offset(30);
            make.left.equalTo(self).offset(0);
        }];
        
        
        UILabel *describeLabel = [[UILabel alloc]init];
        
        describeLabel.text = @"症状描述 :";
        
         describeLabel.font = [UIFont systemFontOfSize:w*0.048];
        
        describeLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:describeLabel];
        
        [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.top.equalTo(typeLabel).offset(50);
            make.left.equalTo(self).offset(0);
        }];
        
        
        
        UILabel *nameLabels = [[UILabel alloc]init];
        nameLabels.text = @"王先生";
        
         nameLabels.font = [UIFont systemFontOfSize:w*0.048];
        
        nameLabels.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:nameLabels];
        
        [nameLabels mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(100, 20));
            make.centerYWithinMargins.equalTo(nameLabel);
            make.left.equalTo(nameLabel.mas_right).offset(10);
        }];
        
        UIView *vc1 = [[UIView alloc]init];
        
        vc1.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc1];
        
        [vc1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(1, 30));
            make.left.equalTo(typeLabel.mas_right).offset(5);
            make.centerYWithinMargins.equalTo(typeLabel);
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
            
            make.size.mas_equalTo(CGSizeMake(1, 30));
            make.centerYWithinMargins.equalTo(typeLabel);
            make.left.equalTo(vc1).offset(w*0.65);
            
        }];

        
        
        UILabel *content = [[UILabel alloc]init];
        
        content.text = @"肿瘤 食管上三分之...";
        
        content.font = [UIFont systemFontOfSize:w*0.048];
        
        [self addSubview:content];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w*0.65*0.6, 20));
            make.centerYWithinMargins.equalTo(typeLabel);
            make.left.equalTo(vc1).offset(3);
            
        }];
        
        
        
        UIButton *button = [[UIButton alloc]init];
        
        [button setTitle:@"重新选择" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:w*0.048];
        
        [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
     
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w*0.65*0.3, 20));
            make.centerYWithinMargins.equalTo(content);
            make.left.equalTo(content.mas_right).offset(10);
            
        }];
        
        UIView *vc = [[UIView alloc]init];
        
        vc.frame = CGRectMake(0, 0, 0, 200);
        
        vc.backgroundColor = [UIColor redColor];
        
        [self addSubview:vc];
        
        
        
        //MARK: 定义了一些 症状描述
        UILabel *state1 = [[UILabel alloc]init];
        
        state1.text = @"脱水";
        
        state1.layer.borderWidth = 1;
        
        state1.textAlignment = NSTextAlignmentCenter;
        
        state1.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:state1];
        
        [state1 mas_makeConstraints:^(MASConstraintMaker *make) {

            make.centerYWithinMargins.equalTo(describeLabel);
            make.left.equalTo(describeLabel.mas_right).offset(10);

        }];
        
        
        UILabel *state2 = [[UILabel alloc]init];
        
        state2.text = @"营养不良";
        
        state2.layer.borderWidth = 1;
        
        state2.textAlignment = NSTextAlignmentCenter;
        
        state2.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:state2];
        
        [state2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerYWithinMargins.equalTo(state1);
            make.left.equalTo(state1.mas_right).offset(5);
            
        }];

        
        UILabel *state3 = [[UILabel alloc]init];
        
        state3.text = @"贫血";
        
        state3.layer.borderWidth = 1;
        
        state3.textAlignment = NSTextAlignmentCenter;
        
        state3.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:state3];
        
        [state3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerYWithinMargins.equalTo(state1);
            make.left.equalTo(state2.mas_right).offset(5);
            
        }];

        
//        UILabel *state4 = [[UILabel alloc]init];
//        
//        state4.text = @"咽小疼痛";
//        
//        state4.layer.borderWidth = 1;
//        
//        state4.textAlignment = NSTextAlignmentCenter;
//        
//        state4.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
//        
//        [self addSubview:state4];
//        
//       
//        [state4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.centerYWithinMargins.equalTo(state1);
//            make.left.equalTo(state3.mas_right).offset(5);
//            
//        }];

        UIView *vc01 = [[UIView alloc]init];
        
        vc01.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc01];
        
        [vc01 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(1, 200));
            make.left.equalTo(self).offset(w*0.1);
            make.top.equalTo(describeLabel.mas_bottom).offset(20);
        }];
        
        UIView *vc02 = [[UIView alloc]init];
        
        vc02.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc02];
        
        [vc02 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w*0.8, 1));
            make.topMargin.equalTo(vc01);
            make.leftMargin.equalTo(vc01);
            
        }];
        
        UIView *vc03 = [[UIView alloc]init];
        
        vc03.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc03];
        
        [vc03 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w*0.8, 1));
            make.bottomMargin.equalTo(vc01);
            make.leftMargin.equalTo(vc01);
            
        }];
        
        UIView *vc04 = [[UIView alloc]init];
        
        vc04.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:vc04];
        
        [vc04 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(1, 200));
            make.left.equalTo(vc01).offset(w*0.8);
            make.top.equalTo(vc02).offset(0);
        }];

        
        UITextView *text = [[UITextView alloc]init];

        text.text = @"请您选择合适的标签并简要描述症状";
        
        text.delegate = self;
        
        [self addSubview:text];
        
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w*0.79, 195));
            
            make.leftMargin.equalTo(vc01).offset(2);
            make.topMargin.equalTo(vc02).offset(2);
        }];       
        
    }
    return self;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if(textView.tag == 0) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        textView.tag = 0;
    }
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView
{
    if([textView.text length] == 0)
    {
        textView.text = @"";
        textView.textColor = [UIColor grayColor];
        textView.tag = 1;
    }
    else
    {
        textView.textColor = [UIColor blackColor];
        textView.tag = 1;
    }
}


- (void)clickButton{

    NSLog(@"病历类型-重新选择");
}
@end
