//
//  WebViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>


@interface WebViewController ()<UIWebViewDelegate,WKNavigationDelegate>

@property (nonatomic, strong) UIWebView * webView;

@property (nonatomic, strong) UIButton * actionButton;

@property (nonatomic, strong) UIAlertController * hudController;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.actionButton];
    
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    webView.allowsBackForwardNavigationGestures = YES;
    webView.navigationDelegate = self;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    self.hudController = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"huding", nil) preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:self.hudController animated:YES completion:nil];
    // Do any additional setup after loading the view.
}

#pragma mark UIWebviewdelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
     [self.hudController dismissViewControllerAnimated:YES completion:nil];
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
        [_actionButton setTitleColor:[UIColor colorWithRed:237.0/255 green:80.0/255 blue:86.0/255 alpha:1] forState:UIControlStateNormal];
        _actionButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_actionButton addTarget:self action:@selector(onViewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButton;
}

@end
