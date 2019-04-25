//
//  WebViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "WebViewController.h"



@interface WebViewController ()

@property (nonatomic, strong) UIWebView * webView;

@property (nonatomic, strong) UIButton * actionButton;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.actionButton];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    // Do any additional setup after loading the view.
}

#pragma mark onViewClick
-(void)onViewClick:(id)sender{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(screenWidth, screenHeight), NO, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //将图片保存到相册
    UIImageWriteToSavedPhotosAlbum(screenShotImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = NSLocalizedString(@"SaveImgFaild", nil) ; ;
    }else{
        msg = NSLocalizedString(@"SaveImageSuccess", nil) ;
    }
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil] ;
}

#pragma  mark getter
-(UIButton *)actionButton{
    if (!_actionButton) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.frame = CGRectMake(0, 0, 50, 40);
        [_actionButton setTitle:NSLocalizedString(@"ScreenShot", nil) forState:UIControlStateNormal];
        [_actionButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _actionButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_actionButton addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButton;
}

@end
