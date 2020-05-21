//
//  AppDelegate.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "AppDelegate.h"
#import "GH_TabBarViewController.h"
#import "GH_LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    GH_TabBarViewController * tabBar = [GH_TabBarViewController new];
//    self.window.rootViewController = tabBar;
    GH_LoginViewController * loginVC = [GH_LoginViewController new];
    GH_NavViewController * nav = [[GH_NavViewController alloc]initWithRootViewController:loginVC];
    self.window.rootViewController = tabBar;
    [self ThirdSet];
    
    return YES;
}

- (void)ThirdSet{
    /**
     控制键盘
     */
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    //控制整个功能是否启用。
    manager.enable = YES;
    //控制点击背景是否收起键盘
    manager.shouldResignOnTouchOutside = YES;
    
    /*注册微信*/
    //    [WXApi registerApp:@"wx7b6dedef25441b26" enableMTA:YES];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
