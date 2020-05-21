//
//  GH_AddView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_AddView.h"


@interface GH_AddView ()

@property (nonatomic, strong)UIButton * riLuBt;

@property (nonatomic, strong)UIButton * yueLuBt;

@property (nonatomic, strong)UIButton * xingQuBt;

@end

@implementation GH_AddView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.riLuBt];
    [self addSubview:self.yueLuBt];
    [self addSubview:self.xingQuBt];
    [self.riLuBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(@(GH_HeightScale(85) / 3));
    }];
    [self.yueLuBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(self.riLuBt);
        make.top.equalTo(self.riLuBt.mas_bottom);
    }];
    [self.xingQuBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
               make.height.equalTo(self.riLuBt);
               make.top.equalTo(self.yueLuBt.mas_bottom);
    }];
}

- (UIButton *)riLuBt{
    if (!_riLuBt) {
        _riLuBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_riLuBt setTitle:@"日录" forState:UIControlStateNormal];
        [_riLuBt setTitleColor:Colors(@"#999999") forState:UIControlStateNormal];
        [_riLuBt setTitleColor:Colors(@"#439CF6") forState:UIControlStateSelected];
        _riLuBt.titleLabel.font = Fonts(14);
        [_riLuBt addTarget:self action:@selector(riluA) forControlEvents:UIControlEventTouchDown];
    }
    return _riLuBt;
}

- (UIButton *)yueLuBt{
    if (!_yueLuBt) {
        _yueLuBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_yueLuBt setTitle:@"月录" forState:UIControlStateNormal];
        [_yueLuBt setTitleColor:Colors(@"#999999") forState:UIControlStateNormal];
        [_yueLuBt setTitleColor:Colors(@"#439CF6") forState:UIControlStateSelected];
        _yueLuBt.titleLabel.font = Fonts(14);
        [_yueLuBt addTarget:self action:@selector(yueLuA) forControlEvents:UIControlEventTouchDown];
    }
    return _yueLuBt;
}
- (UIButton *)xingQuBt{
    if (!_xingQuBt) {
        _xingQuBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xingQuBt setTitle:@"兴趣" forState:UIControlStateNormal];
        [_xingQuBt setTitleColor:Colors(@"#999999") forState:UIControlStateNormal];
        [_xingQuBt setTitleColor:Colors(@"#439CF6") forState:UIControlStateSelected];
        _xingQuBt.titleLabel.font = Fonts(14);
        [_xingQuBt addTarget:self action:@selector(xingQA) forControlEvents:UIControlEventTouchDown];
    }
    return _xingQuBt;
}

- (void)riluA{
    if (self.riLuBlock) {
        self.riLuBlock();
    }
}
- (void)yueLuA{
    if (self.yueLuBlock) {
        self.yueLuBlock();
    }
}
- (void)xingQA{
    if (self.xingQueBlock) {
        self.xingQueBlock();
    }
}

@end
