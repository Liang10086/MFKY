//
//  DoctorMansearyVController.m
//  DoctorCare365
//
//  Created by ss on 16/8/1.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DoctorMansearyVController.h"

@interface DoctorMansearyVController ()
@property (weak, nonatomic) IBOutlet UILabel *firstLB;

@property (weak, nonatomic) IBOutlet UILabel *nextLB;

@property (weak, nonatomic) IBOutlet UIButton *loseBtn;

@end

@implementation DoctorMansearyVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[NSBundle mainBundle] loadNibNamed:@"BookingdetailsCell" owner:self options:nil]lastObject];
    
    if ([self.firstName isEqualToString:@"已经"]) {
        
        self.firstLB.textColor = [UIColor darkGrayColor];
        
        self.nextLB.textColor = [UIColor darkGrayColor];
        
        [self.loseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.loseBtn setBackgroundImage:[UIImage imageNamed:@"u124_line"] forState:UIControlStateNormal];
        
        self.loseBtn.userInteractionEnabled = NO;
        
    }else if ([self.nextName isEqualToString:@"失败"]) {
    
        self.firstLB.textColor = [UIColor blackColor];
        
        self.nextLB.textColor = [UIColor blackColor];
        
        [self.loseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.loseBtn setBackgroundImage:[UIImage imageNamed:@"u124_line"] forState:UIControlStateNormal];
        
        self.loseBtn.userInteractionEnabled = NO;
    
    }
    
    self.firstLB.text = self.firstName;

    self.nextLB.text = self.nextName;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回到首页" style:UIBarButtonItemStylePlain target:self action:@selector(backToHomeVC)];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)backToHomeVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)clickBTN:(UIButton *)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://10086"]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFirstName:(NSString *)firstName{

    _firstName = firstName;
    

}
//
- (void)setNextName:(NSString *)nextName{
    
    _nextName = nextName;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
