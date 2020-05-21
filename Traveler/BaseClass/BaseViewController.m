//
//  BaseViewController.m
//  ExtendDemo
//
//  Created by ZhiYuan on 2019/6/21.
//  Copyright © 2019 ZhiYuan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<GH_CustomNavBarDelegate>
@property (nonatomic, strong)UIView * blackView;//黑色背景


@property (nonatomic, strong)UIView * textFieldBackgroundView;
@property (nonatomic, strong)cancleClick cancleBlock;

@property (nonatomic, strong)sureClick sureBlock;

@end

@implementation BaseViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:true animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Net];
    self.navigationController.navigationBar.hidden = YES;
    
    self.customNavBar = [GH_CustomNavBarView customNavBarView];
    self.customNavBar.delegate = self;
//    self.customNavBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.customNavBar];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
   
    // Do any additional setup after loading the view.
}



- (void)creatUI{
    
}

- (void)Net{
    //网络监控句柄
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    //要监控网络连接状态，必须要先调用单例的startMonitoring方法
    [manager startMonitoring];
    WeakSelf;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //status:
        //AFNetworkReachabilityStatusUnknown          = -1,  未知
        //AFNetworkReachabilityStatusNotReachable     = 0,   未连接
        //AFNetworkReachabilityStatusReachableViaWWAN = 1,   3G
        //AFNetworkReachabilityStatusReachableViaWiFi = 2,   无线连接
        
        if (status == 2) {
//            [self AutomaticAndBlackHudRemoveHudWithText:@"无线连接"];
        }else if (status == -1 || status == 0){
//            [self AutomaticAndBlackHudRemoveHudWithText:@"连接错误"];
        }else{
//            [self AutomaticAndBlackHudRemoveHudWithText:@"非WIFI链接"];
        }
        if (weakSelf.status) {
            weakSelf.status(status);
        }
        
        NSLog(@"%ld", status);
    }];
}

#pragma mark-----------自定义导航栏属性设置
- (void)setTitleText:(NSString *)titleText{
    if (_titleText != titleText) {
        _titleText = titleText;
    }
    self.customNavBar.titleString = titleText;
}

- (void)setBackText:(NSString *)backText{
    if (_backText != backText) {
        _backText = backText;
    }
    self.customNavBar.backText = backText;
}

#pragma mark ------set方法---为导航栏设置值
- (void)setCustomNavBarBackGroundUrl:(NSString *)customNavBarBackGroundUrl{
    if (_customNavBarBackGroundUrl != customNavBarBackGroundUrl) {
        _customNavBarBackGroundUrl = customNavBarBackGroundUrl;
    }
    self.customNavBar.backGroundImageString = customNavBarBackGroundUrl;
}

- (void)setIsShowNavBarColor:(BOOL)isShowNavBarColor{
    if (_isShowNavBarColor != isShowNavBarColor) {
        _isShowNavBarColor = isShowNavBarColor;
    }
    self.customNavBar.isShowBgColor = isShowNavBarColor;
}

- (void)setCustomNavBarRightUrl:(NSString *)customNavBarRightUrl{
    if (_customNavBarRightUrl != customNavBarRightUrl) {
        _customNavBarRightUrl = customNavBarRightUrl;
    }
    self.customNavBar.rightViewImageUrl = customNavBarRightUrl;
}

#pragma mark --返回按钮的返回方法
- (void)backController{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --导航栏右侧view的点击方法
- (void)rightViewClick{
    
}

#pragma mark ----菊花
//不消失, 需要手动移除
- (void)handMovementRemoveHudWithText:(NSString *)text{
    self.HUD = [[MBProgressHUD alloc]init];
    self.HUD.label.text = text;
    [[UIApplication sharedApplication].keyWindow addSubview:self.HUD];
    [self.HUD showAnimated:YES];
}
//自动消失, 延迟两秒
- (void)AutomaticRemoveHudWithText:(NSString *)text{
    MBProgressHUD * hud = [[MBProgressHUD alloc]init];
    hud.label.text = text;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud showAnimated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
    });
}

/**
 自动消失, 延迟两秒不带菊花
 
 @param text 传入的text
 */
- (void)AutomaticAndHudRemoveHudWithText:(NSString *)text{
    UIView * bgView = [UIView new];
    bgView.backgroundColor = [Colors(@"#000000") colorWithAlphaComponent:0.5];
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo([UIApplication sharedApplication].keyWindow);
    }];
    UILabel * lable = [UILabel new];
    lable.backgroundColor = [UIColor whiteColor];
    lable.layer.cornerRadius = ZY_WidthScale(10);
    lable.text = text;
    lable.font = Fonts(17);
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = Colors(@"#4C4C4C");
    lable.clipsToBounds = YES;
    [bgView addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(bgView);
        make.height.equalTo(@(ZY_HeightScale(80)));
        make.width.equalTo(@(ZY_WidthScale(180)));
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bgView removeFromSuperview];
    });
}





//自动消失, 延迟时间自己输入
- (void)AutomaticRemoviHudWithText:(NSString *)text delayTime:(int)delayTime{
    MBProgressHUD * hud = [[MBProgressHUD alloc]init];
    hud.label.text = text;
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    [hud showAnimated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
    });
}


/**
 自定义提示框
 */
- (void)customeNoticeHudWithTitle:(NSString *)title content:(NSString *)content{
    UIView * blackView = [UIView new];
    blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [[UIApplication sharedApplication].keyWindow addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo([UIApplication sharedApplication].keyWindow);
    }];
    UIView * whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = ZY_WidthScale(10);
    whiteView.clipsToBounds = YES;
    [blackView addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(blackView);
        make.width.equalTo(@(ZY_WidthScale(271)));
        make.height.equalTo(@(ZY_HeightScale(112)));
    }];
    
    UILabel * titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = Fonts(17);
    titleLabel.textColor = Colors(@"#4C4C4C");
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [whiteView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whiteView);
        make.top.equalTo(whiteView).mas_offset(ZY_HeightScale(30));
    }];
    
    UILabel * contenLabel = [UILabel new];
    contenLabel.font = Fonts(17);
    contenLabel.textColor = Colors(@"#4C4C4C");
    contenLabel.text = content;
    contenLabel.textAlignment = NSTextAlignmentCenter;
    [whiteView addSubview:contenLabel];
    [contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whiteView);
        make.top.equalTo(titleLabel.mas_bottom).mas_offset(ZY_HeightScale(20));
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [blackView removeFromSuperview];
    });
}
/**
 自动消失, 延迟两秒不带菊花---黑色白字
 
 @param text 传入的text
 */
- (void)AutomaticAndBlackHudRemoveHudWithText:(NSString *)text{
    UIView * bgView = [UIView new];
    bgView.backgroundColor = [Colors(@"#000000") colorWithAlphaComponent:0.3];
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo([UIApplication sharedApplication].keyWindow);
    }];
   
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    button.titleLabel.font = Fonts(17);
    button.layer.cornerRadius = ZY_WidthScale(10);
    button.clipsToBounds = YES;
    [bgView addSubview:button];
    [button setupAutoSizeWithHorizontalPadding:ZY_WidthScale(10) buttonHeight:ZY_HeightScale(40)];
    button.sd_layout
    .centerXEqualToView(bgView)
    .centerYEqualToView(bgView)
    .heightIs(ZY_HeightScale(40))
    .autoWidthRatio(0);
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bgView removeFromSuperview];
    });
}


//变色
- (CAGradientLayer *)changColorWithWidth:(CGFloat)width height:(CGFloat)height{
  CAGradientLayer *  gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:@"#FEB26E"].CGColor,(__bridge id)[UIColor colorWithHexString:@"#FF8E00"].CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0,  width,  height);
    return gradientLayer;
}




/**
 创建提示框
 
 @param title 标题
 @param clacle 取消按钮响应
 @param sure 确定按钮响应
 */
- (void)creatPrompBoxWithTitle:(NSString *)title content:(NSString *)content cancleTitle:(NSString *)cancleString sureString:(NSString *)sureString cancle:(cancleClick)clacle sure:(sureClick)sure{
    
    self.cancleBlock = clacle;
    self.sureBlock = sure;
    ///黑色背景
    UIView * blackView = [UIView new];
    blackView.userInteractionEnabled = YES;
    self.blackView = blackView;
    blackView.backgroundColor = [Colors(@"#000000") colorWithAlphaComponent:0.4];
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo([UIApplication sharedApplication].keyWindow);
    }];
    
    //白色view
    UIView * whiteView = [UIView new];
    whiteView.userInteractionEnabled = YES;
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = GH_WidthScale(10);
    whiteView.clipsToBounds = YES;
    [blackView addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(blackView);
        make.width.equalTo(@(GH_WidthScale(320)));
        make.height.equalTo(@(GH_HeightScale(157)));
    }];
    
    UILabel * titleLable = [UILabel new];
    titleLable.text = title;
    titleLable.font = BoldFont(18);
    titleLable.numberOfLines = 0;
    titleLable.textColor = Colors(@"#000000");
    [whiteView addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whiteView);
        make.top.equalTo(whiteView).mas_offset(GH_HeightScale(15));
    }];
    
    UILabel * contenLable = [UILabel new];
    contenLable.text = content;
    contenLable.textColor = Colors(@"#333333");
    contenLable.font = Fonts(15);
    contenLable.textAlignment = NSTextAlignmentCenter;
    contenLable.numberOfLines = 0;
    [whiteView addSubview:contenLable];
    [contenLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView).mas_offset(GH_WidthScale(40));
        make.right.equalTo(whiteView).mas_offset(-GH_WidthScale(40));
        make.top.equalTo(titleLable.mas_bottom).mas_offset(GH_HeightScale(20));
    }];
    
    UIView * lineView = [UIView new];
    lineView.backgroundColor = Colors(@"#E5E5E5");
    [whiteView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(whiteView);
        make.bottom.equalTo(whiteView.mas_bottom).mas_offset(-GH_HeightScale(45));
        make.height.equalTo(@0.5);
    }];
    
    UIButton * cancleBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleBt addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchDown];
    [cancleBt setTitle:cancleString forState:UIControlStateNormal];
    [cancleBt setTitleColor:Colors(@"#999999") forState:UIControlStateNormal];
    cancleBt.titleLabel.font = Fonts(18);
    [whiteView addSubview:cancleBt];
    [cancleBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(whiteView);
        make.height.equalTo(@(GH_HeightScale(45)));
        make.width.equalTo(@(GH_WidthScale(160)));
    }];
    
    UIView * lineView1 = [UIView new];
    lineView1.backgroundColor = Colors(@"#E5E5E5");
    [whiteView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whiteView);
        make.bottom.equalTo(whiteView);
        make.height.equalTo(@(GH_HeightScale(45)));
        make.width.equalTo(@0.5);
    }];
    UIButton * sureBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBt setTitle:sureString forState:UIControlStateNormal];
    [sureBt setTitleColor:Colors(@"#FAD032") forState:UIControlStateNormal];
    sureBt.titleLabel.font = Fonts(18);
    
    [sureBt addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchDown];
    [whiteView addSubview:sureBt];
    [sureBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(whiteView);
        make.height.equalTo(@(GH_HeightScale(45)));
        make.width.equalTo(@(GH_WidthScale(160)));
    }];
}



- (void)sure{
    
    if (self.sureBlock) {
        self.sureBlock(self.blackView);
    }
    [self.blackView removeFromSuperview];
}

- (void)cancle{
    if (self.cancleBlock) {
        self.cancleBlock(self.blackView);
    }
    [self.blackView removeFromSuperview];
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
