//
//  GH_MJHeader.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_MJHeader.h"

@implementation GH_MJHeader
- (void)prepare{
    [super prepare];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    //    self.automaticallyChangeAlpha = YES;
    
    // 设置控件的高度
    self.mj_h = 50;
    
    //    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    //
    //    // 隐藏状态
    //        self.stateLabel.hidden = YES;
    
    self.automaticallyChangeAlpha = YES;
    //        self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    //        self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
