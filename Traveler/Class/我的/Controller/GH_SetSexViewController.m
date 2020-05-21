//
//  GH_SetSexViewController.m
//  WangLawyer
//
//  Created by ZhiYuan on 2019/9/12.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "GH_SetSexViewController.h"
#import "GH_SetSexView.h"
@interface GH_SetSexViewController ()
@property(nonatomic, assign)int  setSex;//性别选择
@end

@implementation GH_SetSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"设置性别";
    self.backText = @"";
    self.view.backgroundColor = BG_Color;
    [self creatUI];
}

- (void)creatUI{
    //完成按钮
    UIButton * OkButton = [UIButton buttonWithType:UIButtonTypeCustom];
       [OkButton.layer addSublayer:[GH_Tools changColorWithWidth:50 height:29 Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
       [OkButton setTitle:@"完成" forState:UIControlStateNormal];
       [OkButton addTarget:self action:@selector(Ok) forControlEvents:UIControlEventTouchDown];
       
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
    
//    //灰色线条
//    UIView * grayView = [UIView new];
//    grayView.backgroundColor = Colors(@"#F2F2F2");
//    [self.view addSubview:grayView];
//    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view).mas_offset(Height_NavBar);
//        make.height.equalTo(@(10));
//    }];
    GH_SetSexView * sex = [GH_SetSexView new];
    sex.backgroundColor = [UIColor whiteColor];
    sex.layer.cornerRadius = GH_WidthScale(12);
    sex.clipsToBounds = YES;
    sex.sexString = @"男";
    self.setSex = 1;
    //1是男2是女
    WeakSelf;
    sex.block = ^(NSInteger index) {
        if (index == 0) {
            NSLog(@"选择男");
            weakSelf.setSex = 1;
        }else{
            NSLog(@"选择女");
            weakSelf.setSex = 2;
        }
    };
    [self.view addSubview:sex];
    [sex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(GH_WidthScale(24));
        make.right.equalTo(self.view.mas_right).mas_offset(-GH_WidthScale(24));
        make.top.equalTo(self.view).mas_offset(Height_NavBar + GH_HeightScale(15));
        make.height.equalTo(@(ZY_HeightScale(101)));
    }];
}

- (void)Ok{
    WeakSelf;
//    [GetManager httpManagerNetWorkHudWithUrl:changUserSex parameters:@{@"gender":@(self.setSex)} httpModel:POST success:^(id  _Nonnull data, NSString * _Nonnull Message) {
//        [[Singleton defaultSingleton]setUserSex:[NSString stringWithFormat:@"%d", weakSelf.setSex]];
//        if (weakSelf.block) {
//            weakSelf.block();
//        }
//        [weakSelf.navigationController popViewControllerAnimated:YES];
//    } failture:^(NSString * _Nonnull Message) {
//        [GH_Tools AutomaticAndBlackHudRemoveHudWithText:Message];
//    }];
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
