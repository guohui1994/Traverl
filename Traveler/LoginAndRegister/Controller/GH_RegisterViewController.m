//
//  GH_RegisterViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/24.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_RegisterViewController.h"
#import "GH_PublicTextView.h"
#import "GH_PhoneLoginViewController.h"
@interface GH_RegisterViewController ()
@property (nonatomic, strong)GH_PublicTextView * phoneTextField;//手机号
@property (nonatomic, strong)GH_PublicTextView * codeTextField;//手机号
@property (nonatomic, strong)GH_PublicTextView * passwordTextField;//密码
@property (nonatomic, strong)GH_PublicTextView * surePasswordTextField;//确认密码密码
@property (nonatomic, strong)UIButton * loginBt;//
@property (nonatomic, strong)UIButton * registerBt;
@property (nonatomic, strong)UIButton * selectAgree;
@property (nonatomic, strong)UILabel * agreeLable;
@property (nonatomic, strong)UIButton * phoneLogin;

@end

@implementation GH_RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"注册";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatUI];
    // Do any additional setup after loading the view.
}
- (void)creatUI{
    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(15));
        make.right.equalTo(self.view.mas_right).mas_offset(-GH_WidthScale(15));
        make.top.equalTo(self.view).mas_offset(GH_HeightScale(100) + Height_NavBar);
        make.height.equalTo(@(GH_HeightScale(52)));
    }];
    [self.view addSubview:self.codeTextField];
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.phoneTextField);
        make.top.equalTo(self.phoneTextField.mas_bottom).mas_offset(GH_HeightScale(3));
    }];
    [self.view addSubview:self.passwordTextField];
       [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.right.height.equalTo(self.phoneTextField);
           make.top.equalTo(self.codeTextField.mas_bottom).mas_offset(GH_HeightScale(3));
       }];
    [self.view addSubview:self.surePasswordTextField];
    [self.surePasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.phoneTextField);
        make.top.equalTo(self.passwordTextField.mas_bottom).mas_offset(GH_HeightScale(3));
    }];
    
    [self.view addSubview:self.loginBt];
    [self.loginBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(38));
        make.top.equalTo(self.surePasswordTextField.mas_bottom).mas_offset(GH_HeightScale(40));
    }];
    [self.view addSubview:self.phoneLogin];
    [self.phoneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.loginBt);
        make.right.equalTo(self.view).mas_offset(-GH_WidthScale(38));
    }];
    [self.view addSubview:self.registerBt];
    [self.registerBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.loginBt.mas_bottom).mas_offset(GH_HeightScale(20));
        make.width.equalTo(@(GH_WidthScale(300)));
        make.height.equalTo(@(GH_HeightScale(40)));
    }];
    [self.view addSubview:self.selectAgree];
    [self.selectAgree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registerBt);
        make.top.equalTo(self.registerBt.mas_bottom).mas_offset(10);
        make.width.height.equalTo(@(GH_WidthScale(18)));
    }];
    
    [self.view addSubview:self.agreeLable];
    [self.agreeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.selectAgree);
        make.left.equalTo(self.selectAgree.mas_right).mas_offset(GH_WidthScale(8));

    }];
}

- (GH_PublicTextView *)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"账号: " placeHolder:@"请输入您的账号" type:typeAndeNone text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _phoneTextField;
}

- (GH_PublicTextView *)codeTextField{
    if (!_codeTextField) {
        _codeTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"验证码" placeHolder:@"请输入验证码" type:typeAndGetCode text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _codeTextField;
}

- (GH_PublicTextView *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"密码: " placeHolder:@"请输入您的密码" type:typeAndScreentInput text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _passwordTextField;
}
- (GH_PublicTextView *)surePasswordTextField{
    if (!_surePasswordTextField) {
        _surePasswordTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"确认密码: " placeHolder:@"请输入您的密码" type:typeAndeNone text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _surePasswordTextField;
}

- (UIButton *)loginBt{
    if (!_loginBt) {
        _loginBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBt setTitle:@"有账号，直接登录" forState:UIControlStateNormal];
        [_loginBt setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _loginBt.titleLabel.font = Fonts(14);
        [_loginBt addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchDown];
    }
    return _loginBt;
}

- (UIButton *)phoneLogin{
    if (!_phoneLogin) {
       _phoneLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_phoneLogin setTitle:@"手机号快速登录" forState:UIControlStateNormal];
        [_phoneLogin setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _phoneLogin.titleLabel.font = Fonts(14);
        [_phoneLogin addTarget:self action:@selector(phoneCodeLogin) forControlEvents:UIControlEventTouchDown];
    }
    return _phoneLogin;
}
- (void)phoneCodeLogin{
    GH_PhoneLoginViewController * vc =[ GH_PhoneLoginViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)loginAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)registerBt{
    if (!_registerBt) {
        _registerBt= [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBt.layer addSublayer:[GH_Tools changColorWithWidth:GH_WidthScale(300) height:GH_HeightScale(40) Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
       _registerBt.layer.cornerRadius = GH_WidthScale(5);
       _registerBt.clipsToBounds = YES;
        [_registerBt setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBt setTitleColor:Colors(@"##FFFFFF") forState:UIControlStateNormal];
       _registerBt.titleLabel.font = Fonts(16);
       _registerBt.layer.cornerRadius = GH_WidthScale(5);
        [_registerBt addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchDown];
    }
    return _registerBt;
}

- (void)registerAction{
    NSLog(@"注册");
}

- (UIButton *)selectAgree{
    if (!_selectAgree) {
        _selectAgree = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectAgree.backgroundColor = [UIColor redColor];
    }
    return _selectAgree;
}

- (UILabel *)agreeLable{
    if (!_agreeLable) {
        _agreeLable = [UILabel new];
        _agreeLable.text = @"我已阅读并同意《用户协议》";
        _agreeLable.textColor = Colors(@"#666666");
        _agreeLable.font = Fonts(14);
    }
    return _agreeLable;
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
