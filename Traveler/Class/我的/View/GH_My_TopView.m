//
//  GH_My_TopView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_TopView.h"


@class publicButton;

@interface publicButton : UIButton
@property (nonatomic, strong)UILabel * nameLable;

@property (nonatomic, strong)UILabel * countLable;

@property (nonatomic, copy)NSString * nameString;
@property (nonatomic, copy)NSString * coutString;
@end

@implementation publicButton

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
        make.top.equalTo(self).mas_offset(5);
    }];
    
    [self.countLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.nameLable.mas_bottom).mas_offset(4);
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


@interface GH_My_TopView ()

@property (nonatomic, strong)UIImageView * bgImageView;

@property (nonatomic, strong)UIImageView * headerImage;

@property (nonatomic, strong)UILabel * nickNameLable;

@property (nonatomic, strong)UILabel * IDLable;

@property (nonatomic, strong)UIButton * editBt;

@property (nonatomic, strong)UIButton * messageBt;

@property (nonatomic, strong)UIView * signatureView;

@property (nonatomic, strong)publicButton * fouceBt;

@property (nonatomic, strong)publicButton * fansBt;

@end

@implementation GH_My_TopView

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.headerImage];
    [self.bgImageView addSubview:self.nickNameLable];
    [self.bgImageView addSubview:self.IDLable];
    [self.bgImageView addSubview:self.editBt];
    [self.bgImageView addSubview:self.messageBt];
    [self.bgImageView addSubview:self.signatureView];
    [self.bgImageView addSubview:self.fouceBt];
    [self.bgImageView addSubview:self.fansBt];
    [self layout];
}

- (void)layout{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView).mas_offset(GH_WidthScale(12));
        make.top.equalTo(self.bgImageView).mas_offset(GH_HeightScale(10) + Height_StatusBar);
        make.width.height.equalTo(@(GH_WidthScale(55)));
    }];
    [self.nickNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImage.mas_right).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self.headerImage.mas_top).mas_offset(GH_HeightScale(5));
        make.right.equalTo(self.bgImageView.mas_right).mas_offset(-GH_WidthScale(80));
    }];
    [self.IDLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nickNameLable);
        make.top.equalTo(self.nickNameLable.mas_bottom).mas_offset(GH_HeightScale(2));
    }];
    
    [self.messageBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgImageView.mas_right).mas_offset(-GH_WidthScale(12));
        make.top.equalTo(self.bgImageView).mas_offset(Height_StatusBar + GH_HeightScale(19));
        make.width.height.equalTo(@(GH_WidthScale(21)));
    }];
    [self.editBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.messageBt.mas_left).mas_offset(-GH_WidthScale(22));
        make.width.height.centerY.equalTo(self.messageBt);
    }];
    
    [self.signatureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self.headerImage.mas_bottom).mas_offset(GH_HeightScale(10));
        make.right.equalTo(self.bgImageView.mas_right).mas_offset(-GH_WidthScale(10));
        make.height.equalTo(@(GH_HeightScale(24)));
    }];
    [self.fouceBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgImageView);
        make.top.equalTo(self.signatureView.mas_bottom).mas_offset(GH_HeightScale(5));
        make.left.equalTo(self.bgImageView);
        make.width.equalTo(@(screenWidth / 2));
    }];
    [self.fansBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.fouceBt);
        make.left.equalTo(self.fouceBt.mas_right);
    }];
}


- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
        _bgImageView.backgroundColor = [UIColor blueColor];
        _bgImageView.userInteractionEnabled = YES;
        
    }
    return _bgImageView;
}

- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = [UIColor redColor];
        _headerImage.layer.cornerRadius = GH_WidthScale(27.5);
        _headerImage.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapA)];
        [_headerImage addGestureRecognizer:tap];
    }
    return _headerImage;
}
- (void)tapA{
    if (self.headerBlock) {
        self.headerBlock();
    }
}

- (UILabel *)nickNameLable{
    if (!_nickNameLable) {
        _nickNameLable = [UILabel new];
        _nickNameLable.text = @"别怕我伤心";
        _nickNameLable.textColor = Colors(@"#FFFFFF");
        _nickNameLable.font = Fonts(17);
    }
    return _nickNameLable;
}
- (UILabel *)IDLable{
    if (!_IDLable) {
        _IDLable = [UILabel new];
        _IDLable.text = @"ID：786495";
        _IDLable.textColor = Colors(@"#FFFFFF");
        _IDLable.font = Fonts(14);
    }
    return _IDLable;
}

- (UIButton *)editBt{
    if (!_editBt) {
        _editBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _editBt.backgroundColor = [UIColor yellowColor];
        [_editBt addTarget:self action:@selector(editA) forControlEvents:UIControlEventTouchDown];
    }
    return _editBt;
}
- (void)editA{
    if (self.editBlock) {
        self.editBlock();
    }
}

- (UIButton *)messageBt{
    if (!_messageBt) {
        _messageBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageBt.backgroundColor = [UIColor grayColor];
        [_messageBt addTarget:self action:@selector(messageA) forControlEvents:UIControlEventTouchDown];
    }
    return _messageBt;
}
- (void)messageA{
    if (self.messBlock) {
        self.messBlock();
    }
}

- (UIView *)signatureView{
    if(!_signatureView){
        _signatureView = [UIView new];
        _signatureView.backgroundColor = [UIColor redColor];
    }
    return _signatureView;
}

- (publicButton *)fouceBt{
    if (!_fouceBt) {
        _fouceBt = [[publicButton alloc]initWithFrame:CGRectZero];
        [_fouceBt addTarget:self action:@selector(fouceOnA) forControlEvents:UIControlEventTouchDown];
    }
    return _fouceBt;
}
- (void)fouceOnA{
    if (self.fouceOnBlock) {
        self.fouceOnBlock();
    }
}
- (publicButton *)fansBt{
    if (!_fansBt) {
        _fansBt = [[publicButton alloc]initWithFrame:CGRectZero];
        _fansBt.nameString = @"粉丝";
        [_fansBt addTarget:self action:@selector(fansA) forControlEvents:UIControlEventTouchDown];
    }
    return _fansBt;
}
- (void)fansA{
    if (self.fansBlock) {
        self.fansBlock();
    }
}
@end
