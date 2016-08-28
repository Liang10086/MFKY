//
//  DoctorInfoHeaderView.m
//  doctorList
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorInfoHeaderView.h"
#import <Masonry.h>
#import "HexColors.h"
#import "TableView.h"
#import "LineView.h"
#import "DoctorInfoCell.h"

@interface DoctorInfoHeaderView ()

@property (weak,nonatomic) UIView *view;

@property (weak,nonatomic) UIImageView *IconImageView;

@property (weak,nonatomic) UILabel *doctorLabel;

@property (weak,nonatomic) UILabel *professionalLabel;

@property (weak,nonatomic) UILabel *hospitalLabel;

@property (weak,nonatomic) UIButton *operationCountButton;

@property (weak,nonatomic) UIButton *matchButton;

@property (weak,nonatomic) UIButton *bannerButton;

@property (weak,nonatomic) UIButton *flowerButton;

@property (weak,nonatomic) UILabel *doctorTitleLabel;

@property (weak,nonatomic) UILabel *tutorLabel;

@property (weak,nonatomic) UIImageView *addImageView;

@property (weak,nonatomic) TableView *tableView;

@property (weak,nonatomic) UIView *viewLine;

@property (weak,nonatomic) UIView *lineView;


@end

@implementation DoctorInfoHeaderView{
    
    CGFloat _screenWidth;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        self.bounds = CGRectMake(0, 0, _screenWidth, 0);
        
        [self setupSubView];
    }
    
    return self;
    
}





- (void)layoutSubviews {
    
    [super layoutSubviews];

    
    

}


- (void)setModel:(DoctorModel *)model {

    _model = model;
    
    self.tableView.model = model;
    
    _doctorLabel.text = [NSString stringWithFormat:@"%@医生",[model.doctor_name substringToIndex:1]];

}

- (void)setupSubView {
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    
    [self addSubview:iconImageView];
    
    iconImageView.image = [UIImage imageNamed:@"icon"];
    
    _IconImageView = iconImageView;
    
    iconImageView.layer.cornerRadius = 5;
    
    iconImageView.layer.masksToBounds = YES;
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self).mas_offset(10);
        
        make.left.mas_equalTo(self).mas_equalTo(15);
        
        make.height.mas_equalTo(40);
        
        make.width.mas_equalTo(40);
        
    }];
    
   
    
    UILabel *doctorLabel = [[UILabel alloc] init];
    
    doctorLabel.font = [UIFont systemFontOfSize:17];
    
    doctorLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4B4B4B" alpha:0.9];
    
    [self addSubview:doctorLabel];
    
    _doctorLabel = doctorLabel;
    
    [doctorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(iconImageView.mas_top);
        
        make.left.mas_equalTo(iconImageView.mas_right).mas_offset(8);
    
        
    }];
    
    
    
    UILabel *professionalLabel = [[UILabel alloc]init];
    
    professionalLabel.font = [UIFont systemFontOfSize:15];
    
    professionalLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4B4B4B" alpha:0.6];
    
    [self addSubview:professionalLabel];
    
    professionalLabel.text = @"心血管内科";
    
    _professionalLabel = professionalLabel;
    
    [professionalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(doctorLabel.mas_right).mas_offset(10);
        
        make.bottom.mas_equalTo(doctorLabel);
        
        
    }];
    
   
    
    UILabel *doctorTitleLabel = [[UILabel alloc]init];
    
    doctorTitleLabel.font = [UIFont systemFontOfSize:13];
    
    doctorTitleLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4E4E4E" alpha:0.4];
    
    [self addSubview:doctorTitleLabel];
    
    doctorTitleLabel.text = @"主任医师";
    
    _doctorTitleLabel = doctorTitleLabel;
    
    [doctorTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(professionalLabel.mas_right).mas_offset(10);
        
        make.bottom.mas_equalTo(professionalLabel);
    }];
    

    
    UILabel *hospitalLabel = [[UILabel alloc]init];
    
    hospitalLabel.font = [UIFont systemFontOfSize:13];
    
    hospitalLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"4B4B4B" alpha:0.6];
    
    [self addSubview:hospitalLabel];
    
    _hospitalLabel = hospitalLabel;
    
    hospitalLabel.text = @"北京协和医院";
    
    [hospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(doctorLabel);
        
        make.bottom.mas_equalTo(iconImageView);
        
        
    }];
    
    
    UIImageView *detailImageView = [[UIImageView alloc]init];
    
    [self addSubview:detailImageView];
    
    detailImageView.image = [UIImage imageNamed:@"pic4"];
    
    [detailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(iconImageView).mas_offset(5);
        
        make.right.mas_equalTo(self).mas_offset(-10);
        
        make.width.mas_equalTo([UIImage imageNamed:@"pic4"].size.width);
        
        make.height.mas_equalTo([UIImage imageNamed:@"pic4"].size.height);
        
    }];
    
    
    UIView *view = [[UIView alloc]init];
    
    _view= view;
    
    view.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"EFF4F9"];
    
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(iconImageView.mas_bottom).mas_offset(10);
        
        make.height.mas_equalTo(35);
        
        make.left.mas_equalTo(self).mas_offset(12);
        
        make.right.mas_equalTo(self).mas_offset(-12);
        
    }];
    
    
    UIImageView *addImageView = [[UIImageView alloc]init];
    
    _addImageView = addImageView;
    
    [_view addSubview:addImageView];
    
    
    addImageView.image = [UIImage imageNamed:@"导师"];
    
    [addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(view);
        
        make.centerX.mas_equalTo(iconImageView);
        
    }];
    
    
    UILabel *tutorLabel = [[UILabel alloc]init];
    
    [view addSubview:tutorLabel];
    
    _tutorLabel = tutorLabel;
    
    tutorLabel.font = [UIFont systemFontOfSize:13];
    
    tutorLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"666666" alpha:1.0];
    
    tutorLabel.text = @"导师: 王教授(中国肿瘤医学委员会主任)";
    
    [tutorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(addImageView);
        
        make.left.mas_equalTo(addImageView.mas_right).mas_offset(5);
        
        
        
    }];
    
    
    
    TableView *tableView = [[TableView alloc]init];
    
    [self addSubview:tableView];
    
    _tableView = tableView;
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(view.mas_bottom);
        
        make.left.right.mas_equalTo(self);
        
        make.height.mas_equalTo(35);
        
    }];
    
    [tableView layoutIfNeeded];
    
    [tableView addContent];
    
    UIView *viewLine = [[UIView alloc]init];
    
    viewLine.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"F2F2F2"];
    
    _viewLine= viewLine;
    
    [self addSubview:viewLine];
    
    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self);
        
        make.top.mas_equalTo(tableView.mas_bottom);
        
        make.height.mas_equalTo(15);
        
        
    }];
    
    TableView *detailListView = [[TableView alloc]init];
    
    [self addSubview:detailListView];
    
    [detailListView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(viewLine.mas_bottom);
        
        make.left.right.mas_equalTo(self);
        
        make.height.mas_equalTo(35);
        
    }];
    
    [detailListView layoutIfNeeded];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 3; i ++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        button.tag = i;
        
        [button setTitleColor:[HXColor hx_colorWithHexRGBAString:@"666666"] forState:UIControlStateNormal];
        
        button.contentMode = UIViewContentModeBottom;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            [button setTitle:@"接诊条件" forState:UIControlStateNormal];
            
        }else if(i == 1) {
            
            [button setTitle:@"医生简介" forState:UIControlStateNormal];
        
        }else {
        
            [button setTitle:@"就诊时间" forState:UIControlStateNormal];
            
        }
        
        [detailListView addSubview:button];
        
        [arrayM addObject:button];
        
    }
    
    [detailListView layoutWithViews:arrayM];
    
    LineView *line = [[LineView alloc]init];
    
    UIView *blueView = [[UIView alloc]init];
    
    blueView.layer.cornerRadius = 5;
    
    blueView.layer.masksToBounds = YES;
    
    [line addSubview:blueView];
    
    blueView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"23BCBB" alpha:1.0];
    
    blueView.frame = CGRectMake(0, 0, _screenWidth/3, 2);
    
    _lineView = blueView;
    
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(detailListView.mas_bottom);
        
        make.left.right.mas_equalTo(self);
        
        make.height.mas_equalTo(2);
        
    }];
    
    [line layoutIfNeeded];
    
    self.frame = CGRectMake(0, 0, _screenWidth, CGRectGetMaxY(line.frame));
    
}

- (void)buttonClick:(UIButton *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.lineView.frame = CGRectMake(sender.tag * _screenWidth / 3 - 1, 0, _screenWidth / 3 + 3, 2);
        
        
    }];
    
    NSIndexPath *indPath = [NSIndexPath indexPathForRow:0 inSection:0];

    UITableView *tableView = (UITableView *)self.superview;
    
    DoctorInfoCell *cell = [tableView cellForRowAtIndexPath:indPath];
    
    [cell showViewWith:sender.tag];
    
    
}

- (UIViewController *)findViewController:(UIView *)sourceView
{
    id target=sourceView;
    
    while (target) {
        
        target = ((UIResponder *)target).nextResponder;
        
        if ([target isKindOfClass:[UIViewController class]]) {
            
            break;
        }
        
    }
    
    return target;
}


@end
