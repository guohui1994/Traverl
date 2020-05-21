//
//  GH_Tools.h
//  ExtendDemo
//
//  Created by ZhiYuan on 2019/8/8.
//  Copyright © 2019 ZhiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <UIKit/UIKit.h>

//UIRectCornerTopLeft     = 1 << 0,
//UIRectCornerTopRight    = 1 << 1,
//UIRectCornerBottomLeft  = 1 << 2,
//UIRectCornerBottomRight = 1 << 3,
//UIRectCornerAllCorners  = ~0UL



typedef NS_ENUM(NSInteger){
    
    /*左上*/
    LeftTop = UIRectCornerTopLeft,
    /*左下*/
    LeftBottom = UIRectCornerBottomLeft,
    /*右上*/
    RightTop = UIRectCornerTopRight,
    /*右下*/
    RightBottom = UIRectCornerBottomRight,
    /*左上左下*/
    LeftTopAndBottom = UIRectCornerTopLeft | UIRectCornerBottomLeft,
    /*右上右下*/
    RightTopAndBottom = UIRectCornerTopRight | UIRectCornerBottomRight,
    /*左上左下右上*/
    LeftTopAndBottomAndRightTop = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerTopRight,
    /*左上左下右下*/
    LeftTopAndBottomAndRightBottom = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight,
    /*右上右下左上*/
    RightLeftAndBottomAndLeftTop = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerTopLeft,
    /*右上右下左下*/
    RightLeftAndBottomAndLeftBottom = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft,
    /*左上右上*/
    LeftTopAndRightTop = UIRectCornerTopLeft | UIRectCornerTopRight,
    /*左上右下*/
    LeftTopAndRightBottom = UIRectCornerTopLeft | UIRectCornerBottomRight,
    /*左下右上*/
    LeftBottomANdRightTop = UIRectCornerBottomLeft | UIRectCornerTopRight,
    /*左下右下*/
    LeftBottomAndRightBottom = UIRectCornerBottomLeft | UIRectCornerBottomRight,
    /*全部圆角*/
    AllCorners =  UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight,
    
}RoundingCornersModel;


NS_ASSUME_NONNULL_BEGIN

@interface GH_Tools : NSObject

//返回当前时间戳
+ (long)currentTimeStemp;
//时间戳转字符串
+(NSString *)transToTimeStemp:(long)timeStemp dateFormatter:(NSString *)formatter;
//生成model
+(void)beginCreatModelWithName:(NSString *)name data:(id)data;
/**
 判断网络状态
 @return 判断网络状态
 */
//+ (BOOL)isNetWorkReachable;
//获取当前时间戳  精确到毫秒
+ (NSString *)currentTimeStr;

/**
 自动消失, 延迟两秒不带菊花---黑色白字
 
 @param text 传入的text
 */
+ (void)AutomaticAndBlackHudRemoveHudWithText:(NSString *)text;


/**
 添加删除线

 @param text string
 @param length 长度
 @param color 颜色
 @return 添加删除线的string
 */
+ (NSMutableAttributedString *)addDeletLineWithString:(NSString *)text length:(NSInteger)length color:(NSString *)color;


/**
 返回富文本

 @param string string
 @param color 颜色
 @param font 字体
 @param length 长度
 @return 富文本
 */
+(NSMutableAttributedString *)attributedStringWithString:(NSString *)string color:(NSString *)color font:(CGFloat)font length:(NSInteger)length;






/**
 字符串Bsae64编码

 @param string 需要编码的字符串
 @return 返回j编码后的字符串
 */
+ (NSString * )base64CodeWithString:(NSString *)string;


/**
 字符串Bsae64解码

 @param base64String 传入需要c解码的base64字符串

 @return 返回解码后的字符串
 */
+ (NSString *)parsingBase64CodeString:(NSString *)base64String;


/**
 变色Layer
 @param width 宽度
 @param height 高度
 @param Color 第一个颜色
 @param discolorationColor 变色颜色
 @return 返回layer
 */
+ (CAGradientLayer *)changColorWithWidth:(CGFloat)width height:(CGFloat)height Color:(NSString *)Color discolorationColor:(NSString *)discolorationColor;


/**
 返回圆角

 @param width 贝塞尔曲线宽度
 @param height 贝塞尔曲线高度
 @param Color 颜色
 @param CorenersModel 圆角类型
 @param cornerRadiiWidth 圆心 x
 @param cornerRadiiHeight 圆心 y
 @return 返回CAShapeLayer
 */
+ (CAShapeLayer *)roundWithWidth:(CGFloat)width height:(CGFloat)height Color:(NSString *)Color CorenersModel:(RoundingCornersModel) CorenersModel cornerRadiiWidth:(CGFloat)cornerRadiiWidth cornerRadiiHeight:(CGFloat)cornerRadiiHeight;


/**
 获取跟控制器

 @return 根控制器
 */
+ (UIViewController *)rootViewController;

/**
 获取当前活跃控制器

 @return 返回VC
 */
+ (UIViewController *)findVisibleViewController;




@end

NS_ASSUME_NONNULL_END
