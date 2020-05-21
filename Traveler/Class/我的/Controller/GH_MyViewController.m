//
//  GH_MyViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_MyViewController.h"
#import "GH_My_TopView.h"
#import "GH_My_CenterView.h"
#import "GH_My_BottomView.h"
#import "GH_My_SystemMessageViewController.h"
#import "GH_My_PersonMessageViewController.h"
#import "GH_SetSexViewController.h"
#import "GH_My_FouceOnViewController.h"
#import "GH_My_ZhuanFaViewController.h"
#import "GH_My_QuestionViewController.h"
#import "GH_My_QuestionDetailViewController.h"
#import "GH_ChangePasswordViewController.h"
#import "GH_QuestionFeedBackViewController.h"
#import "GH_SelectLableViewController.h"
#import "GH_DakaViewController.h"
@interface GH_MyViewController ()
@property (nonatomic, strong)GH_My_TopView * topView;
@property (nonatomic, strong)GH_My_CenterView * centerView;
@property (nonatomic, strong)GH_My_BottomView * bottomView;
@property (nonatomic, strong)GH_My_BottomView * bottomView1;
@end

@implementation GH_MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"我的";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatUI];
    // Do any additional setup after loading the view.
}
- (void)creatUI{
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@(GH_HeightScale(200)));
    }];
    [self.view addSubview:self.centerView];
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom).mas_offset(10);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(70)));
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.centerView.mas_bottom).mas_offset(10);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(158)));
    }];
    [self.view addSubview:self.bottomView1];
    [self.bottomView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.bottomView);
        make.height.equalTo(@(GH_HeightScale(90)));
        make.top.equalTo(self.bottomView.mas_bottom).mas_offset(25);
    }];
}
- (GH_My_TopView *)topView{
    if (!_topView) {
        _topView = [GH_My_TopView new];
         WeakSelf;
        _topView.headerBlock = ^{
            GH_My_PersonMessageViewController * vc = [GH_My_PersonMessageViewController new];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _topView.editBlock = ^{
            NSLog(@"编辑");
            GH_SelectLableViewController * selectlLable = [GH_SelectLableViewController new];
            [weakSelf.navigationController pushViewController:selectlLable animated:YES];
        };
       
        _topView.messBlock = ^{
            NSLog(@"消息");
            GH_My_SystemMessageViewController * vc = [GH_My_SystemMessageViewController new];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _topView.fouceOnBlock = ^{
            GH_My_FouceOnViewController * vc = [GH_My_FouceOnViewController new];
            vc.type = 1;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _topView.fansBlock = ^{
            GH_My_FouceOnViewController * vc = [GH_My_FouceOnViewController new];
            vc.type = 2;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
    }
    return _topView;
}

- (GH_My_CenterView *)centerView{
    if (!_centerView) {
        _centerView = [GH_My_CenterView new];
        _centerView.layer.cornerRadius = GH_WidthScale(5);
        _centerView.backgroundColor = [UIColor whiteColor];
        WeakSelf;
        _centerView.dakaBlock = ^{
            NSLog(@"打卡");
        };
        _centerView.dakaReBlock = ^{
          NSLog(@"打卡记录");
            GH_DakaViewController * daKavc = [GH_DakaViewController new];
            [weakSelf.navigationController pushViewController:daKavc animated:YES];
        };
    }
    return _centerView;
}

- (GH_My_BottomView *)bottomView{
    if (!_bottomView) {
        NSArray * titleArray = @[@"我的转发", @"我的回收站", @"常见问题", @"问题反馈"];
        NSArray * imageArray = @[];
        _bottomView = [[GH_My_BottomView alloc]initWithFrame:CGRectZero itemCount:4 titleArray:titleArray imageArray:imageArray];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.cornerRadius = GH_WidthScale(5);
        WeakSelf;
        _bottomView.selectBlock = ^(NSInteger index) {
            if (index == 0) {
                GH_My_ZhuanFaViewController * vc = [GH_My_ZhuanFaViewController new];
                vc.type = 1;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else if (index == 1){
                NSLog(@"我的回收站");
                GH_My_ZhuanFaViewController * vc = [GH_My_ZhuanFaViewController new];
                vc.type = 2;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else if (index == 2){
                NSLog(@"常见问题");
                GH_My_QuestionViewController * vc = [GH_My_QuestionViewController new];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else if (index == 3){
                NSLog(@"问题反馈");
                GH_QuestionFeedBackViewController * vc = [GH_QuestionFeedBackViewController new];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
        };
    }
    return _bottomView;
}
- (GH_My_BottomView *)bottomView1{
    if (!_bottomView1) {
        NSArray * titleArray = @[@"修改密码", @"关于我们"];
        NSArray * imageArray = @[];
        _bottomView1 = [[GH_My_BottomView alloc]initWithFrame:CGRectZero itemCount:2 titleArray:titleArray imageArray:imageArray];
        _bottomView1.backgroundColor = [UIColor whiteColor];
        _bottomView1.layer.cornerRadius = GH_WidthScale(5);
        WeakSelf;
        _bottomView1.selectBlock = ^(NSInteger index) {
            if (index == 0) {
                NSLog(@"修改密码");
                GH_ChangePasswordViewController * vc = [GH_ChangePasswordViewController new];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else if (index == 1){
                NSLog(@"关于我们");
                GH_My_QuestionDetailViewController * vc = [GH_My_QuestionDetailViewController new];
                vc.titleString = @"关于我们";
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
        };
    }
    return _bottomView1;
}

//- (void)dealloc{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"123" object:nil];
//}

@end
