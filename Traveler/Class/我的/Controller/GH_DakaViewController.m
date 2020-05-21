//
//  GH_DakaViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/16.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_DakaViewController.h"
#import "GH_CalanderView.h"
@interface GH_DakaViewController ()
@property (nonatomic, strong)GH_CalanderView * calanderView;
@property (nonatomic, strong)UILabel * timeLable;
@property (nonatomic, strong)UILabel * statisticalLable;//月份统计
@property (nonatomic, strong)UILabel * yearLable;//全年统计
@end

@implementation GH_DakaViewController

- (GH_CalanderView *)calanderView{
    if (!_calanderView) {
        _calanderView = [GH_CalanderView new];
        _calanderView.backgroundColor = [UIColor whiteColor];
        _calanderView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
        _calanderView.layer.shadowOffset = CGSizeMake(0,1);
        _calanderView.layer.shadowOpacity = 1;
        _calanderView.layer.shadowRadius = 8;
        _calanderView.layer.cornerRadius = 5;
        WeakSelf;
        _calanderView.yearsAndMonthBlock = ^(NSString * _Nonnull yearsAndeMonthString) {
            weakSelf.timeLable.text = yearsAndeMonthString;
        };
    }
    return _calanderView;
}

- (UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [UILabel new];
        _timeLable.textColor =Colors(@"#666666");
        _timeLable.font = Fonts(11);
        _timeLable.text = @"2020.05";
    }
    return _timeLable;
}

- (UILabel *)statisticalLable{
    if (!_statisticalLable) {
        _statisticalLable = [UILabel new];
        _statisticalLable.text = @"2019年9月：打卡25天  未打卡5天";
        _statisticalLable.textColor = Colors(@"#333333");
        _statisticalLable.font = Fonts(12);
    }
    return _statisticalLable;
}

- (UILabel *)yearLable{
    if (!_yearLable) {
        _yearLable = [UILabel new];
        _yearLable.text = @"2019年：打卡276天  未打卡15天";
        _yearLable.textColor = Colors(@"#666666");
        _yearLable.font = Fonts(12);
    }
    return _yearLable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"打卡记录";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    self.fd_interactivePopDisabled = true;
}
- (void)creatUI{
    [self.view addSubview:self.calanderView];
    [self.calanderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(GH_HeightScale(31) + Height_NavBar);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(194)));
    }];
    [self.view addSubview:self.timeLable];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.calanderView.mas_top).mas_offset(-GH_HeightScale(10));
        make.right.equalTo(self.calanderView);
    }];
    
    [self.view addSubview:self.statisticalLable];
    [self.statisticalLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLable);
        make.left.equalTo(self.calanderView);
    }];
    [self.view addSubview:self.yearLable];
    [self.yearLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(22));
        make.top.equalTo(self.calanderView.mas_bottom).mas_offset(GH_HeightScale(15));
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
