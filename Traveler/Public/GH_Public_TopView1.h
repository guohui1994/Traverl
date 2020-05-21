//
//  GH_Public_TopView1.h
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^firset)(void);
typedef void(^secon)(void);
typedef void(^thir)(void);
@interface GH_Public_TopView1 : UIView
@property (nonatomic, copy)firset firstBlock;
@property (nonatomic, copy)secon seconBlock;
@property (nonatomic, copy)thir thirBlock;
- (void)firstBtAction;
-(void)secondBtAction;
-(void)thirdBtAction;
@end

NS_ASSUME_NONNULL_END
