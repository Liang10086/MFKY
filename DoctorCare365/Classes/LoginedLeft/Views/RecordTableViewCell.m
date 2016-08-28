//
//  RecordTableViewCell.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
        UILabel *lab = [[UILabel alloc]init];
        
        lab.text = @"暂时没有你的病历";
        
        lab.textColor = [UIColor blueColor];
        
        [self.contentView addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.size.mas_equalTo(CGSizeMake(w /2, 30));
            make.centerXWithinMargins.equalTo(self);
            make.top.equalTo(self.contentView).offset(10);
        }];
        
        
    }
    return self;
}
@end
