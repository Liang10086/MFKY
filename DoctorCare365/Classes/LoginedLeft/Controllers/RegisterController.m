//
//  RegisterController.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()<UICollectionViewDataSource>

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(clickButton)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    CGFloat W = self.view.frame.size.width - 30;
    
    //每一个格子的大小
    layout.itemSize = CGSizeMake(W, 60);
    layout.headerReferenceSize = CGSizeMake(0, 10);
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionView];
    
        collectionView.dataSource = self;
    
    [collectionView registerNib:[UINib nibWithNibName:@"RegisterViews" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
}

- (void)clickButton{
    [self.navigationController popViewControllerAnimated:YES];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}


@end
