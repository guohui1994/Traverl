//
//  GH_AddView.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^riluAction)(void);
typedef void(^yueLuAction)(void);
typedef void(^xingQuAction)(void);
@interface GH_AddView : UIView
@property (nonatomic, copy)riluAction riLuBlock;
@property (nonatomic, copy)yueLuAction yueLuBlock;
@property (nonatomic, copy)xingQuAction xingQueBlock;
@end

NS_ASSUME_NONNULL_END
