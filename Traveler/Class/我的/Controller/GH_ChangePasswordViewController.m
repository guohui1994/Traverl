//
//  GH_ChangePasswordViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_ChangePasswordViewController.h"
#import "GH_PublicTextView.h"
@interface GH_ChangePasswordViewController ()
@property (nonatomic, strong)UILabel * phoneLable;
@property (nonatomic, strong)GH_PublicTextView * codeTextField;//手机号
@property (nonatomic, strong)GH_PublicTextView * passwordTextField;//密码
@property (nonatomic, strong)GH_PublicTextView * surePasswordTextField;//确认密码密码
@end

@implementation GH_ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"修改密码";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
}
- (void)creatUI{
    UIView * whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = GH_WidthScale(5);
    [self.view addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(GH_HeightScale(15) + Height_NavBar);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(235)));
    }];
    [whiteView addSubview:self.phoneLable];
    [self.phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whiteView);
        make.top.equalTo(whiteView).mas_offset(GH_HeightScale(15));
    }];
    
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(whiteView);
        make.top.equalTo(self.phoneLable.mas_bottom).mas_offset(GH_HeightScale(35)); make.height.equalTo(@(GH_HeightScale(52)));
       }];
       [self.view addSubview:self.surePasswordTextField];
       [self.surePasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.right.height.equalTo(self.passwordTextField);
           make.top.equalTo(self.passwordTextField.mas_bottom).mas_offset(GH_HeightScale(0));
       }];
       [self.view addSubview:self.codeTextField];
       [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.right.height.equalTo(self.surePasswordTextField);
           make.top.equalTo(self.surePasswordTextField.mas_bottom).mas_offset(GH_HeightScale(0));
       }];
    
}

- (UILabel *)phoneLable{
    if (!_phoneLable) {
        _phoneLable = [UILabel new];
        _phoneLable.text = @"此账号绑定手机号：15169857423";
        _phoneLable.textColor = Colors(@"#333333");
        _phoneLable.font = BoldFont(16);
    }
    return _phoneLable;
}

- (GH_PublicTextView *)codeTextField{
    if (!_codeTextField) {
        _codeTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"验证码" placeHolder:@"验证码输入" type:typeAndGetCode text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _codeTextField;
}

- (GH_PublicTextView *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"密码: " placeHolder:@"6-20位数字、字母组合" type:typeAndScreentInput text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _passwordTextField;
}
- (GH_PublicTextView *)surePasswordTextField{
    if (!_surePasswordTextField) {
        _surePasswordTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"确认密码: " placeHolder:@"6-20位数字、字母组合" type:typeAndeNone text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _surePasswordTextField;
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
