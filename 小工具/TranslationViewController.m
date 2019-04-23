//
//  TranslationViewController.m
//  小工具
//
//  Created by 吴敏轩 on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import "TranslationViewController.h"
#import <WebKit/WebKit.h>
@interface TranslationViewController ()

@end

@implementation TranslationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"百度翻译";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
}

-(void)creatUI{

    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.frame];
    webView.allowsBackForwardNavigationGestures = YES;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://fanyi.baidu.com/"]];
    [webView loadRequest:request];
    [self.view addSubview:webView];

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
