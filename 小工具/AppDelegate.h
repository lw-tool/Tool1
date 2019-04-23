//
//  AppDelegate.h
//  小工具
//
//  Created by liuwei on 2019/4/23.
//  Copyright © 2019年 com.LW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BMKLocationkit/BMKLocationAuth.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, BMKLocationAuthDelegate> {
    UINavigationController *navigationController;
}

@property (strong, nonatomic) UIWindow *window;


@end

