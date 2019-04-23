//
//  QRCodeViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "QRCodeViewController.h"
#import "Masonry/Masonry.h"
#import "QRShowViewController.h"
#import <CoreImage/CoreImage.h>

@interface QRCodeViewController ()

@property (nonatomic, strong) UITextView * mainTextView;

@property (nonatomic, strong) UIButton * actionBtn;
@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.title = @"二维码生成";
    [self setUpUI];
}

#pragma mark setupUI
-(void)setUpUI{
    [self.view addSubview:self.mainTextView];
    [self.view addSubview:self.actionBtn];
    
    [_mainTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(20 + 84);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(200);
    }];
    
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.mainTextView);
        make.top.mas_equalTo(self.mainTextView.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
}

#pragma mark onViewClick
-(void)onViewClick:(id)sender{
    if (!self.mainTextView.text.length) {
        return;
    }
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [self.mainTextView.text dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    //设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    /*
     * L: 7%
     * M: 15%
     * Q: 25%
     * H: 30%
     */
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    //拿到二维码图片，此时的图片不是很清晰，需要二次加工
    CIImage *outPutImage = [filter outputImage];
    
    QRShowViewController * vc = [[QRShowViewController alloc] init];
    vc.mainImage = [UIImage imageWithCIImage:outPutImage];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark getter
-(UITextView *)mainTextView{
    if (!_mainTextView) {
        _mainTextView = [[UITextView alloc] init];
        _mainTextView.textColor = [UIColor darkTextColor];
        _mainTextView.contentInset = UIEdgeInsetsMake(10, 20, 10, 20);
        _mainTextView.backgroundColor = [UIColor whiteColor];
        _mainTextView.font = [UIFont systemFontOfSize:16];
        _mainTextView.layer.borderColor = [UIColor cyanColor].CGColor;
        _mainTextView.layer.borderWidth = 1;
    }
    return _mainTextView;
}


-(UIButton *)actionBtn{
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn.backgroundColor = [UIColor colorWithRed:101/255.0 green:199/255.0 blue:250/255.0 alpha:1];
        [_actionBtn setTitle:@"生成二维码" forState:UIControlStateNormal];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _actionBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _actionBtn.layer.cornerRadius = 4;
        [_actionBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}
@end
