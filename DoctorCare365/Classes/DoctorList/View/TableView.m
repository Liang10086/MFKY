//
//  TableView.m
//  doctorList
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "TableView.h"
#import "HexColors.h"


@interface TableView ()

@property (weak,nonatomic) UIButton *operationButton;

@property (weak,nonatomic) UIButton *flowerbutton;

@property (weak,nonatomic) UIButton *bannerButton;

@end

@implementation TableView {

    CGFloat _screenWidth;
}



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
       _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        for (NSInteger i = 1; i < 3; i ++) {
        
            UILabel *label = [[UILabel alloc]init];
            
            label.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"999999" alpha:0.2];
            
            label.frame = CGRectMake(_screenWidth / 3 * i,5, 1, 30);
            
            [self addSubview:label];
        }
    }
    
    return self;
}




- (void)setModel:(DoctorModel *)model {
    
    _model = model;
    
    [_operationButton setTitle:[NSString stringWithFormat:@"%@",model.operation_count] forState:UIControlStateNormal];
    
     [_flowerbutton setTitle:[NSString stringWithFormat:@"%@",model.flower] forState:UIControlStateNormal];
    
     [_bannerButton setTitle:[NSString stringWithFormat:@"%@",model.banner] forState:UIControlStateNormal];
    
    


}
- (void)addContent {
    
    for(NSInteger i = 0 ;i <3; i++){
    
    UIButton *button = [[UIButton alloc]init];
        
        button.contentMode = UIViewContentModeCenter;
    
    [self addSubview:button];
    
    [button setTitleColor:[HXColor hx_colorWithHexRGBAString:@"23BCBB"] forState:UIControlStateNormal];
    
    
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pic%ld",i + 1]] forState:UIControlStateNormal];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -_screenWidth / 9);
    
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -_screenWidth / 7, 0, 0);

    button.frame = CGRectMake(_screenWidth / 3 * i,0, _screenWidth / 3,35);
    
    UILabel *label = [[UILabel alloc]init];
    
    label.font = [UIFont systemFontOfSize:12];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [HXColor hx_colorWithHexRGBAString:@"999999"];
        
        switch (i + 1) {
            
            case 1:
            
                label.text = @"手术量:";
                
                _operationButton = button;
                
                break;
            case 2:
                
                label.text = @"鲜花量:";
                
                _flowerbutton = button;
                
                break;
                
            case 3:
                
                label.text = @"锦旗数:";
                
                _bannerButton = button;
                
                break;
                
            default:
                break;
        }
    
    [self addSubview:label];
    
    label.center = button.center;
    
    label.bounds = CGRectMake(0, 0, _screenWidth / 7, _screenWidth /7);
    
    }
    

}

- (void) layoutWithViews:(NSArray <UIView *>*)views {
    
    for(NSInteger i = 0; i < 3; i ++
        ) {
        
        views[i].frame = CGRectMake(_screenWidth / 3 * i, 0, _screenWidth/3, self.bounds.size.height);
        
    }
    

}

@end
