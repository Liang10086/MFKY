//
//  DiseasesModel.h
//  DoctorCare365
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiseasesModel : NSObject

@property (copy , nonatomic)NSString *diseasesName;


+(NSArray *)diseases;

@end
