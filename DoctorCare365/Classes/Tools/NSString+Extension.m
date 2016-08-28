//
//  NSString+Extension.m
//  doctorList
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "NSString+Extension.h"


@implementation NSString (Extension)

-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
