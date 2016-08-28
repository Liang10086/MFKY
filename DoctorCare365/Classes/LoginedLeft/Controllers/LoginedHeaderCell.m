//
//  LoginedHeaderCell.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "LoginedHeaderCell.h"
#import "MMDrawerController.h"
#import "PersonTableViewController.h"
@implementation LoginedHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *img = [[UIImageView alloc]init];
        
        img.image = [UIImage imageNamed:@"123"];
        
        img.frame = CGRectMake(20, 30, 50, 50);
        
        img.layer.cornerRadius = 25;
        img.layer.masksToBounds = YES;
        
        [self.contentView addSubview:img];
        
        
        
        UILabel *labelName = [[UILabel alloc]init];
        labelName.textColor = [UIColor whiteColor];
        NSArray *personArr = [DCsqLite queryAllPerson];
        
        [personArr enumerateObjectsUsingBlock:^(DCPerson *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            labelName.text = obj.name;
        }];
        
        labelName.frame = CGRectMake(90, 30, 200, 30);
        
        [self.contentView addSubview:labelName];
        
        
        
        
        UILabel *setLabel = [[UILabel alloc]init];
        
        setLabel.text = @"基本资料设置";
        
        setLabel.textColor = [UIColor whiteColor];
        
        setLabel.userInteractionEnabled = YES;

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLabel)];
        
        [setLabel addGestureRecognizer:tap];
        
//        setLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        
        setLabel.frame = CGRectMake(90, 60, 200, 30);
        
        [self.contentView addSubview:setLabel];
        
    }

    return self;
}


- (void)clickLabel{

    UIViewController *vc =  [UIApplication sharedApplication].keyWindow.rootViewController;
    
    MMDrawerController *vc3 = (MMDrawerController *)vc;
    
    id vc2 = vc3.centerViewController;
    
    [vc3 closeDrawerAnimated:YES completion:nil];
    
    
    PersonTableViewController *tap = [[PersonTableViewController alloc]init];
    
    tap.title = @"个人信息修改";
    
    [vc2 pushViewController:tap  animated:YES];
  
}


@end
