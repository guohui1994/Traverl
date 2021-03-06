//
//  UIButton+JGLayout.h
//  FD_Rider
//
//  Created by 郭军 on 2019/3/16.
//  Copyright © 2019年 zhiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, JGLayoutStatus){
    /** 正常位置，图左字右 */
    JGLayoutStatusNormal,
    /** 图右字左 */
    JGLayoutStatusImageRight,
    /** 图上字下 */
    JGLayoutStatusImageTop,
    /** 图下字上 */
    JGLayoutStatusImageBottom,
};





NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JGLayout)




/**
 重新布局显示方式

 @param status 显示方式
 @param margin 间隙
 */
- (void)layoutWithStatus:(JGLayoutStatus)status andMargin:(CGFloat)margin;



@end

NS_ASSUME_NONNULL_END


/*
 这里主要用到了两个属性
 
 @property(nonatomic) UIEdgeInsets titleEdgeInsets; // default is UIEdgeInsetsZero
 @property(nonatomic) UIEdgeInsets imageEdgeInsets; // default is UIEdgeInsetsZero
 
 
 */
