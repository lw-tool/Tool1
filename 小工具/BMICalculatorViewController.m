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
@property (nonatomic, strong) UIButton * sureBtn;
@property (nonatomic, strong) UIView* showResultView;
@property (nonatomic, strong) UILabel* showResultTitle;
@property (nonatomic, strong) UIView* showBgView;

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
    
    [self.view addSubview:self.showWeightLab];
    [self.view addSubview:self.showWeightTF];
    [self.view addSubview:self.showHeightLab];
    [self.view addSubview:self.showHeightTF];
    [self.view addSubview:self.showHUnitLab];
    [self.view addSubview:self.showWUnitLab];
    [self.view addSubview:self.actionBtn];
    [self.view addSubview:self.showBgView];
    [self.view addSubview:self.showResultView];
    [self.showResultView addSubview:self.showResultTitle];
    [self.showResultView addSubview:self.showResultLab];
    [self.showResultView addSubview:self.sureBtn];
    
    [_showBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(screenHeight);
    }];
    [_showResultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(150);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(300);
    }];
    
    [_showResultTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    [_showResultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(200);
    }];
    
    [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(-20);
        make.left.mas_equalTo(50);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [_showWeightLab sizeToFit];
    [_showWeightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(100);
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
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(self.showWeightLab);
    }];
    
    [_showHeightLab sizeToFit];
    [_showHeightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(200);
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
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(self.showHeightLab);
    }];
    
    
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(screenWidth-50);
        make.left.mas_equalTo(25);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-300);
    }];
    
}
#pragma mark onViewClick
-(void)onViewClick:(id)sender{
    
    
    [UIView transitionWithView:self.showResultView duration:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.showResultView.hidden = NO;
        self.showBgView.hidden = NO;
        
    } completion:^(BOOL finished) {
        
    }];
   
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
-(void)sureClick:(id)sender{
    
    [UIView transitionWithView:self.showResultView duration:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.showResultView.hidden = YES;
        self.showBgView.hidden = YES;
        
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark getter
-(UIView *)showBgView{
    
    if(!_showBgView){
        _showBgView = [[UIView alloc]init];
        _showBgView.backgroundColor = [UIColor blackColor];
        _showBgView.layer.cornerRadius = 10;
        _showBgView.layer.shadowOpacity = 0.3;
        self.showBgView.alpha = 0.5;
        _showBgView.hidden = YES;
    }
    return _showBgView;
}
-(UIView *)showResultView{
    
    if(!_showResultView){
        _showResultView = [[UIView alloc]init];
        _showResultView.backgroundColor = [UIColor whiteColor];
        _showResultView.layer.cornerRadius = 10;
        _showResultView.layer.shadowOpacity = 0.3;
//         self.showResultView.alpha = 0;
        self.showResultView.hidden = YES;
    }
    return _showResultView;
}
-(UILabel *)showResultTitle{
    
    if (!_showResultTitle) {
        _showResultTitle = [[UILabel alloc]init];
        _showResultTitle.textColor = [UIColor blackColor];
        _showResultTitle.font = [UIFont boldSystemFontOfSize:20.0];
        _showResultTitle.textAlignment = 1;
        _showResultTitle.text = NSLocalizedString(@"resultTitle", nil);
    }
    return _showResultTitle;
}
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
        _actionBtn.layer.cornerRadius = 8;
        [_actionBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}
-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.backgroundColor = [UIColor colorWithRed:237.0/255 green:80.0/255 blue:86.0/255 alpha:1];
        [_sureBtn setTitle:NSLocalizedString(@"Sure", nil) forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        _sureBtn.layer.cornerRadius = 4;
        [_sureBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
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
