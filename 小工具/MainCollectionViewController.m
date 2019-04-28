//
//  MainCollectionViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/28.
//  Copyright © 2019 com.LW. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "MainCollectionViewCell.h"
#import "RandomViewController.h"
#import "CutViewViewController.h"
#import "QRCodeViewController.h"
#import "TranslationViewController.h"
#import "BMICalculatorViewController.h"
#import "LocationViewController.h"
#import "Masonry/Masonry.h"

@interface MainCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView * mainCollectionView;

@property (nonatomic, copy) NSArray * dataSourceArray;

@property (nonatomic, copy) NSArray * imageArr;

@property (nonatomic, strong) UILabel * bottomLbl;
@end

@implementation MainCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"HomeTitle", nil);
    self.dataSourceArray = @[NSLocalizedString(@"RandomNumber", nil),NSLocalizedString(@"WebScreenshot", nil),NSLocalizedString(@"QRCodeMake", nil),NSLocalizedString(@"BaiduTrans", nil),NSLocalizedString(@"Location", nil),NSLocalizedString(@"BIMCalculate", nil)];
    self.imageArr = @[@"NewRandom.png",@"ScreenShot.png",@"QRCode.png",@"BDTransport.png",@"Location.png",@"BMICalculate.png"];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mainCollectionView];
    [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.bottomLbl];
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


#pragma mark getter
-(UICollectionView *)mainCollectionView{
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.showsVerticalScrollIndicator = NO;
        [_mainCollectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"MainCollectionViewCell"];
    }
    return _mainCollectionView;
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

#pragma mark UICollectionViewDelegate& UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCell" forIndexPath:indexPath];
    [cell printCell:self.imageArr[indexPath.row] title:self.dataSourceArray[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (screenWidth) / 3 ;
    CGSize size = CGSizeMake(width, width + 30);
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
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
