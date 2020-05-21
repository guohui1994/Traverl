//
//  GH_CalanderView.h
//  zhichengEducation
//
//  Created by ZhiYuan on 2019/12/3.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^selectData)(NSString * dataString);
typedef void(^YearsAndMonth)(NSString * yearsAndeMonthString);
@interface GH_CalanderView : UIView
@property (nonatomic, strong)NSArray * calanderArray;
@property (nonatomic, strong)selectData block;
@property (nonatomic, copy)YearsAndMonth yearsAndMonthBlock;
@end

NS_ASSUME_NONNULL_END
