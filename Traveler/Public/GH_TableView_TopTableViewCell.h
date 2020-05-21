//
//  GH_TableView_TopTableViewCell.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^cancleFoucOnAction)(void);
@interface GH_TableView_TopTableViewCell : UITableViewCell
@property (nonatomic, assign)BOOL isHidderF;
@property (nonatomic, copy)cancleFoucOnAction cancleFouceOnBlock;
@end

NS_ASSUME_NONNULL_END
