//
//  GH_My_CenterView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_CenterView.h"
@class publicButton1;

@interface publicButton1 : UIButton
@property (nonatomic, strong)UILabel * nameLable;

@property (nonatomic, strong)UILabel * countLable;

@property (nonatomic, copy)NSString * nameString;
@property (nonatomic, copy)NSString * nameColor;
@property (nonatomic, strong)UIFont * nameFont;
@property (nonatomic, copy)NSString * coutString;
@property (nonatomic, copy)NSString * coutColor;
@property (nonatomic, strong)UIFont * countFont;
@end

@implementation publicButton1

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.nameLable];
    [self addSubview:self.countLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).mas_offset(GH_HeightScale(8));
    }];
    
    [self.countLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.nameLable.mas_bottom).mas_offset(GH_HeightScale(12));
    }];
}

- (void)setNameString:(NSString *)nameString{
    _nameString = nameString;
    _nameLable.text = nameString;
}

- (void)setCoutString:(NSString *)coutString{
    _coutString = coutString;
    _countLable.text = coutString;
}
- (void)setNameColor:(NSString *)nameColor{
    _nameColor = nameColor;
    _nameLable.textColor = Colors(nameColor);
}
- (void)setNameFont:(UIFont *)nameFont{
    _nameFont = nameFont;
    _nameLable.font = nameFont;
}
- (void)setCoutColor:(NSString *)coutColor{
    _coutColor = coutColor;
    _countLable.textColor = Colors(coutColor);
}
- (void)setCountFont:(UIFont *)countFont{
    _countFont = countFont;
    _countLable.font = countFont;
}


- (UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [UILabel new];
        _nameLable.text = @"关注";
        _nameLable.textColor = [UIColor whiteColor];
        _nameLable.font = Fonts(16);
    }
    return _nameLable;
}

- (UILabel *)countLable{
    if (!_countLable) {
        _countLable = [UILabel new];
        _countLable.text = @"999999999999999";
        _countLable.font = Fonts(16);
        _countLable.textColor = [UIColor whiteColor];
    }
    return _countLable;
}

@end

@interface GH_My_CenterView ()

@property (nonatomic, strong)publicButton1 * personCout;
@property (nonatomic, strong)publicButton1 * dayCount;
@property (nonatomic, strong)UIView * rightView;
@property (nonatomic, strong)UIButton * dakaRecord;
@property (nonatomic, strong)UIButton * daka;
@end

@implementation GH_My_CenterView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.personCout];
    [self addSubview:self.dayCount];
    [self addSubview:self.rightView];
    [self.rightView addSubview:self.dakaRecord];
    [self.rightView addSubview:self.daka];
    [self.personCout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(GH_WidthScale(351) / 3));
    }];
    
    [self.dayCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.personCout);
        make.left.equalTo(self.personCout.mas_right);
    }];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.equalTo(self.personCout);
    }];
    [self.dakaRecord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.rightView);
        make.top.equalTo(self.rightView).mas_offset(GH_HeightScale(5));
    }];
    [self.daka mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dakaRecord.mas_right);
        make.top.equalTo(self.dakaRecord.mas_bottom).mas_offset(GH_HeightScale(8));
        make.width.equalTo(@(GH_WidthScale(50)));
        make.height.equalTo(@(GH_HeightScale(29)));
    }];
    
}

- (publicButton1 *)personCout{
    if (!_personCout) {
        _personCout = [[publicButton1 alloc]initWithFrame:CGRectZero];
        _personCout.nameString = @"打卡人数(人)";
        _personCout.nameFont = Fonts(14);
        _personCout.nameColor = @"#333333";
        _personCout.coutString = @"999";
        _personCout.countFont = Fonts(16);
        _personCout.coutColor = @"#666666";
    }
    return _personCout;
}

- (publicButton1 *)dayCount{
    if (!_dayCount) {
        _dayCount = [[publicButton1 alloc]initWithFrame:CGRectZero];
        _dayCount.coutString = @"999";
        _dayCount.nameString = @"我已打卡（天）";
        _dayCount.nameFont = Fonts(14);
        _dayCount.nameColor = @"#333333";
        _dayCount.countFont = Fonts(16);
        _dayCount.coutColor = @"#666666";
    }
    return _dayCount;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
    }
    return _rightView;
}
- (UIButton *)dakaRecord{
    if (!_dakaRecord) {
        _dakaRecord = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dakaRecord setTitle:@"我的打卡记录 >" forState:UIControlStateNormal];
        [_dakaRecord setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _dakaRecord.titleLabel.font = Fonts(12);
        [_dakaRecord addTarget:self action:@selector(dakaRecordA) forControlEvents:UIControlEventTouchDown];
    }
    return _dakaRecord;
}
- (void)dakaRecordA{
    
    if (self.dakaReBlock) {
        self.dakaReBlock();
    }
}

- (UIButton *)daka{
    if (!_daka) {
        _daka = [UIButton buttonWithType:UIButtonTypeCustom];
        [_daka.layer addSublayer:[GH_Tools changColorWithWidth:GH_WidthScale(50) height:GH_HeightScale(29) Color:@"##439BF9" discolorationColor:@"#4BC6EF"]];
        [_daka setTitle:@"打卡" forState:UIControlStateNormal];
        [_daka setTitleColor:Colors(@"#FFFFFF") forState:UIControlStateNormal];
        _daka.titleLabel.font = Fonts(15);
        _daka.layer.cornerRadius = GH_WidthScale(5);
        _daka.clipsToBounds = YES;
        [_daka addTarget:self action:@selector(dakaA) forControlEvents:UIControlEventTouchDown];
    }
    return _daka;
}
- (void)dakaA{
    if (self.dakaBlock) {
        self.dakaBlock();
    }
}

@end
