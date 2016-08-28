//
//  FamousViewController.m
//  DoctorCare365
//
//  Created by ss on 16/7/31.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "FamousViewController.h"
#import "DoctorMansearyVController.h"

@interface FamousViewController ()
//按钮
@property (weak, nonatomic) IBOutlet UIButton *bt1;
@property (weak, nonatomic) IBOutlet UIButton *bt2;
@property (weak, nonatomic) IBOutlet UIButton *bt3;
@property (weak, nonatomic) IBOutlet UIButton *bt4;
@property (weak, nonatomic) IBOutlet UIButton *bt5;
@property (weak, nonatomic) IBOutlet UIView *lastView;
//点击第四个按钮时要传输的label上的字符串
@property (weak, nonatomic) IBOutlet UILabel *alredayLabel;
@property (weak, nonatomic) IBOutlet UILabel *okLabel;

//点击第五个按钮时要传输的label上的字符串
@property (weak, nonatomic) IBOutlet UILabel *actionLB;
@property (weak, nonatomic) IBOutlet UILabel *loseLB;

@end

@implementation FamousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBtnBackImage];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    //创建一个右上角的小图片
    CGFloat x = CGRectGetMaxX(self.lastView.frame) - 12;
    
    CGFloat y = self.lastView.frame.origin.y - 10;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 18, 20)];
    
    imageView.image = [UIImage imageNamed:@"黑色星星"];
    
    imageView.layer.cornerRadius = 10;
    
    imageView.clipsToBounds = YES;
    
    [self.view addSubview:imageView];

}

- (void)setBtnBackImage{

    //    设置按钮的背景图片
    [self.bt1 setBackgroundImage:[UIImage imageNamed:@"link_button_02"] forState:UIControlStateNormal];
    
    [self.bt2 setBackgroundImage:[UIImage imageNamed:@"link_button_02"] forState:UIControlStateNormal];
    
    [self.bt3 setBackgroundImage:[UIImage imageNamed:@"link_button_02"] forState:UIControlStateNormal];
    
    [self.bt4 setBackgroundImage:[UIImage imageNamed:@"link_button_02"] forState:UIControlStateNormal];
    
    [self.bt5 setBackgroundImage:[UIImage imageNamed:@"link_button_02"] forState:UIControlStateNormal];
}

//点击按钮的点击事件0 前三个按钮就诊成功，1第四个按钮已就诊，2第五个按钮申请失败
- (IBAction)clickButton:(UIButton *)sender {
    
    DoctorMansearyVController *doctMVC = [[DoctorMansearyVController alloc]init];
    
    switch (sender.tag) {
        case 0:
            doctMVC.firstName = @"申请";
            doctMVC.nextName = @"成功";
            break;
        case 1:
            doctMVC.firstName = self.alredayLabel.text;
            doctMVC.nextName = self.okLabel.text;
            break;
        case 2:
            doctMVC.firstName = self.actionLB.text;
            doctMVC.nextName = self.loseLB.text;
            break;
            
        default:
            break;
    }
    doctMVC.title = @"预约详情";
    
    [self.navigationController pushViewController:doctMVC animated:YES];
}




@end
