//
//  BaseViewController.h
//  ExtendDemo
//
//  Created by ZhiYuan on 2019/6/21.
//  Copyright © 2019 ZhiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GH_CustomNavBarView.h"



typedef void(^RebalityStatus)(NSInteger status);


typedef void(^sureClick)(UIView * blackView);
typedef void(^cancleClick)(UIView * blackView);

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
@property (nonatomic, strong)GH_CustomNavBarView * customNavBar;

- (void)creatUI;

#pragma mark ---导航栏部分设置
//导航栏标题
@property (nonatomic, copy)NSString * titleText;
//导航栏标题颜色
@property (nonatomic, copy)NSString * titleTextColor;

//返回按钮的文字
@property (nonatomic, copy)NSString * backText;
//导航栏返回按钮图片
@property (nonatomic, copy)NSString * backImageUrl;
//导航栏的背景图片显示;
@property (nonatomic, copy)NSString * customNavBarBackGroundUrl;
//是否显示导航栏的渐变背景颜色
@property (nonatomic, assign)BOOL isShowNavBarColor;
//rightView的图片的url
@property (nonatomic, copy)NSString * customNavBarRightUrl;

//菊花
@property (nonatomic, strong)MBProgressHUD * HUD;


//网络状态
@property (nonatomic, strong)RebalityStatus status;

#pragma mark --导航栏上面按钮的点击方法
//返回按钮的返回方法------目的就是有时返回方法不是pop需要做其他操作时, 调用该方法就好了
- (void)backController;
/*导航栏右侧view的点击方法*/
- (void)rightViewClick;
#pragma mark ----菊花

/**
 不消失, 需要手动移除带菊花
 @param text 传入的text
 */
- (void)handMovementRemoveHudWithText:(NSString *)text;

/**
 自动消失, 延迟两秒带菊花

 @param text 传入的text
 */
- (void)AutomaticRemoveHudWithText:(NSString *)text;


/**
 自动消失, 延迟两秒不带菊花
 
 @param text 传入的text
 */
- (void)AutomaticAndHudRemoveHudWithText:(NSString *)text;

/**
 自动消失, 延迟两秒不带菊花---黑色白字
 
 @param text 传入的text
 */
- (void)AutomaticAndBlackHudRemoveHudWithText:(NSString *)text;

//
/**
 自动消失, 延迟时间自己输入

 @param text 传入的text
 @param delayTime 延迟几秒消失
 */
- (void)AutomaticRemoviHudWithText:(NSString *)text delayTime:(int)delayTime;


/**
 自定义提示框
 */
- (void)customeNoticeHudWithTitle:(NSString *)title content:(NSString *)content;

//变色
- (CAGradientLayer *)changColorWithWidth:(CGFloat)width height:(CGFloat)height;


/**
 创建提示框
 
 @param title 标题
 @param clacle 取消按钮响应
 @param sure 确定按钮响应
 */
- (void)creatPrompBoxWithTitle:(NSString *)title content:(NSString *)content cancleTitle:(NSString *)cancleString sureString:(NSString *)sureString cancle:(cancleClick)clacle sure:(sureClick)sure;



@end

NS_ASSUME_NONNULL_END
