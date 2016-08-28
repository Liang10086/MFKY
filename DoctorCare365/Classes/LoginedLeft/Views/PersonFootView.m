//
//  PersonFootView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PersonFootView.h"

@interface PersonFootView ()

@property (strong, nonatomic)UITextField *age;
@property (strong, nonatomic)UITextField *height;
@property (strong, nonatomic)UITextField *weight;
@property (strong, nonatomic)UITextField *address;

@end

@implementation PersonFootView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code 70
}

- (instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *DCAge = [userDefaults objectForKey:@"DCAge"];
        NSString *DCHeight = [userDefaults objectForKey:@"DCHeight"];
        NSString *DCWeight = [userDefaults objectForKey:@"DCWeight"];
        NSString *DCAddress = [userDefaults objectForKey:@"DCAddress"];
        

        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        UILabel *age = [[UILabel alloc]init];
        
        age.text = @"年      龄:";
        age.font =[UIFont systemFontOfSize:w *0.04];
        [self addSubview:age];
        
        [age mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 20));
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
        }];
       
        
        
        UILabel *height = [[UILabel alloc]init];
        
        height.text = @"身      高:";
        height.font =[UIFont systemFontOfSize:w *0.04];
        [self addSubview:height];
        
        [height mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 20));
            make.top.equalTo(age.mas_bottom).offset(20);
            make.left.equalTo(self).offset(10);
        }];
       
        
        
        UILabel *weight = [[UILabel alloc]init];
        
        weight.text = @"体      重:";
        
        weight.font =[UIFont systemFontOfSize:w *0.04];
        
        [self addSubview:weight];
        
        [weight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 20));
            make.top.equalTo(height.mas_bottom).offset(20);
            make.left.equalTo(self).offset(10);
        }];
        
        
        
        UILabel *address = [[UILabel alloc]init];
        
        address.font = [UIFont systemFontOfSize:w *0.038];
        
        address.text = @"居住地址:";
        
        [self addSubview:address];
        
        [address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 20));
            make.top.equalTo(weight.mas_bottom).offset(20);
            make.left.equalTo(self).offset(10);
        }];
        
       
        
        UITextField *fieldAge = [[UITextField alloc]init];
        
        self.age = fieldAge;
        if (DCAge) {
            fieldAge.text = DCAge;
        }
        
        fieldAge.borderStyle = UITextBorderStyleLine;
        
        [self addSubview:fieldAge];
        [fieldAge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(w*0.7, 30));
            make.centerYWithinMargins.equalTo(age);
            make.left.equalTo(age.mas_right).offset(10);
        }];
        
        
        
        UITextField *fieldHeight = [[UITextField alloc]init];
        
        self.height = fieldHeight;
        
        if (DCHeight) {
            fieldHeight.text = DCHeight;
        }
        
        fieldHeight.borderStyle = UITextBorderStyleLine;
        
        [self addSubview:fieldHeight];
        
        [fieldHeight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(w*0.7, 30));
            make.centerYWithinMargins.equalTo(height);
            make.left.equalTo(height.mas_right).offset(10);
        }];

        
        
        
        UITextField *fieldWeight = [[UITextField alloc]init];

        self.weight = fieldWeight;
        
        if (DCWeight) {
            fieldWeight.text = DCWeight;
        }
        
        fieldWeight.borderStyle = UITextBorderStyleLine;
        
        [self addSubview:fieldWeight];
        
        [fieldWeight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(w*0.7, 30));
            make.centerYWithinMargins.equalTo(weight);
            make.left.equalTo(weight.mas_right).offset(10);
        }];
        
        
        UITextField *fieldAddress = [[UITextField alloc]init];
        
        self.address = fieldAddress;
        
        if (DCAddress) {
            fieldAddress.text = DCAddress;
        }
        
        fieldAddress.borderStyle = UITextBorderStyleLine;
        
        [self addSubview:fieldAddress];
        
        
        [fieldAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(w*0.7, 30));
            make.centerYWithinMargins.equalTo(address);
            make.left.equalTo(address.mas_right).offset(10);
        }];


    }
    
    return self;
}
- (void)PersonAge:(NSString *)age personHeight:(NSString *)height personWeight:(NSString *)weight personAddress:(NSString *)address{

    self.age.text = age;
    self.height.text = height;
    self.weight.text = weight;
    self.address.text = address;

}



- (void)setIndex:(NSInteger)index{

    if (index == 123) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.age.text forKey:@"DCAge"];
        [userDefaults setObject:self.height.text forKey:@"DCHeight"];
        [userDefaults setObject:self.weight.text forKey:@"DCWeight"];
        [userDefaults setObject:self.address.text forKey:@"DCAddress"];
        
        [userDefaults synchronize];
    }
   
}

@end
