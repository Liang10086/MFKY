//
//  TGCell.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "TGCell.h"
#import "XMGInfiniteScrollView.h"
#import "PickerView.h"
@interface TGCell ()
//图片
@property (strong, nonatomic) UIImageView *MyImage;
//天气
@property (strong, nonatomic) UILabel *WeatherLabel;
//时间
@property (strong, nonatomic) UILabel *dateLabel;
//温度
@property (strong, nonatomic) UILabel *TemperatureLabel;
//地点
@property (strong, nonatomic) UILabel *SiteLabel;

@property (assign, nonatomic)NSString *dayPictureUrl;

@property (strong, nonatomic)UITextField *textField;

@property (strong, nonatomic)PickerView *pick;

@property (strong, nonatomic)UIToolbar *toolbar;

@property (assign, nonatomic)NSString *areaName;

@end

@implementation TGCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        [self loadupdata];
        
        
        
        
    }
    
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor colorWithRed:217/255.0 green:242255.0 blue:246/255.0 alpha:1];
    
    //图片
    self.MyImage = [[UIImageView alloc] init];
    self.MyImage.image = [UIImage imageNamed:@"sun"];
    [self addSubview:self.MyImage];
    
    //天气
    self.WeatherLabel = [[UILabel alloc] init];
    self.WeatherLabel.text = @"加载中...";
    self.WeatherLabel.numberOfLines = 0;
    self.WeatherLabel.textAlignment = NSTextAlignmentCenter;
    self.WeatherLabel.textColor = [UIColor colorWithRed:104/255.0 green:198/255.0 blue:199/255.0 alpha:1];
    [self addSubview:self.WeatherLabel];
    
    //地点
    self.SiteLabel = [[UILabel alloc] init];
    self.SiteLabel.text = @"加载中...";
    self.SiteLabel.numberOfLines = 0;
    self.SiteLabel.textColor = [UIColor colorWithRed:104/255.0 green:198/255.0 blue:199/255.0 alpha:1];
    [self addSubview:self.SiteLabel];
    self.SiteLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [self.SiteLabel addGestureRecognizer:tap];
    
    //分隔线
    UIView * separatView = [[UIView alloc] init];
    separatView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:separatView];
    
    //温度
    self.TemperatureLabel = [[UILabel alloc] init];
    self.TemperatureLabel.text = @"加载中...";
    self.TemperatureLabel.textColor = [UIColor colorWithRed:104/255.0 green:198/255.0 blue:199/255.0 alpha:1];
    self.TemperatureLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.TemperatureLabel];
    
    //时间
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.text = @"加载中...";
    self.dateLabel.textColor = [UIColor colorWithRed:104/255.0 green:198/255.0 blue:199/255.0 alpha:1];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.dateLabel];
    
    
    //大图 约束
//    UIImageView *iconView = [[UIImageView alloc] init];
//    iconView.image = [UIImage imageNamed:@"banner"];
//    [self addSubview:iconView];

    UIImage *image1 = [UIImage imageNamed:@"1"];
    UIImage *image2 = [UIImage imageNamed:@"2"];
    UIImage *image3 = [UIImage imageNamed:@"banner"];
    
    XMGInfiniteScrollView *xmgView = [XMGInfiniteScrollView infiniteScrollView];
    
    NSArray *array = @[image3,image1,image2];
    
    xmgView.images = array;
    
    xmgView.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    
    xmgView.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    [self addSubview:xmgView];
    //大图 约束
    [xmgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        
        make.height.mas_equalTo(@207);
    }];
    
    [xmgView.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(xmgView).offset(50);
        
        make.centerX.mas_equalTo(xmgView);
        
    }];
    
    //分隔线 约束
    [separatView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(20);
        make.top.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(xmgView.mas_top).offset(-10);
        make.width.mas_equalTo(@1);
    }];
    
    //温度 约束
    [self.TemperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(separatView.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.top.mas_equalTo(self).offset(10);
    }];
    
    //时间 约束
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(separatView.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(xmgView.mas_top).offset(-10);
    }];
    
    //地点 约束
    [self.SiteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(separatView.mas_left).offset(-10);
        make.width.mas_equalTo(@40);
        make.centerY.mas_equalTo(separatView.mas_centerY);
    }];
    
    
    //天气图片 约束
    [self.MyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.WeatherLabel.mas_centerY);
        make.left.mas_equalTo(self).offset(10);
        make.width.height.mas_equalTo(@55);
        
    }];
    
    //天气 约束
    [self.WeatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.SiteLabel.mas_centerY);
        make.right.mas_equalTo(self.SiteLabel.mas_left).offset(-3);
        make.left.mas_equalTo(self.MyImage.mas_right).offset(3);
    }];
    
    
}


#pragma
#pragma mark -- 点击城市选择
- (void)click:(UITapGestureRecognizer*)click{

    [self.SiteLabel addSubview:self.textField];
   
    [self.textField becomeFirstResponder];

}

//下载数据
- (void)loadupdata{
    
    if (self.areaName == nil) {
        self.areaName = @"北京";
    }
    NSString *urlStr = [NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=17IvzuqmKrK1cGwNL6VQebF9",self.areaName];

    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    [[NetWorkTool sharedNetWorkTool] GETWithURlString:urlStr parameterDict:nil success:^(id responseObject) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        if (![[responseDict objectForKey:@"status"] isEqual:@"success"]) {
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"暂时不支持该地区显示" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alertVC addAction:alert];
            
            UIViewController *vc = [[UIApplication sharedApplication]keyWindow].rootViewController;
            
            [vc presentViewController:alertVC animated:YES completion:nil];
            
            alert.enabled = YES;
            
            return;
        }
        
        //时间
        self.dateLabel.text = [responseDict objectForKey:@"date"];
        //取出 json 里边的数据
        NSArray *results = [responseDict objectForKey:@"results"];
        
        NSDictionary *dic = [results objectAtIndex:0];
        
        self.SiteLabel.text = [dic objectForKey:@"currentCity"];
        
        NSArray *arr1 = [dic objectForKey:@"weather_data"];
        
        NSDictionary *weatherdata = [arr1 objectAtIndex:0];
        //天气
        self.WeatherLabel.text = [weatherdata objectForKey:@"weather"];
        //温度
        self.TemperatureLabel.text = [weatherdata objectForKey:@"temperature"];
        
        self.dayPictureUrl = [weatherdata objectForKey:@"dayPictureUrl"];
        
        if ([self.dayPictureUrl rangeOfString:@"yun"].location!=NSNotFound) {
            
            self.MyImage.image = [UIImage imageNamed:@"overcast"];
            
        }else if([self.dayPictureUrl rangeOfString:@"yu"].location!=NSNotFound){
            
            self.MyImage.image = [UIImage imageNamed:@"rain"];
            
        }else if ([self.dayPictureUrl rangeOfString:@"qing"].location!=NSNotFound){
            
            self.MyImage.image = [UIImage imageNamed:@"sun"];
            
        }else if ([self.dayPictureUrl rangeOfString:@"xue"].location!=NSNotFound){
            
            self.MyImage.image = [UIImage imageNamed:@"snow"];
            
        }else if ([self.dayPictureUrl rangeOfString:@"wu"].location!=NSNotFound){
            
            self.MyImage.image = [UIImage imageNamed:@"overcast-1"];
            
        }
        

    } failure:^(NSError *error) {
        DCLog(@"错误");
    }];

}

#pragma
#pragma mark -- 懒加载
- (NSString *)dayPictureUrl{

    if (_dayPictureUrl == nil) {
        _dayPictureUrl = [NSString string];
    }
    return _dayPictureUrl;
}

- (PickerView *)pick{

    if (_pick == nil) {
        _pick = [[PickerView alloc]init];
    }
    return _pick;
}

- (UITextField *)textField{

    if (_textField == nil) {
       
        _textField = [[UITextField alloc]init];
        
        self.pick = [[PickerView alloc]init];

        _textField.inputView = self.pick;
        
        
        _textField.inputAccessoryView = self.toolbar;
    
    }
    return _textField;
}


- (UIToolbar *)toolbar {
    
    if (_toolbar == nil) {

        _toolbar = [[UIToolbar alloc] init];

        _toolbar.frame = CGRectMake(0, 0, 0, 44);

        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];

        UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];

        _toolbar.items = @[cancelItem, flexItem, doneItem];
        
    }
    
    return _toolbar;
}
#pragma
#pragma mark -- 取消
- (void)cancel{

    [self endEditing:YES];
}
#pragma
#pragma mark -- 选择城市确定
- (void)done{

    [self endEditing:YES];
    
    self.areaName = self.pick.strName;

    [self loadupdata];

}

@end
