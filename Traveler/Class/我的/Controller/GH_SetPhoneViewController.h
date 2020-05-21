//
//  GH_SetPhoneViewController.h
//  WangLawyer
//
//  Created by ZhiYuan on 2019/9/12.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^changePhone)(void);
@interface GH_SetPhoneViewController : BaseViewController
@property (nonatomic, strong)changePhone block;
@end

NS_ASSUME_NONNULL_END
