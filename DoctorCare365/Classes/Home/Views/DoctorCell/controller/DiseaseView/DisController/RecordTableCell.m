//
//  RecordTableCell.m
//  DoctorCare365
//
//  Created by ss on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RecordTableCell.h"

@implementation RecordTableCell

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
}
- (void)setModel:(ComModel *)model{
    
    _model = model;
    
//    cell上的文字为complication——name
    self.textLabel.text = model.complication_name;
    
    self.highlighted = NO;
    //        创建导航控制器右侧按钮
    self.imageView.image = [UIImage imageNamed:@"ok"];
    
    self.imageView.hidden = YES;
    
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isHidenImg)];
//    [self.imageView addGestureRecognizer:tap];
    [self addGestureRecognizer:tap];
    self.contentView.userInteractionEnabled = YES;

}
- (void)isHidenImg{
    self.imageView.hidden = !self.imageView.isHidden;
    self.model.bl = !self.imageView.isHidden;
}
- (void)awakeFromNib {
    
    UIImage *image = [UIImage imageNamed:@"ok"];
    
    self.imageView.image = image;
    
}


@end
