//
//  RandomViewController.m
//  TestDEMO
//
//  Created by liuwei on 2019/4/22.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "RandomViewController.h"
#import "Masonry/Masonry.h"

#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

@interface RandomViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel * randomRangeLbl;
@property (nonatomic, strong) UITextField * lowTextField;
@property (nonatomic, strong) UILabel * mindLbl;
@property (nonatomic, strong) UITextField * maxTextField;

@property (nonatomic, strong) UILabel * showNumberLbl;
@property (nonatomic, strong) UIButton * actionBtn;
@end

@implementation RandomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"RandomNumber", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    // Do any additional setup after loading the view.
}

#pragma mark setup UI
-(void)setupUI{
    [self.view addSubview:self.showNumberLbl];
    [_showNumberLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(screenWidth - 50);
        make.height.mas_equalTo(80);
    }];
    
    [self.view addSubview:self.randomRangeLbl];
    [self.view addSubview:self.lowTextField];
    [self.view addSubview:self.mindLbl];
    [self.view addSubview:self.maxTextField];
    
    [_randomRangeLbl sizeToFit];
    [_randomRangeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-120);
        make.height.mas_equalTo(60);
    }];
    
   
    [_lowTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.randomRangeLbl.mas_right).offset(5);
        make.width.mas_equalTo(100);
        make.top.height.mas_equalTo(self.randomRangeLbl);
    }];
    
    [_mindLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lowTextField.mas_right).offset(5);
        make.width.mas_equalTo(40);
        make.top.height.mas_equalTo(self.randomRangeLbl);
    }];
    
    [_maxTextField sizeToFit];
    [_maxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mindLbl.mas_right).offset(5);
        make.top.height.mas_equalTo(self.mindLbl);
        make.width.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.actionBtn];
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(screenWidth);
        make.height.mas_equalTo(100);
    }];
}

#pragma mark onViewClick
-(void)onViewClick:(id)sender{
    [self randomWithRangeMin:self.lowTextField.text.integerValue max:self.maxTextField.text.integerValue];
}

#pragma mark private method

-(void)randomWithRangeMin:(NSInteger)min max:(NSInteger)max{
    NSInteger value = (arc4random() % (max - min)) + min;
    self.showNumberLbl.text = [NSString stringWithFormat:@"%ld",value];
}

#pragma mark getter
-(UILabel *)showNumberLbl{
    if (!_showNumberLbl) {
        _showNumberLbl = [[UILabel alloc]init];
        _showNumberLbl.backgroundColor = [UIColor clearColor];
        _showNumberLbl.font = [UIFont systemFontOfSize:30];
        _showNumberLbl.textAlignment = NSTextAlignmentCenter;
        _showNumberLbl.textColor = [UIColor blackColor];
    }
    return _showNumberLbl;
}

-(UILabel *)randomRangeLbl{
    if (!_randomRangeLbl) {
        _randomRangeLbl = [[UILabel alloc] init];
        _randomRangeLbl.textColor = [UIColor blackColor];
        _randomRangeLbl.font = [UIFont systemFontOfSize:16];
        _randomRangeLbl.text = NSLocalizedString(@"RandomRange: ", nil);
    }
    return _randomRangeLbl;
}

-(UITextField *)lowTextField{
    if (!_lowTextField) {
        _lowTextField = [[UITextField alloc] init];
        _lowTextField.textColor = [UIColor blackColor];
        _lowTextField.text = @"0";
        _lowTextField.textAlignment = NSTextAlignmentLeft;
        _lowTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _lowTextField.layer.borderWidth = 1;
        _lowTextField.delegate = self;
    }
    return _lowTextField;
}

-(UILabel *)mindLbl{
    if (!_mindLbl) {
        _mindLbl = [[UILabel alloc] init];
        _mindLbl.textColor = [UIColor blackColor];
        _mindLbl.textAlignment = NSTextAlignmentCenter;
        _mindLbl.font = [UIFont systemFontOfSize:16];
        _mindLbl.text = @"~";
    }
    return _mindLbl;
}

-(UITextField *)maxTextField{
    if (!_maxTextField) {
        _maxTextField = [[UITextField alloc] init];
        _maxTextField.textColor = [UIColor blackColor];
        _maxTextField.text = @"100";
        _maxTextField.textAlignment = NSTextAlignmentLeft;
        _maxTextField.layer.borderColor = [UIColor blackColor].CGColor;
        _maxTextField.layer.borderWidth = 1;
        _maxTextField.delegate = self;
    }
    return _maxTextField;
}


-(UIButton *)actionBtn{
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn.backgroundColor = [UIColor cyanColor];
        [_actionBtn setTitle:NSLocalizedString(@"Action", nil) forState:UIControlStateNormal];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _actionBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_actionBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}
@end
