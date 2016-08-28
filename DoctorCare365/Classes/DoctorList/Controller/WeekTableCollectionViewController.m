//
//  WeekTableCollectionViewController.m
//  doctorList
//
//  Created by ios on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "WeekTableCollectionViewController.h"
#import "WeekCollectionCell.h"
#import "HexColors.h"


@interface WeekTableCollectionViewController ()

@property (strong,nonatomic)NSArray *dataArray;

@end

@implementation WeekTableCollectionViewController
{

    CGFloat _screenWidth;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self.collectionView registerClass:[WeekCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    
//    self.collectionView.contentMode = UIViewContentModeCenter;
//    self.collectionView.contentOffset = CGPointMake(-10, 0);
    
    NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"DoctorTime%ld.plist",_location] ofType:nil];
    
    _dataArray = [NSArray arrayWithContentsOfFile:path];
 
    
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    

    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
  WeekCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSArray *array = [cell.contentView subviews];
    
    [array makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    NSArray *timePart= @[@"上午",@"下午",@"晚上"];
    
    if (indexPath.item == 0) {
        
        cell.userInteractionEnabled = NO;
        
        if (indexPath.section == 0) {
            
        cell.contentView.backgroundColor = [HXColor hx_colorWithHexRGBAString:@"E6F9F8"];
            
            CGRect tempFrame = cell.contentView.frame;
            
            tempFrame.origin.y = -2;
            
            cell.contentView.frame = tempFrame;
            
            cell.layer.borderWidth  = 1;
            
        }else {
            
            [cell addTimePartWithStr:timePart[indexPath.section - 1]];
            
             cell.layer.borderWidth  = 0.6;
        
        }
        
    }else {
        
        if (indexPath.section == 0) {
            
            cell.userInteractionEnabled = NO;
            
               [cell addContentWithRow:indexPath.row + _location * 7];
            
                cell.contentMode = UIViewContentModeBottom;
            
                cell.layer.borderWidth  = 1;
            
        }else {
            
            
            cell.userInteractionEnabled = YES;
            
            cell.layer.borderWidth  = 0.6;
            
          NSInteger index = (indexPath.section -1) * 7 + indexPath.item;
        
            NSDictionary *dict = _dataArray[index];
            
            [cell addNumberStateButtonWithDict:dict];
        
        }
    
        
}
    
    
    cell.userInteractionEnabled = YES;
    
    cell.layer.borderColor = [HXColor hx_colorWithHexRGBAString:@"cccccc" alpha:0.8].CGColor;
    cell.layer.borderWidth  = 1;

    
        return cell;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 8;

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 4;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = [self dataWith:indexPath.item  + ( _location * 7 )];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"你选择%@,%@",array[0],array[1]] preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [alertVC addAction:actionOk];
    
    [alertVC addAction:actionCancel];
    
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];
    
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     UICollectionViewFlowLayout *fLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
    
    if (indexPath.section == 0) {
        
        CGSize fl = fLayout.itemSize;
        
        fl.height = fLayout.itemSize.height / 1.9;
        
        return fl;
        
        
    }else {
    
      return fLayout.itemSize;
    }
    
   
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
