//
//  GH_Tools.m
//  ExtendDemo
//
//  Created by ZhiYuan on 2019/8/8.
//  Copyright © 2019 ZhiYuan. All rights reserved.
//

#import "GH_Tools.h"
#import "AppDelegate.h"


@interface GH_Tools ()


@property (nonatomic, strong)UIView * blackView;//黑色背景
@end

@implementation GH_Tools

//返回当前时间戳
+ (long)currentTimeStemp{
    NSDate* datenow = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    return timeSp;
}


+(NSString *)transToTimeStemp:(long)timeStemp dateFormatter:(NSString *)formatter{
    NSString *timeStr = [NSString stringWithFormat:@"%ld",timeStemp];
    
    if (timeStr.length == 13) {
        timeStemp = timeStemp / 1000.0;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStemp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (!formatter) {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    [dateFormatter setDateFormat:formatter];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
//生成model
+(void)beginCreatModelWithName:(NSString *)name data:(id)data{
    /* 全局公用配置 (只需设置在使用工具之前就行了) */
    
    //属性或方法是否空行
    //        [YBMFConfig shareConfig].fileHHandler.ybmf_skipLine = YES;
    //        [YBMFConfig shareConfig].fileMHandler.ybmf_skipLine = YES;
    //是否需要实现 NSCoding 或 NSCopying 协议
    //        [YBMFConfig shareConfig].needCoding = NO;
    //        [YBMFConfig shareConfig].needCopying = NO;
    //设置类名公用后缀
    //        [YBMFConfig shareConfig].fileSuffix = @"File";
    //设置忽略类型
    //        [YBMFConfig shareConfig].ignoreType = YBMFIgnoreTypeAllDigital | YBMFIgnoreTypeMutable;
    //设置文件划分策略
    //        [YBMFConfig shareConfig].filePartitionMode = YBMFFilePartitionModeApart;
    //设置工程用的字典转模型框架
    //        [YBMFConfig shareConfig].framework = YBMFFrameworkMJ;
    
    /** 属性之间是否空行 */
    [YBMFConfig shareConfig].fileHHandler.ybmf_skipLine = YES;
    /** 是否需要实现 NSCoding 协议 (默认为 YES) */
    [YBMFConfig shareConfig].needCoding = NO;
    /** 是否需要实现 NSCopying 协议 (默认为 YES) */
    [YBMFConfig shareConfig].needCopying = NO;
    /** 工程使用的 json 转 model 框架 (默认为 YBMFFrameworkYY) */
    [YBMFConfig shareConfig].framework = YBMFFrameworkMJ;
    
    
    //解析 json 数据
    [YBModelFile createFileWithName:name data:data];
}


//#pragma mark - 网络监测 -
//+ (BOOL)isNetWorkReachable {
//
//    AppDelegate *appDelagate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    if (appDelagate.isReachable == NO) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [JGToast showWithText:@"网络连接错误, 请检查网络"];
//        });
//        return NO;
//    }
//    return YES;
//}
//获取当前时间戳
+ (NSString *)currentTimeStr {
    
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}



/**
 自动消失, 延迟两秒不带菊花---黑色白字
 
 @param text 传入的text
 */
+(void)AutomaticAndBlackHudRemoveHudWithText:(NSString *)text{
    UIView * bgView = [UIView new];
    bgView.backgroundColor = [Colors(@"#000000") colorWithAlphaComponent:0.3];
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo([UIApplication sharedApplication].keyWindow);
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    button.titleLabel.font = Fonts(17);
    button.layer.cornerRadius = ZY_WidthScale(10);
    button.clipsToBounds = YES;
    [bgView addSubview:button];
    [button setupAutoSizeWithHorizontalPadding:ZY_WidthScale(10) buttonHeight:ZY_HeightScale(40)];
    [button setSd_maxWidth:[NSNumber numberWithDouble:screenWidth - GH_WidthScale(60)]];
    
    button.sd_layout
    .centerXEqualToView(bgView)
    .centerYEqualToView(bgView)
    .heightIs(ZY_HeightScale(40))
    .autoWidthRatio(0);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bgView removeFromSuperview];
    });
}

+ (NSMutableAttributedString *)addDeletLineWithString:(NSString *)text length:(NSInteger)length color:(NSString *)color{
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc]initWithString:text];
    [string addAttribute:NSStrikethroughColorAttributeName value:Colors(color) range:NSMakeRange(0,length)];
    [string setAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)}
                     range:NSMakeRange(0, length)];
    return string;
}
/**
 返回富文本
 
 @param string string
 @param color 颜色
 @param font 字体
 @param length 长度
 @return 富文本
 */
+(NSMutableAttributedString *)attributedStringWithString:(NSString *)string color:(NSString *)color font:(CGFloat)font length:(NSInteger)length{
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:string];
    /*设置某一段文字的颜色*/
    [attributeString addAttribute:NSForegroundColorAttributeName value:Colors(color) range:NSMakeRange(0, length)];
    /*设置某一段文字的字体*/
    [attributeString addAttribute:NSFontAttributeName value:Fonts(font) range:NSMakeRange(0, length)];
    return attributeString;
}

/**
 字符串Bsae64编码
 
 @param string 需要编码的字符串
 @return 返回j编码后的字符串
 */
+ (NSString * )base64CodeWithString:(NSString *)string{
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return  [data base64EncodedStringWithOptions:0];
}
/**
 字符串Bsae64解码
 
 @param base64String 传入需要c解码的base64字符串
 
 @return 返回解码后的字符串
 */
+ (NSString *)parsingBase64CodeString:(NSString *)base64String{
    NSData * stringData = [[NSData alloc]initWithBase64EncodedString:base64String options:0];
    return  [[NSString alloc]initWithData:stringData encoding:NSUTF8StringEncoding];
}







/**
 变色Layer
 @param width 宽度
 @param height 高度
 @param Color 第一个颜色
 @param discolorationColor 变色颜色
 @return 返回layer
 */
+ (CAGradientLayer *)changColorWithWidth:(CGFloat)width height:(CGFloat)height Color:(NSString *)Color discolorationColor:(NSString *)discolorationColor{
    CAGradientLayer *  gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:Color].CGColor,(__bridge id)[UIColor colorWithHexString:discolorationColor].CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0,  width,  height);
    return gradientLayer;
}
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
+ (CAShapeLayer *)roundWithWidth:(CGFloat)width height:(CGFloat)height Color:(NSString *)Color CorenersModel:(RoundingCornersModel) CorenersModel cornerRadiiWidth:(CGFloat)cornerRadiiWidth cornerRadiiHeight:(CGFloat)cornerRadiiHeight{
    UIBezierPath * roundCorenerBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width, height) byRoundingCorners:(UIRectCorner)CorenersModel cornerRadii:CGSizeMake(cornerRadiiWidth, cornerRadiiHeight)];
    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.path = roundCorenerBezierPath.CGPath;
    shapeLayer.fillColor = Colors(Color).CGColor;
    return shapeLayer;
}

/**
 获取跟控制器
 
 @return 根控制器
 */
+ (UIViewController *)rootViewController{
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    NSAssert(window, @"The window is empty");
    return window.rootViewController;
}
/**
 获取当前活跃控制器
 
 @return 返回VC
 */
+ (UIViewController *)findVisibleViewController{
    UIViewController* currentViewController = [GH_Tools rootViewController];
    
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else {
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
            } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
                currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
            } else {
                break;
            }
        }
    }
    
    return currentViewController;
}

@end

