//
//  GH_PersionMessageTableViewCell.h
//  zhichengEducation
//
//  Created by ZhiYuan on 2019/11/6.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GH_PersionMessageTableViewCell : UITableViewCell

@property (nonatomic, assign)BOOL isHiddenHeaderImage;//是否隐藏头像

@property (nonatomic, copy)NSString * title;//标题;

@property (nonatomic,copy)NSString * message;

@end

NS_ASSUME_NONNULL_END
