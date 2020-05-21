//
//  GH_LoginViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_LoginViewController.h"
#import "GH_PublicTextView.h"
#import "GH_RegisterViewController.h"
#import "GH_ForgetPasswordViewController.h"
@interface GH_LoginViewController ()
@property (nonatomic, strong)GH_PublicTextView * phoneTextField;//手机号
@property (nonatomic, strong)GH_PublicTextView * passwordTextField;//密码
@property (nonatomic, strong)UIButton * forgetPassWord;//忘记密码
@property (nonatomic, strong)UIButton * loginBt;//登录
@property (nonatomic, strong)UIButton * registerBt;//注册
@end

@implementation GH_LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"登录";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatUI];
   
}


/**
 忘记密码
 */
- (void)forgetPassWordAction{
    GH_ForgetPasswordViewController * vc = [GH_ForgetPasswordViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 登录
 */
- (void)login{
    NSLog(@"登录");
    [UIApplication sharedApplication].windows[0].rootViewController = [GH_TabBarViewController new];
}


- (void)creatUI{
    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(22));
        make.right.equalTo(self.view.mas_right).mas_offset(-GH_WidthScale(22));
        make.top.equalTo(self.view).mas_offset(GH_HeightScale(100) + Height_NavBar);
        make.height.equalTo(@(GH_HeightScale(52)));
    }];
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.phoneTextField);
        make.top.equalTo(self.phoneTextField.mas_bottom).mas_offset(GH_HeightScale(3));
    }];
    
    [self.view addSubview:self.forgetPassWord];
    [self.forgetPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(38));
        make.top.equalTo(self.passwordTextField.mas_bottom).mas_offset(GH_HeightScale(40));
    }];
    [self.view addSubview:self.loginBt];
    [self.loginBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.forgetPassWord.mas_bottom).mas_offset(GH_HeightScale(20));
        make.width.equalTo(@(GH_WidthScale(300)));
        make.height.equalTo(@(GH_HeightScale(40)));
    }];
    [self.view addSubview:self.registerBt];
    [self.registerBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.forgetPassWord);
        make.right.equalTo(self.view).mas_offset(-GH_WidthScale(37));
    }];
}

- (GH_PublicTextView *)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"账号: " placeHolder:@"请输入您的账号" type:typeAndeNone text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _phoneTextField;
}

- (GH_PublicTextView *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[GH_PublicTextView alloc]initWithFrame:CGRectZero imageName:@"" title:@"密码: " placeHolder:@"请输入您的密码" type:typeAndScreentInput text:^(NSString * _Nonnull text) {
            
        }];
    }
    return _passwordTextField;
}

- (UIButton *)forgetPassWord{
    if (!_forgetPassWord) {
        _forgetPassWord = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPassWord setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forgetPassWord setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _forgetPassWord.titleLabel.font = Fonts(14);
        [_forgetPassWord addTarget:self action:@selector(forgetPassWordAction) forControlEvents:UIControlEventTouchDown];
    }
    return _forgetPassWord;
}
- (UIButton *)loginBt{
    if (!_loginBt) {
        _loginBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBt.layer addSublayer:[GH_Tools changColorWithWidth:GH_WidthScale(300) height:GH_HeightScale(40) Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
        _loginBt.layer.cornerRadius = GH_WidthScale(5);
        _loginBt.clipsToBounds = YES;
        [_loginBt setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBt setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _loginBt.titleLabel.font = Fonts(16);
        _loginBt.layer.cornerRadius = GH_WidthScale(5);
        [_loginBt addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    }
    return _loginBt;
}

- (UIButton *)registerBt{
    if (!_registerBt) {
        _registerBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBt setTitle:@"没有账号, 先去注册" forState:UIControlStateNormal];
        [_registerBt setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
        _registerBt.titleLabel.font = Fonts(14);
        [_registerBt addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchDown];
    }
    return _registerBt;
}

- (void)registerAction{
    GH_RegisterViewController * vc = [GH_RegisterViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
