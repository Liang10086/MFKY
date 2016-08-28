//
//  DoctorTableViewCell.m
//  DoctorCare365
//
//  Created by ss on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorTableViewCell.h"
#import "DiseaseViewController.h"


@interface DoctorTableViewCell ()

@end

@implementation DoctorTableViewCell

//重写initWithStyle方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor redColor];
        
        self.contentView.backgroundColor = [UIColor redColor];
        
//        *加载xib
        self = [[[NSBundle mainBundle] loadNibNamed:@"DoctorTableViewCell" owner:self options:nil] lastObject];
    }
    
    return self;
}

//创建点击事件
- (IBAction)clickButton:(UIButton *)sender {

        if (self.successBlock) {
//            按钮的tag值与按钮的当前文字的传递
            self.successBlock(sender.tag,sender.currentTitle);
        }
}
//重写setFream方法，设置xib的位置
- (void)setFrame:(CGRect)frame
{
    frame.size.width = [UIApplication sharedApplication].keyWindow.bounds.size.width;
    
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
