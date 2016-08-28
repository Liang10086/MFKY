//
//  PersonHeaderView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PersonHeaderView.h"
#import "MMDrawerController.h"
#import "HeadImageTableViewController.h"

@interface PersonHeaderView ()

@property (weak, nonatomic)UILabel *personName;

@property (weak, nonatomic)UILabel *personSex;

@property (weak, nonatomic)UILabel *personID;

@property (weak, nonatomic)UILabel *personPhone;

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *personNum;

@property (copy, nonatomic) NSString *phoneNum;



@end

@implementation PersonHeaderView


- (void)drawRect:(CGRect)rect {
   
    
}

- (instancetype)initWithFrame:(CGRect)frame{

    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    if ([super initWithFrame:frame]) {
        
        UIImageView *img = [[UIImageView alloc]init];
       
        img.image = [UIImage imageNamed:@"123"];
        
        [self addSubview:img];
        
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
        }];
        
        img.layer.cornerRadius = 40;
        img.layer.masksToBounds = YES;
        
        
        
        UILabel *alterLabel = [[UILabel alloc]init];
        
        alterLabel.font = [UIFont systemFontOfSize:w *0.038];
        
        alterLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        alterLabel.textAlignment = NSTextAlignmentCenter;
        
        alterLabel.text = @"修改头像";
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLabel)];
        
        [alterLabel addGestureRecognizer:tap];
        
        alterLabel.userInteractionEnabled = YES;
        
        [self addSubview:alterLabel];
        
        [alterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(80, 30));
            make.centerXWithinMargins.equalTo(img);
            make.top.equalTo(img.mas_bottom).offset(5);
            
        }];

        
        
        
        
        
        UIImageView *Person = [[UIImageView alloc]init];
        
        Person.image = [UIImage imageNamed:@"人物"];
        
        [self addSubview:Person];
        
        [Person mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.topMargin.equalTo(img);
            make.left.equalTo(img.mas_right).offset(10);
            
            
        }];

        NSArray *personArr = [DCsqLite queryAllPerson];
        
        [personArr enumerateObjectsUsingBlock:^(DCPerson *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            self.name = obj.name;
            self.personNum = obj.personNum;
            self.phoneNum = obj.phoneNum;
        }];
        
        
        
        
        
        UILabel *PersonName = [[UILabel alloc]init];
        
        PersonName.font = [UIFont systemFontOfSize:w *0.038];

//        PersonName.textAlignment = NSTextAlignmentCenter;
        
        
            
        PersonName.text = self.name;
        
        
        [self addSubview:PersonName];
       
        
        [PersonName mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(80, 20));
            make.centerYWithinMargins.equalTo(Person);
            make.left.equalTo(Person.mas_right).offset(10);
        }];

        
        
        
        
        
        
        
        UILabel *sex = [[UILabel alloc]init];
        
        sex.font = [UIFont systemFontOfSize:w *0.038];
        
        if (self.personSex == nil) {
            
            sex.text = @"男";
        
        }else{
        
            self.personSex = sex;
            
        }
        
        [self addSubview:sex];
        
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerYWithinMargins.equalTo(Person);
            make.left.equalTo(PersonName.mas_right).offset(10);
        }];

        
        
        UIImageView *youID =[[UIImageView alloc]init];

        youID.image = [UIImage imageNamed:@"定位"];
        
        [self addSubview:youID];
        
        [youID mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerXWithinMargins.equalTo(Person);
            make.top.equalTo(Person.mas_bottom).offset(10);
        }];
        
        
        
        UILabel *youIDLable = [[UILabel alloc]init];
        
        youIDLable.font = [UIFont systemFontOfSize:w *0.038];
        
        youIDLable.frame = CGRectMake(140, 50, 200, 20);
        
        
            
        youIDLable.text = self.personNum;
        

        
        [self addSubview:youIDLable];
        [youIDLable mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(200, 20));
            make.centerYWithinMargins.equalTo(youID);
            make.left.equalTo(youID.mas_right).offset(10);
        }];
        
        
        
        
        UIImageView *imgPhone = [[UIImageView alloc]init];
        
        imgPhone.image = [UIImage imageNamed:@"shouji"];
        
        [self addSubview:imgPhone];
        
        [imgPhone mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerXWithinMargins.equalTo(Person);
            make.top.equalTo(youID.mas_bottom).offset(10);
        }];
        
        
        
        
        UILabel *phoneLabel = [[UILabel alloc]init];
        
        phoneLabel.font = [UIFont systemFontOfSize:w *0.038];
        
        
            
        phoneLabel.text = self.phoneNum;
        
        
        [self addSubview:phoneLabel];
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(200, 20));
            make.centerYWithinMargins.equalTo(imgPhone);
            make.left.equalTo(imgPhone.mas_right).offset(10);
        }];

        
        
    }
    return self;
}


//- (void)personName:(NSString *)PersonName PersonSex:(NSString *)PersonSex PersonID:(NSString *)PersonID PersonPhone:(NSString *)PersonPhone{
//
//    self.personName.text = PersonName;
//    
//    self.personID.text = PersonID;
//    
//    self.personSex.text = PersonSex;
//    
//    self.personPhone.text = PersonPhone;
//    
//}
#pragma
#pragma mark -- 修改头像在这里
- (void)clickLabel{

    MMDrawerController *nav = (MMDrawerController *)self.window.rootViewController;
    
    id vc =nav.centerViewController;
    
    HeadImageTableViewController *head = [[HeadImageTableViewController alloc]init];
    
    head.title = @"个人头像";
    
    [vc pushViewController:head animated:YES];
    
}

@end
