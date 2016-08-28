//
//  TestLayout.m
//  doctorList
//
//  Created by ios on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "TestLayout.h"

@implementation TestLayout


- (void)prepareLayout
{
    [super prepareLayout];
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    
    
 
    
}


- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    for(int i = 1; i < [attributes count]; ++i) {
        //当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        
        //上一个attributes
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        
        //我们想设置的最大间距，可根据需要改
        NSInteger maximumSpacing = 0;
        
        //前一个cell的最右边
        CGFloat origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        
        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
       static CGFloat rowY ;
        
        if (i == 1) {
            
            rowY = prevLayoutAttributes.frame.origin.y;
        }
        

        
        if (currentLayoutAttributes.frame.origin.y > prevLayoutAttributes.center.y) {
            
            rowY = CGRectGetMaxY(prevLayoutAttributes.frame);
            
            
            }
        
        CGRect f = currentLayoutAttributes.frame;
        
        f.origin.y = rowY;
        
        
        
        
        if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width <= self.collectionViewContentSize.width) {
            
            f.origin.x = origin + maximumSpacing;
            
           
            
        }
        
         currentLayoutAttributes.frame = f;
        
 
    }
    
    return attributes;
}


@end
