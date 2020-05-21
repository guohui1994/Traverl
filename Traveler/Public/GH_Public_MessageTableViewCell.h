//
//  GH_Public_MessageTableViewCell.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/27.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GH_Public_MessageTableViewCell : UITableViewCell
@property (nonatomic, assign)BOOL isHiddenBgView;

@property (nonatomic, assign)BOOL isReply;//是否是回复

@end

NS_ASSUME_NONNULL_END
