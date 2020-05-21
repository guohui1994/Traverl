//
//  GH_PublicTextView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_PublicTextView.h"

@interface GH_PublicTextView ()<UITextFieldDelegate>

@property (nonatomic, strong)UIImageView * headerImage;//前面头像

@property (nonatomic, strong)UILabel * titleLable;//标题

@property (nonatomic, strong)UIView * textView;//输入框按钮

@property (nonatomic, strong)UITextField * textField;//输入框

@property (nonatomic, strong)UIButton * getCode;//获取验证码 按钮

@property (nonatomic, strong)UIButton * screetBt;//是否密文输入按钮

@property (nonatomic, strong)textFieldBlock textBlock;
@end

@implementation GH_PublicTextView

- (id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title placeHolder:(NSString *)placeHolder type:(textViewType)type text:(textFieldBlock)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textBlock = text;
        [self creatUI:imageName title:title placeHolder:placeHolder type:type];
    }
    return self;
}

- (void)creatUI:(NSString*)imageName title:(NSString *)title placeHolder:(NSString *)placeHolder type:(textViewType)type{
    self.headerImage.image = Images(imageName);
    [self addSubview:self.headerImage];
    self.titleLable.text = title;
    [self addSubview:self.titleLable];
    [self addSubview:self.textView];
    self.textField.attributedPlaceholder = [GH_Tools attributedStringWithString:placeHolder color:@"#999999" font:GH_WidthScale(16) length:placeHolder.length];
    [self.textView addSubview:self.textField];
    [self.textView addSubview:self.screetBt];
    [self.textView addSubview:self.getCode];
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).mas_offset(GH_WidthScale(16));
        make.width.height.equalTo(@(GH_WidthScale(12)));
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.headerImage.mas_right).mas_offset(GH_WidthScale(10));
//        make.width.equalTo(@(GH_WidthScale(48.5)));
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.equalTo(@(GH_WidthScale(240)));
        make.height.equalTo(@(GH_HeightScale(34)));
        make.left.equalTo(self.titleLable.mas_right).mas_offset(GH_WidthScale(10));
    }];
    
    if (type == typeAndeNone) {
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textView).mas_offset(GH_WidthScale(10));
            make.top.right.bottom.equalTo(self.textView);
        }];
    }else if (type == typeAndScreentInput){
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textView).mas_offset(GH_WidthScale(10));
            make.top.bottom.equalTo(self.textView);
            make.right.equalTo(self.textView.mas_right).mas_offset(-GH_WidthScale(20));
        }];
        [self.screetBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self.textView);
            make.width.equalTo(@(GH_WidthScale(30)));
        }];
    }else{
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textView).mas_offset(GH_WidthScale(10));
            make.top.bottom.equalTo(self.textView);
            make.right.equalTo(self.textView.mas_right).mas_offset(-GH_WidthScale(95));
        }];
        [self.getCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.centerY.equalTo(self.textView);
            make.width.equalTo(@(GH_WidthScale(86)));
            make.height.equalTo(@(GH_HeightScale(29)));
        }];
    }
}

#pragma mark -- UITextField  代理

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.textBlock) {
        self.textBlock(textField.text);
    }
}

/**
 密文切换
 */
- (void)screetInPut{
    self.textField.secureTextEntry = !self.textField.isSecureTextEntry;
}

#pragma mark --- 懒加载
- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = [UIColor redColor];
    }
    return _headerImage;
}

-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.textColor = Colors(@"#666666");
        _titleLable.font = Fonts(16);
    }
    return _titleLable;
}

- (UIView *)textView{
    if (!_textView) {
        _textView = [UIView new];
        _textView.layer.cornerRadius = GH_WidthScale(5);
//        _textView.layer.borderColor = Colors(@"#EEEEEE").CGColor;
//        _textView.layer.borderWidth = 1;
        _textView.clipsToBounds = YES;
    }
    return _textView;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)screetBt{
    if (!_screetBt) {
        _screetBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _screetBt.backgroundColor = [UIColor blueColor];
        [_screetBt addTarget:self action:@selector(screetInPut) forControlEvents:UIControlEventTouchDown];
    }
    return _screetBt;
}

- (UIButton *)getCode{
    if (!_getCode) {
        _getCode = [UIButton buttonWithType:UIButtonTypeCustom];
        _getCode.backgroundColor = Colors(@"#F0F0F0");
        [_getCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getCode setTitleColor:Colors(@"#333333") forState:UIControlStateNormal];
        _getCode.titleLabel.font = Fonts(14);
        _getCode.layer.cornerRadius = GH_WidthScale(5);
    }
    return _getCode;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
