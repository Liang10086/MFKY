//
//  RecordTableController.h
//  DoctorCare365
//
//  Created by ss on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordTableController : UITableViewController

@property (nonatomic,strong) NSArray *cellArray;

- (void) dataArray:(NSArray *)dataArray successBlock:(void(^)(NSString *ButtonName,NSInteger tag))successBlock;

- (void) dataArray:(NSArray *)dataArray cellBlock:(void(^)(NSArray *cellArray))cellBlock;

@end
