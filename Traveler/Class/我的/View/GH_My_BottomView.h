//
//  GH_My_BottomView.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^selectIndex)(NSInteger index);
@interface GH_My_BottomView : UIView

- (id)initWithFrame:(CGRect)frame itemCount:(NSInteger)itemCount titleArray:(NSArray *)titleArray imageArray:(NSArray *)imageArray;
@property (nonatomic, copy)selectIndex selectBlock;
@end

NS_ASSUME_NONNULL_END
