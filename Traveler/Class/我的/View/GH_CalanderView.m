//
//  GH_CalanderView.m
//  zhichengEducation
//
//  Created by ZhiYuan on 2019/12/3.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "GH_CalanderView.h"
#import "YQCalendarView.h"

@interface GH_CalanderView ()<YQCalendarViewDelegate>
@property (nonatomic, strong)YQCalendarView *CalendarView;
@end

@implementation GH_CalanderView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}


- (void)setCalanderArray:(NSArray *)calanderArray{
    _calanderArray = calanderArray;
    self.CalendarView.selectedArray = calanderArray;
}

- (void)creatUI{
    
//    [self.CalendarView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self);
//        make.width.equalTo(@( screenWidth));
//        make.height.equalTo(@(GH_HeightScale(582)));
//    }];
    
    self.CalendarView = [[YQCalendarView alloc]initWithFrame:CGRectMake(GH_WidthScale(0),
                                                                                   0,
                                                                                    GH_WidthScale(351),
                                                                                   GH_HeightScale(194))];
    self.CalendarView.layer.cornerRadius = GH_WidthScale(12);
    self.CalendarView.clipsToBounds = YES;
    self.CalendarView.nextBTNIcon = Images(@"My_Calander_NextMonth");
    self.CalendarView.preBTNIcon = Images(@"back");
    self.CalendarView.delegate = self;
//    设置选中的日期，格式 yyyy-MM-dd (数组)
    self.CalendarView.selectedArray = @[@"2019-11-23",
                                   @"2020-11-21",
                                   @"2020-11-20",
                                   @"2020-11-15",
                                   @"2020-11-12",
                                   @"2020-11-05",
                                   @"2020-11-26",
                                   @"2020-11-29",
                                   @"2020-11-14",
                                   @"2020-11-20",
                                   @"2020-11-24",
                                   ];

//    单独添加选中个某一天
//    [self.CalendarView AddToChooseOneDay:@"2019-11-24"];
    WeakSelf
    self.CalendarView.yearsAndMonthBlock = ^(NSString *yearsAndeMonthString) {
        if (weakSelf.yearsAndMonthBlock) {
            weakSelf.yearsAndMonthBlock(yearsAndeMonthString);
        }
    };
    [self addSubview:self.CalendarView];
}


/**
 日历代理----点击某一天
 
 @param dateString 点击的天
 */
-(void)YQCalendarViewTouchedOneDay:(NSString *)dateString{
    if (self.block) {
        self.block(dateString);
    }
}

//- (YQCalendarView *)CalendarView{
//    if (!_CalendarView) {
//        _CalendarView =  [[YQCalendarView alloc]init];
//        _CalendarView.layer.cornerRadius = GH_WidthScale(12);
//        _CalendarView.clipsToBounds = YES;
//        _CalendarView.nextBTNIcon = Images(@"My_Calander_NextMonth");
//        _CalendarView.preBTNIcon = Images(@"back");
//        _CalendarView.delegate = self;
//    }
//    return _CalendarView;
//}

@end
