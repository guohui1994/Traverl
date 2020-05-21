//
//  GH_TableView_HeaderView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/27.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_TableView_HeaderView.h"

@interface GH_TableView_HeaderView ()

@property (nonatomic, strong)UIImageView * headerImageView;

@property (nonatomic, strong)UILabel * nickName;

@property (nonatomic, strong)UIButton * like;

@end

@implementation GH_TableView_HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.headerImageView];
    [self addSubview:self.nickName];
    [self addSubview:self.like];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self).mas_offset(GH_HeightScale(20));
        make.width.height.equalTo(@(GH_WidthScale(40)));
    }];
    
    [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImageView);
        make.left.equalTo(self.headerImageView.mas_right).mas_offset(GH_WidthScale(10));
    }];
    
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_offset(-GH_WidthScale(10));
        make.top.equalTo(self.nickName);
    }];
}

- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [UIImageView new];
        _headerImageView.backgroundColor = [UIColor redColor];
        _headerImageView.layer.cornerRadius = GH_WidthScale(20);
    }
    return _headerImageView;
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [UILabel new];
        _nickName.text = @"奔跑的小包子";
        _nickName.textColor = Colors(@"#333333");
        _nickName.font = Fonts(16);
    }
    return _nickName;
}

- (UIButton *)like{
    if (!_like) {
        _like = [UIButton buttonWithType:UIButtonTypeCustom];
        [_like setTitle:@"2333" forState:UIControlStateNormal];
        [_like setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _like.titleLabel.font = Fonts(12);
    }
    return _like;
}

@end
