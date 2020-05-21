//
//  GH_UserNameViewController.m
//  WangLawyer
//
//  Created by ZhiYuan on 2019/9/12.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "GH_UserNameViewController.h"

@interface GH_UserNameViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UITextField * textField;
@property (nonatomic, copy)NSString * nameString;

@end

@implementation GH_UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"用户名";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatUI];
}
- (void)creatUI{
    //完成按钮
    UIButton * OkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [OkButton.layer addSublayer:[GH_Tools changColorWithWidth:50 height:29 Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
    [OkButton setTitle:@"完成" forState:UIControlStateNormal];
    [OkButton addTarget:self action:@selector(OKBt) forControlEvents:UIControlEventTouchDown];
    
    [OkButton setTitleColor:Colors(@"#FFFFFF") forState:UIControlStateNormal];
    OkButton.titleLabel.font = Fonts(16);
    OkButton.layer.cornerRadius = 5;
    OkButton.clipsToBounds = YES;
    [self.customNavBar addSubview:OkButton];
    [OkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.customNavBar.mas_right).mas_offset(-ZY_WidthScale(15));
        make.bottom.equalTo(self.customNavBar.mas_bottom).mas_offset(-6);
        make.height.equalTo(@(29));
        make.width.equalTo(@(50));
    }];
   
    
    UIView * whiteView = [UIView new];
    whiteView.layer.cornerRadius = GH_WidthScale(6);
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(12));
        make.right.equalTo(self.view.mas_right).mas_offset(-GH_WidthScale(12));
        make.top.equalTo(self.view).mas_offset(Height_NavBar + GH_HeightScale(15));
        make.height.equalTo(@(ZY_HeightScale(50)));
    }];
    
    self.textField = [UITextField new];
    self.textField.text = self.userName;
    self.textField.delegate = self;
    self.textField.clearButtonMode =  UITextFieldViewModeWhileEditing;
    
    self.textField.font = Fonts(16);
    self.textField.textColor = Colors(@"#333333");
//    [self.textField setValue:Colors(@"#333333") forKeyPath:@"_placeholderLabel.textColor"];
//    [self.textField setValue:Fonts(16) forKeyPath:@"_placeholderLabel.font"];
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self.textField addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];
    [whiteView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView).mas_offset(ZY_WidthScale(35));
        make.bottom.right.top.equalTo(whiteView);
    }];
}
//判断输入字符串的长度
- (void)changeText:(UITextField *)textField{
//    if (textField.text.length > 8) {
//        [self.textField resignFirstResponder];
//    }
}



//UITextField代理-----输入完成
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    self.nameString = textField.text;
}
    
- (void)OKBt{
    [self.textField resignFirstResponder];
    NSLog(@"用户名%@", self.nameString);
    if (self.nameString.length == 0) {
        [GH_Tools AutomaticAndBlackHudRemoveHudWithText:@"请输入要修改的用户名"];
    }else{
    WeakSelf;
//    [GetManager httpManagerNetWorkHudWithUrl:changeUserName parameters:@{@"nickname": self.nameString} httpModel:POST success:^(id  _Nonnull data, NSString * _Nonnull Message) {
//        [[Singleton defaultSingleton]setUserName:self.nameString];
//        if (weakSelf.block) {
//            weakSelf.block();
//        }
//        [weakSelf.navigationController popViewControllerAnimated:YES];
//    } failture:^(NSString * _Nonnull Message) {
//        [self AutomaticAndBlackHudRemoveHudWithText:Message];
//    }];
    }
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
