//
//  QRShowViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "QRShowViewController.h"
#import "Masonry/Masonry.h"



@interface QRShowViewController ()

@property (nonatomic, strong) UIImageView * mainImageView;

@property (nonatomic, strong) UIButton * actionBtn;
@end

@implementation QRShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.mainImageView.image = self.mainImage;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

#pragma mark setupUI
-(void)setupUI{
    [self.view addSubview:self.mainImageView];
    [self.view addSubview:self.actionBtn];
    [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(20+84+80);
        make.width.mas_equalTo(self.mainImage.size.width);
        make.height.mas_equalTo(self.mainImage.size.height);
    }];
    
    [_actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        if (IS_IPHONE_X) {
            make.bottom.mas_equalTo(-25);
        }else{
            make.bottom.mas_equalTo(0);
        }
    }];
}

#pragma mark onViewClick
-(void)onViewClick:(id)sender{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(screenWidth, screenHeight - 80), NO, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //将图片保存到相册
    UIImageWriteToSavedPhotosAlbum(screenShotImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
//    UIImageWriteToSavedPhotosAlbum(self.mainImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = NSLocalizedString(@"SaveImgFaild", nil) ;
        NSLog(@"%@",error.debugDescription);
    }else{
        msg = NSLocalizedString(@"SaveImageSuccess", nil) ;
    }
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil] ;
}

#pragma mark getter
-(UIImageView *)mainImageView{
    if(!_mainImageView){
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.contentMode = UIViewContentModeScaleAspectFit;
        _mainImageView.backgroundColor = [UIColor lightTextColor];
    }
    return _mainImageView;
}

-(UIButton *)actionBtn{
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn.backgroundColor = [UIColor colorWithRed:237.0/255 green:80.0/255 blue:86.0/255 alpha:1];
        [_actionBtn setTitle:NSLocalizedString(@"SaveToAlbum", nil) forState:UIControlStateNormal];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _actionBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_actionBtn addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}

@end
