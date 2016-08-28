//
//  DCFindCell.m
//  DoctorCare365
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DCFindCell.h"

@interface DCFindCell()

//医院图片
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

//医院名字
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

//医院等级
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

//地址图片
@property (weak, nonatomic) IBOutlet UIImageView *addressIconImage;

//地址文字
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

//箭头
@property (weak, nonatomic) IBOutlet UIButton *btnIconImageView;

@end


@implementation DCFindCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"DCFindView" owner:nil options:nil]lastObject];
        
    }
    
    return self;
}

-(void)setModel:(DCFindModel *)model{
    _model = model;
    
    //赋值头像
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    
    //赋值医院名字
    self.nameLabel.text = model.name;

    //医院等级
    self.rankLabel.text = model.rank;
    
    //地址
    self.addressLabel.text = model.address;
    
    //地址图片
    self.addressIconImage.image = [UIImage imageNamed:model.addressIcon];
    
    //箭头
//    self.btnIconImageView.imageView.image = [UIImage imageNamed:model.btnImage];
    
    [self.btnIconImageView setImage:[UIImage imageNamed:model.btnImage] forState:UIControlStateNormal];
}



@end
