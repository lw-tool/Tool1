//
//  ViewController.m
//  TestDEMO
//
//  Created by liuwei on 2019/3/7.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "MainViewController.h"
#import "Masonry/Masonry.h"
#import "MainTableViewCell.h"
#import "RandomViewController.h"
#import "CutViewViewController.h"
#import "QRCodeViewController.h"
#import "TranslationViewController.h"
#import "BMICalculatorViewController.h"
#import "LocationViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * mainTableView;
@property (nonatomic, copy) NSArray * dataSourceArray;

@property (nonatomic, strong) UIButton * changeLanguageBtn;
@property (nonatomic, copy)NSArray * languageArr;
@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, strong) UILabel * bottomLbl;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = NSLocalizedString(@"HomeTitle", nil);
    [self initData];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.changeLanguageBtn];
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.bottomLbl];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-80);
    }];
    
    [_bottomLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(screenWidth);
        if (IS_IPHONE_X) {
            make.bottom.mas_equalTo(-25);
        }else{
            make.bottom.mas_equalTo(0);
        }
    }];
}


#pragma mark   init dataSource
-(void)initData{
    self.dataSourceArray = @[NSLocalizedString(@"RandomNumber", nil),NSLocalizedString(@"WebScreenshot", nil),NSLocalizedString(@"QRCodeMake", nil),NSLocalizedString(@"BaiduTrans", nil),NSLocalizedString(@"Location", nil),NSLocalizedString(@"BIMCalculate", nil)];
    self.languageArr = @[@"中文",@"English",@"한국어"];
    self.selectIndex = 0;
}

#pragma mark clickAction
-(void)onViewClick{
    switch (self.selectIndex) {
        case 0:{
            self.selectIndex = 1;
        }
            break;
        case 1:{
            self.selectIndex = 2;
        }
            break;
        case 2:{
            self.selectIndex = 0;
        }
            break;
        default:
            break;
    }
    [self.changeLanguageBtn setTitle:self.languageArr[self.selectIndex] forState:UIControlStateNormal];
}

#pragma mark initUI
-(UIButton *)changeLanguageBtn{
    if (!_changeLanguageBtn) {
        _changeLanguageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeLanguageBtn.frame = CGRectMake(0, 0, 80, 40);
        _changeLanguageBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_changeLanguageBtn setTitle:self.languageArr[self.selectIndex] forState:UIControlStateNormal];
        [_changeLanguageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_changeLanguageBtn addTarget:self action:@selector(onViewClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeLanguageBtn;
}

-(UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.rowHeight = UITableViewAutomaticDimension;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate=self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

-(UILabel *)bottomLbl{
    if (!_bottomLbl) {
        _bottomLbl = [[UILabel alloc] init];
        _bottomLbl.text = NSLocalizedString(@"openNewLife", nil);
        _bottomLbl.backgroundColor = [UIColor clearColor];
        _bottomLbl.font = [UIFont systemFontOfSize:30];
        _bottomLbl.textAlignment = NSTextAlignmentCenter;
        _bottomLbl.textColor = [UIColor colorWithRed:237.0/255 green:80.0/255 blue:86.0/255 alpha:1];
    }
    return _bottomLbl;
}

#pragma mark UITableViewDelegate & UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * celleID = @"MainTableViewCell";
    MainTableViewCell * mainCell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:celleID];
    if (!mainCell) {
        mainCell = [[MainTableViewCell alloc] initWithFrame:CGRectZero];
        [mainCell reloadCell:self.dataSourceArray[indexPath.row]];
        mainCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return mainCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"select index: %@",self.dataSourceArray[indexPath.row]);
    
    switch (indexPath.row) {
        case 0: {
            RandomViewController * vc = [[RandomViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            CutViewViewController * vc = [[CutViewViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            }
            break;
        case 2:{
            QRCodeViewController * vc = [[QRCodeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case 3: {
            TranslationViewController * vc = [[TranslationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
            break;
        case 4: {
            LocationViewController * vc = [[LocationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
            break;
        case 5: {
            BMICalculatorViewController * vc = [[BMICalculatorViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        };
            break;
        default:
            break;
    }
}

@end
