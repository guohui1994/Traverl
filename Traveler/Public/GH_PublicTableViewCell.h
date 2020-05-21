//
//  GH_PublicTableViewCell.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^cancleFoucOnAction)(void);
typedef void(^cellHeight)(CGFloat height);
@interface GH_PublicTableViewCell : UITableViewCell
@property (nonatomic, assign)BOOL isHidderF;
@property (nonatomic, copy)cancleFoucOnAction cancleFouceOnBlock;
@property (nonatomic, copy)cellHeight cellHeightBlock;
@end

NS_ASSUME_NONNULL_END
