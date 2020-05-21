//
//  GH_My_CenterView.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^dakaReAction)(void);
typedef void(^dakaAction)(void);
@interface GH_My_CenterView : UIView
@property (nonatomic, copy)dakaAction dakaBlock;
@property (nonatomic, copy)dakaReAction dakaReBlock;
@end

NS_ASSUME_NONNULL_END
