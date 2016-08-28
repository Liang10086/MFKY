//
//  PickerView.m
//  DoctorCare365
//
//  Created by 王明亮 on 16/7/28.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "PickerView.h"
#import "ProvincesModel.h"

@interface PickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic)PickerView *pickerView;

@property (strong, nonatomic)NSArray *array;

@property (assign, nonatomic)NSInteger index;

@end

@implementation PickerView

//懒加载
- (NSArray *)array{

    if (_array == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            
            ProvincesModel *pro = [ProvincesModel provinceWithDict:dict];
            
            [arrM addObject:pro];
            
        }
        _array = arrM;
    }
    return _array;
}
- (void)drawRect:(CGRect)rect {
    self.delegate = self;
    self.dataSource = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    if (component == 0) {
        return self.array.count;
    }else{
        ProvincesModel *pro = self.array[self.index];
        
        NSArray *arr = pro.cities;
        
        return arr.count;
    }
   
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    if (component == 0) {
        ProvincesModel *pro = self.array[row];
        
        NSString *Name = pro.name;
   
        return Name;
    }else{
        
        ProvincesModel *pro = self.array[self.index];
        
        NSArray *arr = pro.cities;
  
        return arr[row];
    }

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if (component == 0) {
        self.index = row;
        
        ProvincesModel *pro = self.array[row];
        
        NSArray *arr = pro.cities;
        
        NSString *Name = arr[0];
        
        self.strName = Name;
        
        [pickerView reloadComponent:1];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
        
    }else{
    
        ProvincesModel *pro = self.array[self.index];
        
        NSArray *arr = pro.cities;
        
        NSString *str = arr[row];
        
        self.strName = str;
    
    }

}


@end
