//
//  PolicyViewController.m
//  小工具
//
//  Created by liuwei on 2019/4/28.
//  Copyright © 2019 com.LW. All rights reserved.
//

#import "PolicyViewController.h"
#import <WebKit/WebKit.h>

@interface PolicyViewController ()<WKNavigationDelegate>

@end

@implementation PolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"policy", nil);
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    webView.allowsBackForwardNavigationGestures = YES;
    webView.navigationDelegate = self;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:Policy]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
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
