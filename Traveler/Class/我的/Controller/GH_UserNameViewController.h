//
//  GH_UserNameViewController.h
//  WangLawyer
//
//  Created by ZhiYuan on 2019/9/12.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^setUserName)(void);

@interface GH_UserNameViewController : BaseViewController

//原有的用户名
@property (nonatomic, copy)NSString * userName;

@property (nonatomic, strong)setUserName block;
@end

NS_ASSUME_NONNULL_END
