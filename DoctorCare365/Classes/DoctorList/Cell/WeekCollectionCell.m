//
//  WeekCollectionCell.m
//  doctorList
//
//  Created by ios on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "WeekCollectionCell.h"
#import <Masonry.h>
#import "HexColors.h"
#import "NumStateButton.h"

@implementation WeekCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        

        
    }
    
    return self;
}




- (void)addContentWithRow:(NSInteger)row {

    
    UIButton *weekButton = [[UIButton alloc]init];
    
    NSArray *dateArray = [self dataWith:row];
    
    
    [weekButton setTitle:[dateArray lastObject] forState:UIControlStateNormal];
    
    [weekButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"666666"] forState:UIControlStateNormal];
    
    weekButton.titleLabel.font = [UIFont systemFontOfSize:self.bounds.size.width/4];
    
    weekButton.contentEdgeInsets = UIEdgeInsetsMake(self.bounds.size.height / 8, 0, 0, 0);
    
    weekButton.contentMode = UIViewContentModeBottom;
    
    UIButton *timeButton = [[UIButton alloc]init];
    
    [timeButton setTitle:[dateArray firstObject] forState:UIControlStateNormal];
    
    [timeButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"A4A4A4" alpha:1.0] forState:UIControlStateNormal];
    
    timeButton.titleLabel.font = [UIFont systemFontOfSize:self.bounds.size.width/4];
    
    timeButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, self.bounds.size.height / 8, 0);
    
  
    [self.contentView addSubview:weekButton];
    
    [self.contentView addSubview:timeButton];
    
    [weekButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.mas_equalTo(self.contentView);
        
    }];
    
    [timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weekButton.mas_bottom);
        make.left.bottom.right.mas_equalTo(self.contentView);
        
        make.height.mas_equalTo(weekButton);
        
    }];
}

- (void)addTimePartWithStr:(NSString *)str {
    
    UIButton *weekButton = [[UIButton alloc]init];

    
    weekButton.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    
    
    
    [weekButton setTitle:[str substringWithRange:NSMakeRange(0, 1)] forState:UIControlStateNormal];
    
    [weekButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"666666"] forState:UIControlStateNormal];
    
    weekButton.contentEdgeInsets = UIEdgeInsetsMake(8, 15, 0, 0);
    
    weekButton.titleLabel.font = [UIFont systemFontOfSize:11];

    
    
    weekButton.contentMode = UIViewContentModeBottom;
    
    UIButton *timeButton = [[UIButton alloc]init];
    
    [timeButton setTitle:[str substringWithRange:NSMakeRange(1, 1)] forState:UIControlStateNormal];
    
    [timeButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"666666" alpha:1.0] forState:UIControlStateNormal];
    
    timeButton.titleLabel.font = [UIFont systemFontOfSize:11];
    
    timeButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
   
    timeButton.contentEdgeInsets = UIEdgeInsetsMake(0, 15, -8, 0);
    
    [self.contentView addSubview:weekButton];
    
    [self.contentView addSubview:timeButton];
    
    [weekButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.mas_equalTo(self.contentView);
        
    }];
    
    [timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weekButton.mas_bottom);
        make.left.bottom.right.mas_equalTo(self.contentView);
        
        make.height.mas_equalTo(weekButton);
        
    }];
    


}


- (void)addNumberStateButtonWithDict:(NSDictionary *)dict {
    
   
    
    if ([dict[@"hasNum"] isEqualToString:@"1"]) {
        
        NumStateButton *button = [[NumStateButton alloc]init];
        
        [self.contentView addSubview:button];
        
    [button setTitle:@"有号" forState:UIControlStateNormal];
        
    [button setImage:[UIImage imageNamed:dict[@"hospitalName"]] forState:UIControlStateNormal];
        
    button.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        button.titleLabel.contentMode =  UIViewContentModeTop;
        
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

        [button setBackgroundColor:[HXColor hx_colorWithHexRGBAString:@"E6F9F8"]];
        
             [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.bottom.right.mas_equalTo(self.contentView);
            
        }];
        
        
        button.userInteractionEnabled = NO;
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        

    }else {
        
        UIButton *button = [[UIButton alloc]init];
        
        [self.contentView addSubview:button];

        
        [button setTitle:@"约满" forState:UIControlStateNormal];
        
        
        
         button.titleLabel.textAlignment = NSTextAlignmentCenter;
        
         button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        button.titleLabel.center = [button superview].center;
        
          [button setBackgroundColor:[HXColor hx_colorWithHexRGBAString:@"B6C2CB" alpha:0.6]];
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.bottom.right.mas_equalTo(self.contentView);
            
        }];
        
        button.userInteractionEnabled = NO;
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
    


}



- (void)click:(UIButton *)sender {
    
    
    NSLog(@"被点击了");
    
    
    
}





- (NSArray *)dataWith:(NSInteger)week {
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:(week-1) * 24 *3600];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger flags = NSCalendarUnitWeekday ;
    
    NSDateComponents *comps = [calendar components:flags fromDate:date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"M月d日";
    
    NSString *weekDay;
    
    long weekNumber = [comps weekday];
    switch (weekNumber) {
        case 1:
            weekDay=@"周日";
            break;
        case 2:
            weekDay=@"周一";
            break;
        case 3:
            weekDay=@"周二";
            break;
        case 4:
            weekDay=@"周三";
            break;
        case 5:
            weekDay=@"周四";
            break;
        case 6:
            weekDay=@"周五";
            break;
        case 7:
            weekDay=@"周六";
            break;
            
        default:
            break;
    }
    
    NSArray *arr = @[[formatter stringFromDate:date],weekDay];
    
    return arr;
    
}



@end
