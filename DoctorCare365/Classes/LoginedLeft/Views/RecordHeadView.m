//
//  RecordHeadView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RecordHeadView.h"
#import "PersonTableViewController.h"

@interface RecordHeadView ()

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *personNum;

@property (copy, nonatomic) NSString *phoneNum;


@end

@implementation RecordHeadView



- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        NSArray *personArr = [DCsqLite queryAllPerson];
        
        [personArr enumerateObjectsUsingBlock:^(DCPerson *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            self.name = obj.name;
            self.personNum = obj.personNum;
            self.phoneNum = obj.phoneNum;
        }];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *DCAge = [userDefaults objectForKey:@"DCAge"];
        NSString *DCAddress = [userDefaults objectForKey:@"DCAddress"];
        
        
        UIImageView *img = [[UIImageView alloc]init];
        
        img.layer.cornerRadius = 30;
        
        img.layer.masksToBounds = YES;
        
        img.image = [UIImage imageNamed:@"123"];
        
        [self addSubview:img];
        
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(10);
        }];
        
    
        
        UIImageView *icon = [[UIImageView alloc]init];
        
        icon.image = [UIImage imageNamed:@"人物"];
        
        [self addSubview:icon];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.left.equalTo(img.mas_right).offset(10);
            make.topMargin.equalTo(img);
        }];
        

        
        UILabel *sexLabel = [[UILabel alloc]init];
        
        sexLabel.text = @"男";
        
        [self addSubview:sexLabel];
        
        [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.left.equalTo(icon.mas_right).offset(10);
            make.topMargin.equalTo(img);
        }];
        
        
        
        
        UILabel *ageLabel = [[UILabel alloc]init];
        
        ageLabel.text = DCAge;
        
        [self addSubview:ageLabel];
        
        [ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(50, 20));
            make.left.equalTo(sexLabel.mas_right).offset(10);
            make.topMargin.equalTo(img);
            
        }];
        
        
        
        
        UIImageView *placeImg = [[UIImageView alloc]init];
        
        placeImg.image = [UIImage imageNamed:@"定位"];
        
        [self addSubview:placeImg];
        
        [placeImg mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.left.equalTo(img.mas_right).offset(10);
            make.top.equalTo(icon.mas_bottom).offset(10);
            
        }];
        
        
        
        
        UILabel *placeLabel = [[UILabel alloc]init];
        
        placeLabel.text = DCAddress;
        
        [self addSubview:placeLabel];
        
        [placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(200, 20));
            make.left.equalTo(placeImg.mas_right).offset(10);
            make.topMargin.equalTo(placeImg);
            
        }];
        
        
        
        
        UIImageView *idImg = [[UIImageView alloc]init];
        
        idImg.image = [UIImage imageNamed:@"请输入证件号码左边图标"];
        
        [self addSubview:idImg];
        
        [idImg mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.top.equalTo(placeImg.mas_bottom).offset(10);
            make.leftMargin.equalTo(placeImg);
            
        }];
        
        
        
        
        UILabel *idLabel = [[UILabel alloc]init];
        
        idLabel.text = self.personNum;
        
        [self addSubview:idLabel];
        
        [idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(200, 20));
            make.topMargin.equalTo(idImg);
            make.leftMargin.equalTo(placeLabel);
        }];
        
        
        
      
        UIImageView *phoneImg = [[UIImageView alloc]init];
        
        phoneImg.image = [UIImage imageNamed:@"shouji"];
        
        [self addSubview:phoneImg];
        
        [phoneImg mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerXWithinMargins.equalTo(idImg);
            make.top.equalTo(idImg.mas_bottom).offset(10);
            
        }];
        
        
        
        
        UILabel *phoneLabel = [[UILabel alloc]init];
        
        phoneLabel.text = self.phoneNum;
        
        [self addSubview:phoneLabel];
        
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(200, 20));
            make.leftMargin.equalTo(idLabel);
            make.topMargin.equalTo(phoneImg);
        }];
     
        
        UILabel *nameLabel = [[UILabel alloc]init];
        
        nameLabel.text = self.name;
        
        nameLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:nameLabel];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.leftMargin.equalTo(img);
            make.top.equalTo(img.mas_bottom).offset(10);
        }];
        
        
        
        UIView *line = [[UIView alloc]init];
        
        line.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        [self addSubview:line];
        
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w, 1));
            make.top.equalTo(nameLabel.mas_bottom).offset(10);
            
        }];
        
        
        
 
        UIButton *button = [[UIButton alloc]init];
        
        [button setTitle:@"修改个人信息" forState:UIControlStateNormal];
        
        [button setTitleColor:[HXColor hx_colorWithHexRGBAString:@"AAAAAA"] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        
        [button addTarget:self action:@selector(clickLab) forControlEvents:UIControlEventTouchUpInside];
       
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(200, 30));
            make.centerXWithinMargins.equalTo(self);
            make.top.equalTo(line.mas_bottom).offset(5);
        }];
        
        
        
        
        UIView *line2= [[UIView alloc]init];
        
        line2.backgroundColor = [UIColor blackColor];
        
        [self addSubview:line2];
        
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(w, 1));
            make.top.equalTo(button.mas_bottom).offset(10);
            
        }];
        
        
        
    }
    
    
    
    return self;
}

- (void)clickLab{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    PersonTableViewController *person = [[PersonTableViewController alloc]init];
    
    MMDrawerController *vc1 = (MMDrawerController *)vc;
    
   id vc3 = vc1.centerViewController;
    
    [vc3 pushViewController:person animated:YES];

}

@end
