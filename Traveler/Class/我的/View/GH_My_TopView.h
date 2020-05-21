//
//  GH_My_TopView.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^headerSelect)(void);
typedef void(^EditAction)(void);
typedef void(^messageAction)(void);
typedef void(^FouceOnAction)(void);
typedef void(^FansAction)(void);
@interface GH_My_TopView : UIView
@property (nonatomic, copy)EditAction editBlock;
@property (nonatomic, copy)messageAction messBlock;
@property (nonatomic, copy)headerSelect headerBlock;
@property (nonatomic, copy)FouceOnAction fouceOnBlock;
@property (nonatomic, copy)FansAction fansBlock;
@end

NS_ASSUME_NONNULL_END
