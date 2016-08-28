//
//  WeekCollectionCell.h
//  doctorList
//
//  Created by ios on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekCollectionCell : UICollectionViewCell

- (void)addContentWithRow:(NSInteger)row;

- (void)addTimePartWithStr:(NSString *)str;

- (void)addNumberStateButtonWithDict:(NSDictionary *)dict ;

@end
