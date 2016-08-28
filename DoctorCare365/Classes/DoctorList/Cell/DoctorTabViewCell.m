//
//  DoctorTableViewCell.m
//  doctorList
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorTabViewCell.h"
#import <Masonry.h>
#import "HexColors.h"
#import "UIImageView+WebCache.h"

@interface DoctorTabViewCell ()

@property (weak,nonatomic) UIView *view;

@property (weak,nonatomic) UIImageView *IconImageView;

@property (weak,nonatomic) UILabel *doctorLabel;

@property (weak,nonatomic) UILabel *professionalLabel;

@property (weak,nonatomic) UILabel *hospitalLabel;

@property (weak,nonatomic) UIButton *operationCountButton;

@property (weak,nonatomic) UIButton *matchButton;

@property (weak,nonatomic) UIButton *bannerButton;

@property (weak,nonatomic) UIButton *flowerButton;

@end

@implementation DoctorTabViewCell{
    
    CGFloat _screenWidth;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
          _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        [self setupCell];
        
    }
    
    return self;
    

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:NO animated:animated];
      self.view.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"F2F2F2"];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

//    [super setSelected:selected animated:YES];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
  
    
//    [self setupCell];
    
    

}

- (void)setModel:(DoctorModel *)model {

    _model = model;
    
    [self.IconImageView sd_setImageWithURL:[NSURL URLWithString:model.doctor_portrait]];
    
    self.doctorLabel.text = model.doctor_name;
    
    self.professionalLabel.text = model.doctor_title_name;
    
    [self.operationCountButton setTitle:[NSString stringWithFormat:@"%@",model.operation_count] forState:UIControlStateNormal];
    
    [self.flowerButton setTitle:[NSString stringWithFormat:@"%@",model.flower] forState:UIControlStateNormal];
    
    [self.bannerButton setTitle:[NSString stringWithFormat:@"%@",model.banner] forState:UIControlStateNormal];
    
    [self.matchButton setTitle:[NSString stringWithFormat:@"匹配度\r\n  %@",model.accuracy] forState:UIControlStateNormal];
    
    
    
}

- (void)setupCell{
    
    
    
    UIView *view = [[UIView alloc]init];
    
    _view= view;
    
    [self.contentView addSubview:_view];
    
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.width.equalTo(self.contentView);
        make.height.mas_equalTo(20);
        
        
    }];
    
    
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    
    [self.contentView addSubview:iconImageView];
    
    _IconImageView = iconImageView;
    
    iconImageView.layer.cornerRadius = 10;
    
    iconImageView.layer.masksToBounds = YES;
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(view.mas_bottom).mas_offset(10);
        
        make.left.mas_equalTo(self.contentView).mas_equalTo(15);
        
        make.bottom.mas_equalTo(self.contentView).mas_offset(-10);
        
        make.width.mas_equalTo(60);
        
        
    }];
    
    
    
    
    UILabel *doctorLabel = [[UILabel alloc] init];
    
    doctorLabel.font = [UIFont systemFontOfSize:13];
    
    doctorLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4B4B4B" alpha:1.0];
    
    [self.contentView addSubview:doctorLabel];
    
    _doctorLabel = doctorLabel;
    
    [doctorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(iconImageView.mas_top);
        
        make.left.mas_equalTo(iconImageView.mas_right).mas_offset(8);
        
    }];
    
    
    
    
    UILabel *professionalLabel = [[UILabel alloc]init];
    
    professionalLabel.font = [UIFont systemFontOfSize:11];
    
    professionalLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4B4B4B" alpha:0.4];
    
    [self.contentView addSubview:professionalLabel];
    
    _professionalLabel = professionalLabel;

    [professionalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(doctorLabel.mas_right).mas_offset(5);
        
        make.bottom.mas_equalTo(doctorLabel);
        
        
    }];
    
    
    
    
    
    UILabel *hospitalLabel = [[UILabel alloc]init];
    
    hospitalLabel.font = [UIFont systemFontOfSize:12];
    
    hospitalLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4B4B4B" alpha:0.6];
    
     [self.contentView addSubview:hospitalLabel];
    
    _hospitalLabel = hospitalLabel;
    
    [hospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(doctorLabel);
        
        make.centerY.mas_equalTo(iconImageView.mas_centerY);
        
        
    }];
    
    
    
    UIButton *operationCountButton = [[UIButton alloc]init];
    
    [self.contentView addSubview:operationCountButton];
    
   _operationCountButton = operationCountButton;
    
    [operationCountButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"23BCBB" alpha:1.0] forState:UIControlStateNormal];
    
    operationCountButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    operationCountButton.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, 0);
    
    [operationCountButton setImage:[UIImage imageNamed:@"pic1"] forState:UIControlStateNormal];
    
    [operationCountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(hospitalLabel);
        
        make.bottom.mas_equalTo(iconImageView);
        
        make.height.mas_equalTo(20);
        
    }];
    
    
    
    
    UIButton *flowerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.contentView addSubview:flowerButton];
    
//    [flowerButton addTarget:self action:@selector(demo) forControlEvents:UIControlEventTouchUpInside];
    
    _flowerButton = flowerButton;
    
    [flowerButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"23BCBB" alpha:1.0] forState:UIControlStateNormal];
    
    flowerButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [flowerButton setImage:[UIImage imageNamed:@"pic2"] forState:UIControlStateNormal];
    
    [flowerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(operationCountButton.mas_right).mas_offset(_screenWidth/14);
        
        make.bottom.mas_equalTo(operationCountButton);
        
        make.top.mas_equalTo(operationCountButton);
        
    }];
    
    
    
    
    UIButton *bannerButton = [[UIButton alloc]init];
    
    [self.contentView addSubview:bannerButton];
    
    _bannerButton = bannerButton;
    
      [bannerButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"23BCBB" alpha:1.0] forState:UIControlStateNormal];
    
    bannerButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [bannerButton setImage:[UIImage imageNamed:@"pic3"] forState:UIControlStateNormal];
    
    [bannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(flowerButton.mas_right).mas_offset(_screenWidth/14);

        make.bottom.mas_equalTo(flowerButton);
        
        make.top.mas_equalTo(flowerButton);
        
        
    }];
    
    
    
    UIButton *matchButton = [[UIButton alloc]init];
    
    [self.contentView addSubview:matchButton];
    
    _matchButton = matchButton;
    
    matchButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    matchButton.titleEdgeInsets = UIEdgeInsetsMake(40, 0, 40, 3);
    
    matchButton.titleLabel.numberOfLines = 0;

    [matchButton setBackgroundImage:[UIImage imageNamed:@"C651DC36-E6EF-4EB5-8E8F-81FC540094F5"] forState:UIControlStateNormal];
    
    matchButton.imageEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    
    [matchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView).mas_equalTo(16);
        
        make.right.mas_equalTo(self.contentView).mas_equalTo(-45);
        
    }];
    
    
    UIImageView *indicatorImageView = [[UIImageView alloc]init];
    
    indicatorImageView.image = [UIImage imageNamed:@"4D5C677E-5E22-4D0C-8C3F-ABF174A3700A"];
    
    [self.contentView addSubview:indicatorImageView];
    
    [indicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView).mas_offset(-20);
        
        make.centerY.mas_equalTo(iconImageView.mas_centerY);
        
        
    }];
    
    
    
}

//- (void)demo {
//
//    NSLog(@"hahahahahahhahha");
//}






@end
