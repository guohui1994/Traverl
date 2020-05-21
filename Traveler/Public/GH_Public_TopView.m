//
//  GH_Public_TopView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_Public_TopView.h"

@interface GH_Public_TopView ()

@property (nonatomic, strong)UIButton * firstBt;

@property (nonatomic, strong)UIButton * secondBt;

@property (nonatomic, strong)UIView * lineView;

@property (nonatomic, strong)UIView * lineView1;
@property (nonatomic, strong)UIView * lineView2;
@end


@implementation GH_Public_TopView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.lineView];
    [self addSubview:self.firstBt];
    [self addSubview:self.secondBt];
    [self.firstBt addSubview:self.lineView1];
    [self.secondBt addSubview:self.lineView2];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.height.equalTo(@(10));
        make.width.equalTo(@(1));
    }];
    
    [self.firstBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.lineView.mas_left).mas_offset(-GH_WidthScale(28));
        make.width.equalTo(@(GH_WidthScale(50)));
    }];
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.firstBt);
        make.height.equalTo(@(1));
    }];
    
    [self.secondBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.lineView.mas_right).mas_offset(GH_WidthScale(28));
         make.width.equalTo(@(GH_WidthScale(50)));
    }];
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.right.bottom.equalTo(self.secondBt);
           make.height.equalTo(@(1));
       }];
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor clearColor];
    }
    return _lineView;
}

- (UIButton *)firstBt{
    if (!_firstBt) {
        _firstBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_firstBt setTitle:@"热议" forState:UIControlStateNormal];
        [_firstBt setTitleColor:Colors(@"#999999") forState:UIControlStateNormal];
        [_firstBt setTitleColor:Colors(@"#439CF6") forState:UIControlStateSelected];
        _firstBt.titleLabel.font = Fonts(17);
        _firstBt.selected = YES;
        [_firstBt addTarget:self action:@selector(firstBtAction) forControlEvents:UIControlEventTouchDown];
    }
    return _firstBt;
}
- (UIButton *)secondBt{
    if (!_secondBt) {
        _secondBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_secondBt setTitle:@"总结" forState:UIControlStateNormal];
        [_secondBt setTitleColor:Colors(@"#999999") forState:UIControlStateNormal];
        [_secondBt setTitleColor:Colors(@"#439CF6") forState:UIControlStateSelected];
        _secondBt.titleLabel.font = Fonts(17);
        [_secondBt addTarget:self action:@selector(secondBtAction) forControlEvents:UIControlEventTouchDown];
    }
    return _secondBt;
}
- (UIView *)lineView1{
    if (!_lineView1) {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = Colors(@"#52DDFF");
    }
    return _lineView1;
}

- (UIView *)lineView2{
    if (!_lineView2) {
        _lineView2= [UIView new];
        _lineView2.backgroundColor = Colors(@"#52DDFF");
        _lineView2.hidden = YES;
    }
    return _lineView2;
}


- (void)firstBtAction{
    _firstBt.selected = YES;
    _secondBt.selected = NO;
    _lineView2.hidden = YES;
    _lineView1.hidden = NO;
    if (self.firstBlock) {
        self.firstBlock();
    }
}

- (void)secondBtAction{
    _firstBt.selected = NO;
    _secondBt.selected = YES;
    _lineView2.hidden = NO;
       _lineView1.hidden = YES;
    if (self.seconBlock) {
        self.seconBlock();
    }
}

@end
