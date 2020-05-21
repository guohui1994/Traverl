//
//  GH_AddViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_AddViewController.h"

@interface GH_AddViewController ()
@property (nonatomic, strong)UIView * bgView;
@property (nonatomic, strong)UITextField * textField;
@property (nonatomic, strong)UITextView * textView;
@end

@implementation GH_AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = self.title;
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatNav];
    [self creatUI];
}

- (void)creatNav{
    UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setTitle:@"发布" forState:UIControlStateNormal];
    [bt setTitleColor:Colors(@"#666666") forState:UIControlStateNormal];
    bt.titleLabel.font = Fonts(12);
    bt.backgroundColor = Colors(@"#F0F0F0");
    bt.layer.cornerRadius = GH_WidthScale(5);
    [self.customNavBar addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.customNavBar.mas_right).mas_offset(-GH_WidthScale(16.5));
        make.bottom.equalTo(self.customNavBar.mas_bottom).mas_offset(-GH_HeightScale(5));
        make.width.equalTo(@(GH_WidthScale(50)));
        make.height.equalTo(@(GH_HeightScale(24)));
    }];
}
- (void)creatUI{
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(GH_HeightScale(12) + Height_NavBar);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(444)));
    }];
    UILabel * titleLable = [UILabel new];
    titleLable.text = @"标题:";
    titleLable.textColor = Colors(@"#333333");
    titleLable.font = BoldFont(14);
    [self.bgView addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).mas_offset(GH_WidthScale(15));
        make.top.equalTo(self.bgView).mas_offset(GH_HeightScale(13.5));
    }];
    [self.bgView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLable.mas_right).mas_offset(GH_WidthScale(5.5));
        make.centerY.equalTo(titleLable);
    }];
    UIView * lineView = [UIView new];
    lineView.backgroundColor = Colors(@"#DBDBDB");
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(titleLable.mas_bottom).mas_offset(GH_HeightScale(7));
        make.height.equalTo(@1);
    }];
    [self.bgView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLable);
        make.top.equalTo(lineView.mas_bottom).mas_offset(GH_HeightScale(7));
        make.right.equalTo(self.bgView.mas_right).mas_offset(-GH_WidthScale(15));
        make.height.equalTo(@(GH_HeightScale(311)));
    }];
    UIView * lineView1 = [UIView new];
    lineView1.backgroundColor = Colors(@"#DBDBDB");
    [self.bgView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(lineView);
        make.top.equalTo(self.textView.mas_bottom);
    }];
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        NSString * placeHolder = @"请输入日录标题";
        _textField.attributedPlaceholder = [GH_Tools attributedStringWithString:placeHolder color:@"#999999" font:12 length:placeHolder.length];
    }
    return _textField;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.text = @"输入想要发布的内容：如分享学习心得，记录学习点点滴滴...";
        _textView.textColor = Colors(@"#999999");
        _textView.font = Fonts(12);
    }
    return _textView;
}


- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        _bgView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0,0.5);
        _bgView.layer.shadowRadius = 8;
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.cornerRadius = 5;
    }
    return _bgView;
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
