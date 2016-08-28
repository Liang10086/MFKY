//
//  DiseaseViewController.m
//  DoctorCare365
//
//  Created by ss on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DiseaseViewController.h"
/**数据模型类*/
#import "JSONModel.h"
#import "RecordTableController.h"
#import "ComModel.h"
#import "RecordTableCell.h"
#import "WebViewController.h"

//#import "DoctorModel.h"

#import "DoctorNumModel.h"
#import "DoctorTableViewController.h"


@interface DiseaseViewController ()<UITableViewDelegate,UITableViewDataSource>

//创建第一个按钮的接受数据数组
@property (nonatomic,strong) NSArray *DataArray;

//创建第二个按钮的接受数据数组
@property (nonatomic,strong) NSArray *complArray;

//创建头部文本框
@property (weak, nonatomic) IBOutlet UILabel *headLabel;

//疾病按钮
@property (weak, nonatomic) IBOutlet UIButton *illnessButton;

//并发症按钮
@property (weak, nonatomic) IBOutlet UIButton *complication;

//医生数量按钮
@property (weak, nonatomic) IBOutlet UIButton *doctorNumButton;

//已确诊
@property (weak, nonatomic) IBOutlet UIButton *endBtn;

//症状疑似
@property (weak, nonatomic) IBOutlet UIButton *elseBtn;

//接受按钮
@property (weak, nonatomic) IBOutlet UIButton *resiveBtn;

//不接受按钮
@property (weak, nonatomic) IBOutlet UIButton *noResiveBtn;

//选择治疗方式view
@property (weak, nonatomic) IBOutlet UIView *changeWayView;

//创建一个Bool属性，进行判断接受治疗的方式
@property (nonatomic,assign) BOOL resive;

//点击接受治疗后创建一个uitablView
@property (nonatomic,strong) UITableView *tabVew;

//创建一个数组，用来接受plist文件
@property (nonatomic,strong) NSArray *doctorArray;

//选择方式的label
@property (weak, nonatomic) IBOutlet UILabel *changeLabel;

/**就业医生label*/
@property (weak, nonatomic) IBOutlet UILabel *doctorNumLabel;

//申请按钮
@property (weak, nonatomic) IBOutlet UIButton *applyBtn;
//最下边小箭头按钮
@property (weak, nonatomic) IBOutlet UIButton *littleBtn;
//创建bool值
@property (nonatomic,assign) BOOL userBl;
//创建RecordCell对象
@property (nonatomic,strong) RecordTableController *RecordCell;

@end

@implementation DiseaseViewController

//懒加载
- (NSArray *)complArray{
    
    if (_complArray == nil) {
        
        _complArray = [NSArray array];
    }
    return _complArray;
}

- (NSArray *)DataArray{
    
    if (_DataArray == nil) {
        
        _DataArray = [NSArray array];
    }
    return _DataArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //    加载xib
    [[[NSBundle mainBundle] loadNibNamed:@"DisChange" owner:self options:nil]lastObject];
    //    给左侧导航控制器设置按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"用户须知" style:UIBarButtonItemStyleDone target:self action:@selector(userKnow)];
    
    self.changeWayView.hidden = YES;
    
    self.doctorNumButton.userInteractionEnabled = NO;
    
    [self.tabVew registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tabCell"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickResule)];
    
}
- (void)userKnow{
    WebViewController *web = [[WebViewController alloc] init];
    web.title = @"用户须知";
    web.linkURL = [[NSBundle mainBundle] pathForResource:@"user_protolo" ofType:@"html"];
    [self.navigationController pushViewController:web animated:YES];
}

- (void)clickResule{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//点击疾病按钮
- (IBAction)btnClick:(UIButton *)sender {
    
    self.userBl = YES;
    
    self.applyBtn.userInteractionEnabled = YES;
    
    sender.userInteractionEnabled = YES;
    
    self.DataArray = nil;
    
    //    通过传递进来的tag值进行json解析，解析为一个数组
    NSDictionary *dict = @{@"page":@1,@"page_size":@15,@"ci1_id":@(self.tag),@"keyword":@""};
    
    NSString *urlstr = @"doctor/searchCI3List.json.php";
    
    [JSONModel JSONModelwithUrlstr:urlstr withDict:dict successBlock:^(NSArray *array) {
        
        //        在主线程中等待数据的返回，返回数据后才开始进行传递，否则数据会传空
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            self.DataArray = array;
            
            //        创建对象
            RecordTableController *recordVC = [[RecordTableController alloc]init];
            
            recordVC.title = self.headName;
            
            //        回传说点击cell的变量名
            [recordVC dataArray:self.DataArray successBlock:^(NSString *ButtonName,NSInteger tag) {
                
                //                self.illnessButton.titleLabel.textColor = [UIColor blackColor];
                
                [self.illnessButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [self.illnessButton setTitle:ButtonName forState:UIControlStateNormal];
                
                sender.userInteractionEnabled = YES;
            }];
            
            //         发送医生数量请求
            NSString *url = @"doctor/matchedDoctorCount.json.php";
            
            NSDictionary *dic = @{@"ci1_id":@1,@"ci2_id":@3,@"ci3_id":@3,@"diagnosis_type":@0,@"is_confirmed":@1,@"user_id":@1000089, @"has_diagnosis":@2};
            
            [DoctorNumModel JSONModelwithUrlstr:url withDict:dic successBlock:^(DoctorNumModel *model) {
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    
                    self.doctorNumLabel.text = [NSString stringWithFormat:@"就诊医生为%@位",model.doctor_count];
                    
                }];
                
            } errorBlock:^(NSError *error) {
                NSLog(@"%@",error);
                
            }];
            
            [self.navigationController pushViewController:recordVC animated:YES];
            
        }];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

//点击疾病分类按钮的点击事件
- (IBAction)clickComplicationButton:(UIButton *)sender {
    
    if ([self.illnessButton.currentTitle isEqualToString:@"请选择疾病细分"]) {
        
        //    跳出弹窗
        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择疾病" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alter1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alter addAction:alter1];
        
        [self presentViewController:alter animated:YES completion:nil];
        
        return;
    }
    
    //        控制器进行跳转
    //        因为网络接口有问题，所以发送一个有数据的参数是固定的
    NSString *urlstr = @"doctor/complicationList.json.php";
    
    NSDictionary *dict = @{@"page":@1,@"page_size":@15,@"ci2_id":@3};
    
    [ComModel JSONModelwithUrlstr:urlstr withDict:dict successBlock:^(NSArray *array) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            self.complArray = array;
            
            RecordTableController *recordVC = [[RecordTableController alloc]init];
            
            recordVC.title = self.headName;
            
            self.RecordCell = recordVC;
            //点击第二个按钮会调用这个方法，将解析后的数据传入到tableView中，然后进行数据的回传，因为以后可能会用到所点击的cell的值，所以直接将这个cell传递回来，以便以后使用
            [recordVC dataArray:self.complArray cellBlock:^(NSArray *cellArray) {
                
                NSMutableString *strM = [NSMutableString string];
                
                self.complication.titleLabel.textColor = [UIColor blackColor];
                
                for (ComModel *model in cellArray) {
                    if (model != cellArray.lastObject) {
                        
                        [strM appendString:model.complication_name];
                        
                        [strM appendString:@"+"];
                    }
                    [strM appendString:model.complication_name];
                }
                
                [self.complication setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                [self.complication setTitle:strM forState:UIControlStateNormal];
                
            }];
            //                跳转控制器
            [self.navigationController pushViewController:recordVC animated:YES];
            
        }];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

//点击确诊不确诊按钮
- (IBAction)clickEndButton:(UIButton *)sender {
    
    switch (sender.tag) {
            //            点击确诊按钮，使确诊按钮为高亮状态，症状疑似为常亮状态
        case 5:
            [self clickButton:sender];
            
            [self.elseBtn setImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
            
            break;
        case 6:
            [self clickButton:sender];
            
            [self.endBtn setImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
            
            break;
            
        default:
            break;
    }
}

//点击是否接受按钮
- (IBAction)clickReceiveButton:(UIButton *)sender {
    switch (sender.tag) {
            //     点击确诊按钮，使确诊按钮为高亮状态，症状疑似为常亮状态
        case 7:
            [self clickButton:sender];
            
            [self.noResiveBtn setImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
            
            //使选择治疗方式界面不隐藏
            self.changeWayView.hidden = NO;
            self.applyBtn.enabled = YES;
            
            break;
        case 8:
            [self clickButton:sender];
            
            [self.resiveBtn setImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
            
            self.changeWayView.hidden = YES;
            self.tabVew.hidden = YES;
            self.applyBtn.enabled = YES;
            
            break;
            
        default:
            break;
    }
}
//点击按钮触发的事件
- (void)clickButton:(UIButton *)btn{
    
    [btn setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateNormal];
    
}

//选择治疗方式按钮,点击按钮后创建一个UITableView，设置代理，数据源代理，点击后使这个界面不能够与用户进行交互，只有点击cell后才可以与用户进行交互，这样可以防止客户多次点击view，使界面产生一些错误
- (IBAction)clickChangeWayBtn:(id)sender {
    
    CGSize tabSize = self.changeWayView.frame.size;
    
    CGFloat y = CGRectGetMaxY(self.changeWayView.frame);
    
    CGFloat x = self.changeWayView.frame.origin.x;
    
    UITableView *tabView = [[UITableView alloc]initWithFrame:CGRectMake(x, y, tabSize.width - self.littleBtn.frame.size.width, 100)];
    
    tabView.delegate = self;
    tabView.dataSource = self;
    
    tabView.tableFooterView = [[UIView alloc]init];
    
    self.tabVew = tabView;
    
    [self.view addSubview:tabView];
    
    self.changeWayView.userInteractionEnabled = NO;
    
}

///实现tabView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.doctorArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tabCell"];
    }
    
    NSString *str = self.doctorArray[indexPath.row];
    
    cell.textLabel.text = str;
    
    return cell;
}
//点击tabView的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = self.doctorArray[indexPath.row];
    
    [self.changeLabel setTextColor:[UIColor blackColor]];
    
    self.changeLabel.text = str;
    
    self.tabVew.hidden = YES;
    
    self.changeWayView.userInteractionEnabled = YES;
    
}
///点击就诊申请按钮
- (IBAction)clickActionBtn:(id)sender {
    
    if ([self.illnessButton.currentTitle isEqualToString:@"请选择疾病细分"]) {
        //            跳出弹窗
        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"请先选择疾病" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alter1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alter addAction:alter1];
        
        [self presentViewController:alter animated:YES completion:nil];
        
    }else {
        
        DoctorTableViewController *docVC = [[DoctorTableViewController alloc]init];
        
        docVC.navigationItem.title = @"医生列表";
        
        [self.navigationController pushViewController:docVC animated:YES];
        
    }
    
}

/**赖方法加载*/
- (NSArray *)doctorArray{
    
    if (_doctorArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"doctorResive.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSString *str in array) {
            
            [arrayM addObject:str];
        }
        _doctorArray = arrayM.copy;
    }
    return _doctorArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重写tag的set方法
- (void)setTag:(NSInteger)tag{
    _tag = tag;
    }

//重写headName方法
- (void)setHeadName:(NSString *)headName{
    _headName = headName;
}

//重写setFream方法
- (void)setFrame:(CGRect)frame
{
    //更新xib的fream
    frame.origin.y = [UIApplication sharedApplication].keyWindow.bounds.origin.y;
    frame.size.height = [UIApplication sharedApplication].keyWindow.bounds.size.height - 64;
}
//拼接头部Label文字
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    拼接字符串，赋值给头部的label
    NSString *headTitle = [NSString stringWithFormat:@"%@疾病",self.headName];
    self.headLabel.text = headTitle;
    
}

@end
