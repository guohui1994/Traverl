//
//  GH_Public_TopView.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^firset)(void);
typedef void(^secon)(void);
@interface GH_Public_TopView : UIView

@property (nonatomic, copy)firset firstBlock;
@property (nonatomic, copy)secon seconBlock;

- (void)firstBtAction;
-(void)secondBtAction;

@end

NS_ASSUME_NONNULL_END
