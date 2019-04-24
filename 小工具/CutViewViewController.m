//
//  CutViewViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "CutViewViewController.h"
#import "Masonry/Masonry.h"
#import "WebViewController.h"

@interface CutViewViewController ()

@property (nonatomic, strong) UIView * backView;

@property (nonatomic, strong) UILabel * infoLbl;

@property (nonatomic, strong) UITextView * urlTextView;

@property (nonatomic, strong) UIButton * actionBtn;
@end

@implementation CutViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"WebScreenshot", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    // Do any additional setup after loading the view.
}

#pragma mark setupUI
-(void)setupUI{
    [self.view addSubview:self.backView];
    [self.backView addSubview:self.infoLbl];
    [self.backView addSubview:self.urlTextView];
    [self.view addSubview:self.actionBtn];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(20 + 84);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(200);
    }];
    
    [_infoLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(self.backView.mas_width).offset(-30);
        make.height.mas_equalTo(40);
    }];
    
    [_urlTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.infoLbl.mas_left);
        make.top.mas_equalTo(self.infoLbl.mas_bottom).offset(15);
        make.width.mas_equalTo(self.infoLbl.mas_width);
        make.bottom.mas_equalTo(self.backView.mas_bottom).offset(-15);
    }];
    
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backView.mas_left);
        make.top.mas_equalTo(self.backView.mas_bottom).offset(30);
        make.width.mas_equalTo(self.backView.mas_width);
        make.height.mas_equalTo(40);
    }];
}

#pragma mark onViewClick
-(void)onViewClick:(id)sender{
    NSString * urlString = [NSString stringWithFormat:@"https://%@",self.urlTextView.text];
    WebViewController * webVC = [[WebViewController alloc] init];
    webVC.url = urlString;
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma  mark getter
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _backView.layer.borderWidth = 1;
        _backView.userInteractionEnabled = YES;
        
    }
    return _backView;
}

-(UILabel *)infoLbl{
    if (!_infoLbl) {
        _infoLbl = [[UILabel alloc] init];
        _infoLbl.font = [UIFont systemFontOfSize:16];
        _infoLbl.textColor = [UIColor darkTextColor];
        _infoLbl.text = NSLocalizedString(@"BaseURL", nil);
        _infoLbl.textAlignment = NSTextAlignmentLeft;
    }
    return _infoLbl;
}

-(UITextView *)urlTextView{
    if (!_urlTextView) {
        _urlTextView = [[UITextView alloc] init];
        _urlTextView.textColor = [UIColor darkTextColor];
        _urlTextView.contentInset = UIEdgeInsetsMake(10, 20, 10, 20);
        _urlTextView.backgroundColor = [UIColor lightGrayColor];
        _urlTextView.font = [UIFont systemFontOfSize:16];
    }
    return _urlTextView;
}

//101 199 250
-(UIButton *)actionBtn{
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn.backgroundColor = [UIColor colorWithRed:101/255.0 green:199/255.0 blue:250/255.0 alpha:1];
        _actionBtn.layer.cornerRadius = 4;
        [_actionBtn setTitle:NSLocalizedString(@"OpenURL", nil) forState:UIControlStateNormal];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_actionBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}
@end
