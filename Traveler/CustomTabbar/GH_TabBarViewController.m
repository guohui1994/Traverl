//
//  GH_TabBarViewController.m
//  zhengXinChaXun
//
//  Created by ZhiYuan on 2019/5/18.
//  Copyright © 2019 ZhiYuan. All rights reserved.
//

#import "GH_TabBarViewController.h"
#import "GH_NavViewController.h"
#import "GH_HomeViewController.h"
#import "GH_RecordViewController.h"
#import "GH_MyViewController.h"
#import "GH_DiscussViewController.h"

//#import "ZYMessageController.h"
@interface GH_TabBarViewController ()

@end

@implementation GH_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO;
    // 通过appearance统一设置UITabbarItem的文字属性
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];  // 设置文字大小
    attrs[NSForegroundColorAttributeName] = Colors(@"#666666");  // 设置文字的前景色
    
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#4294F8"];
    //
    UITabBarItem * item = [UITabBarItem appearance];  // 设置appearance
    [[UITabBar appearance]setBackgroundColor:[UIColor whiteColor]];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    
    
    // 初始化控制器
    GH_HomeViewController * homeVC = [GH_HomeViewController new];
    [self setupChildVC:homeVC andImage:@"Tabbar_Home_Nomal" andSelectImage:@"Tabbar_Home_Select" title:@"首页"];
    GH_DiscussViewController *liveVC = [[GH_DiscussViewController alloc] init];
    [self setupChildVC:liveVC andImage:@"Tabbar_Live_Normal" andSelectImage:@"Tabbar_Live_Select" title:@"讨论"];
    GH_RecordViewController * shoppingVC = [[GH_RecordViewController alloc]init];
    [self setupChildVC:shoppingVC andImage:@"Tabbar_Shopping_Normal" andSelectImage:@"Tabbar_Shopping_Select" title:@"笔录"];

    GH_MyViewController * myVC = [[GH_MyViewController alloc]init];
    [self setupChildVC:myVC andImage:@"Tabbar_My_Normal" andSelectImage:@"Tabbar_My_Select" title:@"我的"];
    
    
}



/* 初始化子控制器
*/
- (void)setupChildVC:(UIViewController * )vc andImage:(NSString * )image andSelectImage:(NSString *)selectImage title:(NSString *)title{
   
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    UIImage * images = [UIImage imageNamed:selectImage];
    images = [images imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = images;
    

    GH_NavViewController * VC = [[GH_NavViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:VC];
}



//点击tabbar的动画效果
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    NSLog(@"item name = %@", item.title);
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
    if([item.title isEqualToString:@"发现"])
    {
        // 也可以判断标题,然后做自己想做的事<img alt="得意" src="http://static.blog.csdn.net/xheditor/xheditor_emot/default/proud.gif" />
    }
}
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
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
