//
//  GH_KouHaoViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_KouHaoViewController.h"

@interface GH_KouHaoViewController ()<UITextViewDelegate>
@property (nonatomic, strong)UITextView * textView;
@property (nonatomic, strong)UILabel * countLable;
@end

@implementation GH_KouHaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Colors(@"#F9F9F9");
    self.titleText = @"口号";
    self.backText = @"";
    [self creatUI];
}
- (void)creatUI{
    //
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
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = GH_WidthScale(5);
    [self.view addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(Height_NavBar + GH_HeightScale(10));
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(150)));
    }];
    [whiteView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(whiteView).mas_offset(GH_HeightScale(12));
        make.right.equalTo(whiteView).mas_offset(-GH_WidthScale(10));
        make.bottom.equalTo(whiteView.mas_bottom).mas_offset(-GH_HeightScale(36));
    }];
    [whiteView addSubview:self.countLable];
    [self.countLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(whiteView.mas_right).mas_offset(-GH_WidthScale(10));
        make.bottom.equalTo(whiteView.mas_bottom).mas_offset(-GH_HeightScale(10));
    }];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"请输入你想要表达的个性签名"]) {
        self.textView.text = @"";
    }else{
   
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.textView.text = @"请输入你想要表达的个性签名";
    }else{
        
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    self.countLable.text = [NSString stringWithFormat:@"%ld/30", textView.text.length];
}


- (UITextView *)textView{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.delegate = self;
        _textView.text = @"请输入你想要表达的个性签名";
        _textView.textColor = Colors(@"#999999");
        _textView.font = Fonts(16);
    }
    return _textView;
}
- (UILabel *)countLable{
    if (!_countLable) {
        _countLable = [UILabel new];
        _countLable.text = @"0/30";
        _countLable.textColor = Colors(@"#999999");
        _countLable.font = Fonts(16);
    }
    return _countLable;
}


- (void)OKBt{
    
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
