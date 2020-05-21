//
//  GH_QuestionFeedBackViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/6.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_QuestionFeedBackViewController.h"

@interface GH_QuestionFeedBackViewController ()<UITextViewDelegate>
@property (nonatomic, strong)UITextView * textView;
@property (nonatomic, strong)UIView * photoView;//图片viewy
@property (nonatomic, strong)UITextField * textField;
@end

@implementation GH_QuestionFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"问题反馈";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
}

- (void)creatUI{
    UIView * bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0.5);
    bgView.layer.shadowRadius = 8;
    bgView.layer.shadowOpacity = 1;
    bgView.layer.cornerRadius = 5;
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(399)));
        make.top.equalTo(self.view).mas_offset(Height_NavBar + GH_HeightScale(15));
    }];
    
    UILabel * lable1 = [UILabel new];
    lable1.text = @"问题和意见";
    lable1.textColor = Colors(@"#333333");
    lable1.font = Fonts(16);
    [bgView addSubview:lable1];
    [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(bgView).mas_offset(GH_HeightScale(10));
    }];
    [bgView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(lable1.mas_bottom).mas_offset(GH_HeightScale(10));
        make.width.equalTo(@(GH_WidthScale(331)));
        make.height.equalTo(@(GH_HeightScale(140)));
    }];
    UILabel * lable2 = [UILabel new];
    lable2.text = @"图片（选填）提供问题截图";
    lable2.textColor = Colors(@"#333333");
    lable2.font = Fonts(16);
    [bgView addSubview:lable2];
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable1);
        make.top.equalTo(self.textView.mas_bottom).mas_offset(GH_HeightScale(20));
    }];
    
    [bgView addSubview:self.photoView];
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).mas_offset(GH_WidthScale(10));
        make.right.equalTo(bgView.mas_right).mas_offset(-GH_WidthScale(10));
        make.top.equalTo(lable2.mas_bottom).mas_offset(GH_HeightScale(0));
        make.height.equalTo(@(GH_HeightScale(92)));
    }];
    UILabel * lable3 = [UILabel new];
    lable3.text = @"联系电话（选填）便于我们与您联系";
    lable3.textColor = Colors(@"#333333");
    lable3.font = Fonts(16);
    [bgView addSubview:lable3];
    [lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable1);
        make.top.equalTo(self.photoView.mas_bottom).mas_offset(GH_HeightScale(10));
    }];
    [bgView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textView);
        make.top.equalTo(lable3.mas_bottom).mas_offset(GH_HeightScale(10));
        make.width.equalTo(@(GH_WidthScale(190)));
        make.height.equalTo(@(GH_HeightScale(30)));
    }];
    
    UIButton * submitBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBt.layer addSublayer:[GH_Tools changColorWithWidth:GH_WidthScale(300) height:GH_HeightScale(40) Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
    [submitBt setTitle:@"提交" forState:UIControlStateNormal];
    [submitBt setTitleColor:Colors(@"#FFFFFF") forState:UIControlStateNormal];
    submitBt.titleLabel.font = Fonts(16);
    submitBt.layer.cornerRadius = GH_WidthScale(5);
    submitBt.clipsToBounds = YES;
    [self.view addSubview:submitBt];
    [submitBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(bgView.mas_bottom).mas_offset(GH_HeightScale(30));
        make.width.equalTo(@(GH_WidthScale(300)));
        make.height.equalTo(@(GH_HeightScale(40)));
    }];
    
}


- (UITextView *)textView{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.text = @"请清楚描述您所遇到的问题以便于我们提供更好的帮助";
        _textView.textColor = Colors(@"#999999");
        _textView.font = Fonts(14);
        _textView.layer.borderColor = Colors(@"#E2E2E2").CGColor;
        _textView.layer.borderWidth = 1;
        _textView.layer.cornerRadius = 5;
        _textView.clipsToBounds = YES;
        _textView.delegate = self;
    }
    return _textView;
    
}

- (UIView *)photoView{
    if (!_photoView) {
        _photoView = [UIView new];
        _photoView.backgroundColor = [UIColor redColor];
    }
    return _photoView;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        NSString * placeHolder = @"请输入您的手机号码";
        _textField.attributedPlaceholder = [GH_Tools attributedStringWithString:placeHolder color:@"#E2E2E2" font:14 length:placeHolder.length];
        _textField.layer.borderColor = Colors(@"#E2E2E2").CGColor;
        _textField.layer.borderWidth = 1;
        _textField.layer.cornerRadius = 5;
        _textField.clipsToBounds = YES;
    }
    return _textField;
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
