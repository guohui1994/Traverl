//
//  GH_HomeViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_HomeViewController.h"
#import "GH_HomeTop.h"
#import "MCHoveringView.h"
#import "GH_Home_FocusOnViewController.h"
#import "GH_Home_RecommendedViewController.h"
@interface GH_HomeViewController ()<MCHoveringListViewDelegate>
@property (nonatomic, strong)UITextField * textField;
@property (nonatomic, strong)GH_HomeTop * topView;
@property (nonatomic, strong)GH_Home_FocusOnViewController * fouceOnVC;
@property (nonatomic, strong)GH_Home_RecommendedViewController * recommendVC;
@end

@implementation GH_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"";
    [self creatNav];
    [self creaUI];
}

- (void)creatNav{
    self.fouceOnVC = [GH_Home_FocusOnViewController new];
    self.recommendVC = [GH_Home_RecommendedViewController new];
    UIView * textView = [UIView new];
    textView.layer.cornerRadius = GH_WidthScale(18);
    textView.backgroundColor = Colors(@"#EBEBEB");
    [self.customNavBar addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.customNavBar.mas_bottom).mas_offset(-8);
        make.centerX.equalTo(self.customNavBar);
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(36));
    }];
    [textView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(textView).mas_offset(UIEdgeInsetsMake(0, GH_WidthScale(20), 0, GH_WidthScale(40)));
    }];
    
    UIImageView * searchImage = [UIImageView new];
    searchImage.backgroundColor = [UIColor redColor];
    [textView addSubview:searchImage];
    [searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(textView);
        make.right.equalTo(textView.mas_right).mas_offset(-GH_WidthScale(20));
        make.width.height.equalTo(@(GH_WidthScale(16)));
    }];
}
- (void)creaUI{
//    [self.view addSubview:self.topView];
   
    
    MCHoveringView *hovering = [[MCHoveringView alloc]initWithFrame:CGRectMake(GH_WidthScale(0), Height_NavBar, screenWidth - GH_WidthScale(0), screenHeight - GH_HeightScale(0)) deleaget:self];
    hovering.backgroundColor = Colors(@"#F9F9F9");
       hovering.pageView.layer.cornerRadius = GH_WidthScale(10);
       hovering.pageView.clipsToBounds = YES;
       hovering.pageView.defaultTitleColor = Colors(@"#999999");
       hovering.pageView.selectTitleColor = Colors(@"#439CF6");
       hovering.pageView.defaultTitleFont = Fonts(17);
       hovering.pageView.selectTitleFont = BoldFont(17);
    hovering.isMidRefresh = YES;
    [self.view addSubview:hovering];
//    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
//           make.left.right.equalTo(h);
//           make.top.equalTo(self.view).mas_offset(0);
//           make.height.equalTo(@(GH_HeightScale(276)));
//       }];
}

- (NSArray *)listView
{
//    return @[self.webVc.tableView, self.listVC.tableView];
    return @[self.fouceOnVC.tableView, self.recommendVC.tableView];
}
- (UIView *)headView
{
    return self.topView;
}
- (NSArray<UIViewController *> *)listCtroller
{
//    return @[self.webVc, self.listVC];
    return @[self.fouceOnVC, self.recommendVC];
}
- (NSArray<NSString *> *)listTitle
{
    return @[@"关注", @"推荐"];
}


- (GH_HomeTop *)topView{
    if (!_topView) {
        _topView = [[GH_HomeTop alloc]initWithFrame:CGRectMake(0, 0, screenWidth, GH_HeightScale(276))];
        _topView.banberListArray = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586861050264&di=00084de33d00ccc149cda064563aa164&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201509%2F30%2F20150930195711_8cjsx.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586861075867&di=d78f81784f99f51d0b64de85da78359a&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201511%2F13%2F20151113194523_rhMcS.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586861075865&di=8ca7776d7a49f3b78beebad8a150c74a&imgtype=0&src=http%3A%2F%2Fi-7.vcimg.com%2Fcrop%2F3bb1700b14f89f2f49a49678f390b257309230%2528600x%2529%2Fthumb.jpg"];
    }
    return _topView;
}


- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        NSString * placeHolder = @"请输入想要搜索的内容";
        _textField.attributedPlaceholder = [GH_Tools attributedStringWithString:placeHolder color:@"#666666" font:14 length:placeHolder.length];
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
