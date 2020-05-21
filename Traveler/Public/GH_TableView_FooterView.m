//
//  GH_TableView_FooterView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_TableView_FooterView.h"

@interface GH_TableView_FooterView ()
@property (nonatomic, strong)GH_PublicButton * share;
@property (nonatomic, strong)GH_PublicButton * comments;
@property (nonatomic, strong)GH_PublicButton * like;
@property (nonatomic, strong)GH_PublicButton * report;
@property (nonatomic, strong)UIView * linew;
@end

@implementation GH_TableView_FooterView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.share];
    [self addSubview:self.like];
    [self addSubview:self.report];
    [self addSubview:self.comments];
    [self addSubview:self.linew];
    [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(-GH_WidthScale(10));
        make.centerY.equalTo(self);
    }];
    
    [self.comments mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.share);
        make.right.equalTo(self.share.mas_left).mas_offset(-GH_WidthScale(20));
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.share);
        make.right.equalTo(self.comments.mas_left).mas_offset(-GH_WidthScale(20));
    }];
    
    [self.report mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.share);
        make.left.equalTo(self);
    }];
    [self.linew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
}
- (UIView *)linew{
    if (!_linew) {
        _linew = [UIView new];
        _linew.backgroundColor = Colors(@"#E2E2E2");
    }
    return _linew;
}
- (GH_PublicButton *)share{
    if (!_share) {
        _share = [[GH_PublicButton alloc]initWithFrame:CGRectZero imageUrl:@"" title:@"666" textColor:@"#666666" textFont:Fonts(12)];
    }
    return _share;
}
- (GH_PublicButton *)like{
    if (!_like) {
        _like = [[GH_PublicButton alloc]initWithFrame:CGRectZero imageUrl:@"" title:@"666" textColor:@"#666666" textFont:Fonts(12)];
    }
    return _like;
}

- (GH_PublicButton *)comments{
    if (!_comments) {
        _comments = [[GH_PublicButton alloc]initWithFrame:CGRectZero imageUrl:@"" title:@"666" textColor:@"#666666" textFont:Fonts(12)];
    }
    return _comments;
}

- (GH_PublicButton *)report{
    if (!_report) {
        _report = [[GH_PublicButton alloc]initWithFrame:CGRectZero imageUrl:@"" title:@"举报" textColor:@"#666666" textFont:Fonts(12)];
        [_report addTarget:self action:@selector(reportAction) forControlEvents:UIControlEventTouchDown];
    }
    return _report;
}

- (void)reportAction{
    GH_ReportViewController * vc = [GH_ReportViewController new];
    UIViewController * v = [GH_Tools findVisibleViewController];
    [v.navigationController pushViewController:vc animated:YES];
}

@end
