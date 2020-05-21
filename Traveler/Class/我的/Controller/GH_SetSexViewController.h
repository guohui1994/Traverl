//
//  GH_SetSexViewController.h
//  WangLawyer
//
//  Created by ZhiYuan on 2019/9/12.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^setSex)(void);
@interface GH_SetSexViewController : BaseViewController
@property (nonatomic, strong)setSex block;
@end

NS_ASSUME_NONNULL_END
