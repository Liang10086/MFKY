//
//  DoctorInfoCell.m
//  doctorList
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorInfoCell.h"
#import "HexColors.h"
#import <Masonry.h>
#import "AFNetworking.h"
#import "HospitalPriceButton.h"
#import "WeekTableCollectionViewController.h"
#import "TestLayout.h"


#define leftButtonClick 0
#define rightButtonClick 1

@interface DoctorInfoCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak,nonatomic)UILabel *titleLabel;

@property (weak,nonatomic) UIView *firstView;

@property (weak,nonatomic) UIImageView *secondView;

@property (weak,nonatomic) UIView *lastView;

@property (strong,nonatomic) NSArray *dataArray;

@property (strong,nonatomic) WeekTableCollectionViewController *coVC;

@property (weak,nonatomic) UIView *weekView;

@property (weak,nonatomic) UILabel *weekLabel;

@property (weak,nonatomic) UICollectionView *baseWeekView;

@end

@implementation DoctorInfoCell{

    CGFloat _screenWidth;
    
    CGFloat _screenHeigh;
    
    NSInteger num;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:NO animated:NO];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {

    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        _screenHeigh = [UIScreen mainScreen].bounds.size.height;
        
        num = 0;
        
    }
    
    
    return self;

}




- (void)setupContentViewCondition {
    
    UIView *lastView =[[UIView alloc]init];
    
    _lastView = lastView;
    
    lastView.backgroundColor = [UIColor whiteColor];
    
    
    [self.contentView addSubview:lastView];
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.mas_equalTo(self.contentView);
        
        make.left.mas_equalTo(self.contentView).mas_equalTo(0);
        
        make.right.mas_equalTo(self.contentView).mas_equalTo(0);
        
    }];
    
    UILabel *workHostpitalLabel = [[UILabel alloc]init];
    
    workHostpitalLabel.text = @"坐诊医院";
    
    workHostpitalLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"2B2B2B"];
    
    [lastView addSubview:workHostpitalLabel];
    
    [workHostpitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.mas_equalTo(lastView).mas_offset(12);
        
    }];
    
    UILabel *workHospitalSubLabel = [[UILabel alloc]init];
    
    workHospitalSubLabel.text = @"(可提前3周预约,每日8:00更新号源)";
    
    workHospitalSubLabel.font = [UIFont systemFontOfSize:12];
    
    workHospitalSubLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"CCCCCC"];
    
    [lastView addSubview:workHospitalSubLabel];
    
    [workHospitalSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(workHostpitalLabel.mas_right).mas_offset(10);
        
        make.bottom.mas_equalTo(workHostpitalLabel.mas_bottom);
        
        
    }];
    
    UIButton *tempHospitalButton;
    
    for (NSInteger i = 0; i < 3; i ++) {
        
        
        HospitalPriceButton *hospitalButton = [[HospitalPriceButton alloc]init];
        
        [lastView addSubview:hospitalButton];
        
        switch (i) {
            case 0:
                [hospitalButton setTitle:@"北京协和医院" forState:UIControlStateNormal];
                
                [hospitalButton setImage:[UIImage imageNamed:@"xh"] forState:UIControlStateNormal];
                
                break;
                
            case 1:
                
                [hospitalButton setTitle:@"北京积水潭医院" forState:UIControlStateNormal];
                
                [hospitalButton setImage:[UIImage imageNamed:@"pic6"] forState:UIControlStateNormal];
                
                break;
                
            case 2:
                
                [hospitalButton setImage:[UIImage imageNamed:@"yiyuan"] forState:UIControlStateNormal];
                
                [hospitalButton setTitle:@"回龙观小区门诊" forState:UIControlStateNormal];
                
                tempHospitalButton = hospitalButton;
                
                break;
                
            default:
                break;
        }
        
        
    
        [hospitalButton setTitleColor:[HXColor hx_colorWithHexRGBAString:@"666666"] forState:UIControlStateNormal];
        
        [hospitalButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(workHostpitalLabel.mas_bottom).mas_offset(i *30);
            
            make.leading.mas_equalTo(workHostpitalLabel);
            
        }];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        
        priceLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"999999"];
        
        priceLabel.text = @"￥7.00";
        
        [lastView addSubview:priceLabel];
        
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(lastView).mas_offset(-12);
            
            make.centerY.mas_equalTo(hospitalButton);
            
        }];
    }
    
    UIView *weekView = [[UIView alloc] init];
    
    _weekView = weekView;
    
    weekView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"EBFAF9"];
    
    [lastView addSubview:weekView];
    
    [weekView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(tempHospitalButton.mas_bottom).mas_offset(12);
        
        make.left.right.mas_equalTo(lastView);
        
        make.height.mas_equalTo(35);
        
        
    }];
    
    
    [weekView layoutIfNeeded];
    
    UILabel *weekLabel = [[UILabel alloc]init];
    
    _weekLabel = weekLabel;
    
    weekLabel.text = @"本周";
    
    weekLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"20C6C6"];
    
    weekLabel.font = [UIFont systemFontOfSize:14];
    
    [weekView addSubview:weekLabel];
    
    [weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.mas_equalTo(weekView);
        
    }];
    
    

    
    UIButton *leftButton = [[UIButton alloc]init];
    
    [leftButton setImage:[UIImage imageNamed:@"pic7"] forState:UIControlStateNormal];
    
    [leftButton addTarget:self action:@selector(nextWeek:) forControlEvents:UIControlEventTouchUpInside];
    
    leftButton.tag = leftButtonClick;
    
//    leftButton.transform = CGAffineTransformMakeRotation(90);
    
    [weekView addSubview:leftButton];
    
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(weekView);
        
        make.right.mas_equalTo(weekLabel.mas_left).mas_offset(-28);
        
        
    }];
    
    
    UIButton *rightButton = [[UIButton alloc]init];
    
    [rightButton setImage:[UIImage imageNamed:@"illness_button_input_blue.png"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(nextWeek:) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton.tag = rightButtonClick;
    
    [weekView addSubview:rightButton];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(weekView);
        
        make.left.mas_equalTo(weekLabel.mas_right).mas_offset(28);
        
        
    }];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
//
    layout.minimumInteritemSpacing = 0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
        UITableView *tableView =(UITableView *)[self superview];
    
        UITableViewController *tVc = (UITableViewController *)[self findViewController:tableView];
    
    
    
    layout.itemSize = CGSizeMake(_screenWidth,_screenHeigh -tVc.tableView.tableHeaderView.bounds.size.height - CGRectGetMaxY(weekView.frame) - 0.5);
    
    UICollectionView *baseWeekView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    
    _baseWeekView = baseWeekView;
    
    baseWeekView.showsHorizontalScrollIndicator = NO;
    
    baseWeekView.bounces = NO;
    
    baseWeekView.pagingEnabled = YES;
    
    
    [lastView addSubview:baseWeekView];
    
    baseWeekView.delegate = self;
    
    baseWeekView.dataSource = self;
    
    [baseWeekView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [baseWeekView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(weekView.mas_bottom).mas_offset(0.5);
        
        make.bottom.mas_equalTo(lastView);
        
//        make.left.mas_equalTo(lastView).mas_offset(-_screenWidth / 25);
        
        make.left.mas_equalTo(lastView);
        
        make.right.mas_equalTo(lastView);
        
    }];
    
    
    
    
    
    
    
   
//    TestLayout *flowLayout = [[TestLayout alloc]init];
//    
//    UITableView *tableView =(UITableView *)[self superview];
//    
//    UITableViewController *tVc = (UITableViewController *)[self findViewController:tableView];
//    
////    flowLayout.itemSize = CGSizeMake((_screenWidth+_screenWidth / 25) / 8,_screenWidth / 8 *  1.57);
//    
//    flowLayout.itemSize = CGSizeMake((_screenWidth + _screenWidth / 25)/8, (_screenHeigh -tVc.tableView.tableHeaderView.bounds.size.height - CGRectGetMaxY(weekView.frame)) / 3.5);
//    
//    _coVC  = [[WeekTableCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
//
//    
//    _coVC.collectionView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"cccccc"];
//    
//    _coVC.collectionView.backgroundColor = [UIColor whiteColor];
//    
//    _coVC.collectionView.userInteractionEnabled = YES;
//    
//    [lastView addSubview:_coVC.collectionView];
//    
//    [_coVC.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.mas_equalTo(weekView.mas_bottom).mas_offset(0.5);
//        
//        make.bottom.mas_equalTo(lastView);
//        
//        make.left.mas_equalTo(lastView).mas_offset(-_screenWidth / 25);
//        
//        make.right.mas_equalTo(lastView);
//        
//    }];
//    
//    [self layoutIfNeeded];

    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    
    _secondView = imageView;
    
    imageView.contentMode = UIViewContentModeRedraw;
    
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.right.mas_equalTo(self.contentView);
        
    }];
    
    imageView.image = [UIImage imageNamed:@"pic5"];
    
    
    UIView *view = [[UIView alloc]init];
    
    _firstView = view;
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.right.mas_equalTo(self.contentView);
        
    }];
    
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    
    titleLabel.textColor = [HXColor hx_colorWithHexRGBAString:@"333333"];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.font = [UIFont systemFontOfSize:17];
    
    titleLabel.text = @"接诊条件：";
    
    [view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(self.contentView).mas_offset(12);
        
        
    }];
    
    for (NSInteger i = 0; i < _dataArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]init];
        
        label.textColor = [HXColor hx_colorWithHexRGBAString:@"666666"];
        
        label.font = [UIFont systemFontOfSize:15];
        
        label.text = self.dataArray[i];
        
        [view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(view).mas_offset(12);
            
            make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(i * (10+13) + 18);
            
        }];
        
        [label layoutIfNeeded];
        

    }

    
}


- (void)setModel:(DoctorModel *)model {
    
    _model = model;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"doctor_id":@(300000315)};
    
    
    [manager POST:@"http://iosapi.itcast.cn/doctor/doctorReceivingSetting.json.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        
        id insertDict = dict[@"data"];
        
        if ([insertDict isEqual:[NSNull null]]) {
            
            return;
        }
        
        _dataArray = insertDict[@"receiving_settings"];
        
       
        [self setupContentViewCondition];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];


}

- (void)setupContentViewDoctorInfo {

    
}

- (void)showViewWith:(NSInteger)tag {
    
    switch (tag) {
            
        case 0:
            
            [self.contentView bringSubviewToFront:_firstView];
            
            break;
         case 1:
            
            [self.contentView bringSubviewToFront:_secondView];
            
            break;
            
         case 2:
            
            [self.contentView bringSubviewToFront:_lastView];
            
            break;
            
        default:
            break;
    }

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

- (void)nextWeek:(UIButton *)sender {
    
    if (sender.tag == leftButtonClick) {
        
        
        
        if (num >= 1) {
            
            num --;
            
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:num inSection:0];
            
            
            [_baseWeekView scrollToItemAtIndexPath:indPath atScrollPosition:0 animated:YES];
            
            
        }else{
        
            if (num == 0) {
                
                num = 0;
                
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:num inSection:0];
                
            [_baseWeekView scrollToItemAtIndexPath:indPath atScrollPosition:0 animated:YES];
                
            }
           
        }
        
       
        
    }else if (sender.tag == rightButtonClick){
        
        
        if (num < 3) {
        
            num++;
            
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:num inSection:0];
            
            [_baseWeekView scrollToItemAtIndexPath:indPath atScrollPosition:0 animated:YES];
            
        }
        
       
    }
    
    switch (num) {
        case 0:
            _weekLabel.text= @"本周";
            break;
        case 1:
            _weekLabel.text = @"第二周";
            break;
        case 2:
            _weekLabel.text = @"第三周";
            break;
        case 3:
            _weekLabel.text = @"第四周";
            break;
    
            
        default:
            break;
    }
    

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    
//    NSArray *array = [cell.contentView subviews];
    
    
        TestLayout *flowLayout = [[TestLayout alloc]init];
    
        UITableView *tableView =(UITableView *)[self superview];
    
        UITableViewController *tVc = (UITableViewController *)[self findViewController:tableView];
        flowLayout.itemSize = CGSizeMake((_screenWidth + _screenWidth / 25)/8, (_screenHeigh -tVc.tableView.tableHeaderView.bounds.size.height - CGRectGetMaxY(_weekView.frame)) / 3.45);
    

    
     WeekTableCollectionViewController * covc  = [[WeekTableCollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    
    covc.location = indexPath.item;
    
//    num = indexPath.item;
    
    [tVc addChildViewController:covc];
    
    
        covc.collectionView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"cccccc"];
    
        covc.collectionView.backgroundColor = [UIColor whiteColor];
    
        covc.collectionView.userInteractionEnabled = YES;
    
        [cell.contentView addSubview:covc.collectionView];
    
        [covc.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.top.mas_equalTo(cell.contentView.mas_top).mas_offset(0);
    
            make.bottom.mas_equalTo(cell.contentView);
    
            make.left.mas_equalTo(cell.contentView).mas_offset(-_screenWidth / 25);
            
            make.right.mas_equalTo(cell.contentView);
            
        }];
    
    
    
    
    cell.contentView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"cccccc" alpha:0.8];
    
    
    return cell;
    
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    num = scrollView.contentOffset.x / _screenWidth;

    switch (num) {
        case 0:
            _weekLabel.text= @"本周";
            break;
        case 1:
            _weekLabel.text = @"第二周";
            break;
        case 2:
            _weekLabel.text = @"第三周";
            break;
        case 3:
            _weekLabel.text = @"第四周";
            break;
            
            
        default:
            break;
    }
    
}
    





@end
