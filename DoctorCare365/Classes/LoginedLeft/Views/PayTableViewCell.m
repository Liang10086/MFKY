//
//  PayTableViewCell.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PayTableViewCell.h"

@implementation PayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *labTime = [[UILabel alloc]init];
        
        labTime.text = @"2015-06-01  12:00";
        labTime.textColor = [HXColor hx_colorWithHexRGBAString:@"AAAAAA"];
        labTime.frame = CGRectMake(10, 30, 200, 20);
        
        [self.contentView addSubview:labTime];

        
        UILabel *lab = [[UILabel alloc]init];
        
        self.render = lab;
        
        lab.textColor = [HXColor hx_colorWithHexRGBAString:@"878787"];
        
        lab.frame = CGRectMake(10, 5, 40, 20);
        
        [self.contentView addSubview:lab];
        
        
        UILabel *labelName = [[UILabel alloc]init];
        
        self.name = labelName;
        
        labelName.textColor = [HXColor hx_colorWithHexRGBAString:@"878787"];
        
        labelName.frame = CGRectMake(55, 5, 60, 20);
        
        [self.contentView addSubview:labelName];

        
        UILabel *gift = [[UILabel alloc]init];

        self.gift = gift;
        
        gift.textColor = [HXColor hx_colorWithHexRGBAString:@"118AD0"];
        
        gift.frame = CGRectMake(120, 5, 110, 20);
        
        [self.contentView addSubview:gift];
        
        
        UILabel *priceLabel = [[UILabel alloc]init];
        
        self.priceLabel = priceLabel;
        
        priceLabel.textAlignment = NSTextAlignmentRight;
        
        priceLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"FD4D53"];
        
        [self.contentView addSubview:priceLabel];
        
        
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.right.equalTo(self.contentView).offset(0);
            make.centerYWithinMargins.equalTo(self.contentView);
            
        }];
        
        
    }
    
    return self;
}



@end
