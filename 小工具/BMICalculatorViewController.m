//
//  BMICalculatorViewController.m
//  小工具
//
//  Created by 吴敏轩 on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "BMICalculatorViewController.h"
#import "Masonry/Masonry.h"

#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

@interface BMICalculatorViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel* showResultLab;
@property (nonatomic, strong) UILabel* showWeightLab;
@property (nonatomic, strong) UILabel* showHeightLab;
@property (nonatomic, strong) UILabel* showWUnitLab;
@property (nonatomic, strong) UILabel* showHUnitLab;
@property (nonatomic, strong) UITextField * showWeightTF;
@property (nonatomic, strong) UITextField * showHeightTF;
@property (nonatomic, strong) UIButton * actionBtn;

@end

@implementation BMICalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title = NSLocalizedString(@"BIMCalculate", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
}
-(void)creatUI{
    
    [self.view addSubview:self.showResultLab];
    [self.view addSubview:self.showWeightLab];
    [self.view addSubview:self.showWeightTF];
    [self.view addSubview:self.showHeightLab];
    [self.view addSubview:self.showHeightTF];
    [self.view addSubview:self.showHUnitLab];
    [self.view addSubview:self.showWUnitLab];
    [self.view addSubview:self.actionBtn];
    
    
    [_showResultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(screenWidth - 50);
        make.height.mas_equalTo(80);
    }];
    
    [_showWeightLab sizeToFit];
    [_showWeightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-120);
        make.height.mas_equalTo(60);
    }];
    
    [_showWeightTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showWeightLab.mas_right).offset(5);
        make.width.mas_equalTo(100);
        make.top.height.mas_equalTo(self.showWeightLab);
    }];
    
    [_showWUnitLab sizeToFit];
    [_showWUnitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showWeightTF.mas_right).offset(5);
        make.bottom.mas_equalTo(-120);
        make.height.mas_equalTo(self.showWeightLab);
    }];
    
    [_showHeightLab sizeToFit];
    [_showHeightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-200);
        make.height.mas_equalTo(60);
    }];
    
    [_showHeightTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showHeightLab.mas_right).offset(5);
        make.width.mas_equalTo(100);
        make.top.height.mas_equalTo(self.showHeightLab);
    }];
    
    [_showHUnitLab sizeToFit];
    [_showHUnitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showHeightTF.mas_right).offset(5);
        make.bottom.mas_equalTo(-200);
        make.height.mas_equalTo(self.showHeightLab);
    }];
    
    
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(100);
        make.bottom.mas_equalTo(0);
    }];
    
}
#pragma mark onViewClick
-(void)onViewClick:(id)sender{
   
    float result = self.showWeightTF.text.floatValue/((self.showHeightTF.text.floatValue/100)*(self.showHeightTF.text.floatValue/100));
    NSString *resultString;
    if (result<18.5) {
        resultString = NSLocalizedString(@"lean", nil);
    }else if (result>=18.5 &&result<23.9){
        resultString = NSLocalizedString(@"normal", nil);
    }else if (result>=23.9 &&result<26.9){
        resultString = NSLocalizedString(@"chubby", nil);
    }
    else if (result>=26.9 &&result<29.9){
        resultString = NSLocalizedString(@"obesity", nil);
    }
    else if (result>=29.9){
        resultString = NSLocalizedString(@"Severe obesity", nil);
    }
    self.showResultLab.text = [NSString stringWithFormat:@"%@：%f，%@",NSLocalizedString(@"result", nil),result,resultString];
    
}
#pragma mark getter

-(UILabel *)showResultLab{
    
    if (!_showResultLab) {
        _showResultLab = [[UILabel alloc]init];
        _showResultLab.textColor = [UIColor blackColor];
        _showResultLab.numberOfLines = 0;
    }
    return _showResultLab;
}
-(UILabel *)showWeightLab{
    
    if (!_showWeightLab) {
        _showWeightLab = [[UILabel alloc]init];
        _showWeightLab.text = NSLocalizedString(@"weight", nil);
        _showWeightLab.textColor = [UIColor blackColor];
    }
    return _showWeightLab;
}
-(UILabel *)showHeightLab{
    
    if (!_showHeightLab) {
        _showHeightLab = [[UILabel alloc]init];
        _showHeightLab.text = NSLocalizedString(@"height", nil);
        _showHeightLab.textColor = [UIColor blackColor];
    }
    return _showHeightLab;
}

-(UILabel *)showWUnitLab{

    if (!_showWUnitLab) {
        _showWUnitLab = [[UILabel alloc]init];
        _showWUnitLab.text = @"kg";
        _showWUnitLab.textColor = [UIColor blackColor];
    }
    return _showWUnitLab;
}
-(UILabel *)showHUnitLab{
    
    if (!_showHUnitLab) {
        _showHUnitLab = [[UILabel alloc]init];
        _showHUnitLab.text = @"cm";
        _showHUnitLab.textColor = [UIColor blackColor];
    }
    return _showHUnitLab;
}
-(UITextField *)showWeightTF{
    if (!_showWeightTF) {
        _showWeightTF = [[UITextField alloc]init];
        _showWeightTF.text = @"60";
        _showWeightTF.textAlignment = NSTextAlignmentCenter;
        _showWeightTF.textColor = [UIColor blackColor];
        _showWeightTF.layer.borderColor = [UIColor blackColor].CGColor;
        _showWeightTF.layer.borderWidth = 1;
        _showWeightTF.delegate = self;
    }
    return _showWeightTF;
}
-(UITextField *)showHeightTF{
    if (!_showHeightTF) {
        _showHeightTF = [[UITextField alloc]init];
        _showHeightTF.text = @"170";
        _showHeightTF.textAlignment = NSTextAlignmentCenter;
        _showHeightTF.textColor = [UIColor blackColor];
        _showHeightTF.layer.borderColor = [UIColor blackColor].CGColor;
        _showHeightTF.layer.borderWidth = 1;
        _showHeightTF.delegate = self;
    }
    return _showHeightTF;
}
-(UIButton *)actionBtn{
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn.backgroundColor = [UIColor colorWithRed:237.0/255 green:80.0/255 blue:86.0/255 alpha:1];
        [_actionBtn setTitle:NSLocalizedString(@"Action", nil) forState:UIControlStateNormal];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _actionBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_actionBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
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
