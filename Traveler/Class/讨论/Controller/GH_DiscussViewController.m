//
//  GH_DiscussViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_DiscussViewController.h"
#import "GH_Public_TopView.h"
#import "GH_ReyiViewController.h"
#import "GH_ZongjieViewController.h"
@interface GH_DiscussViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView * scrollerView;
@property (nonatomic, strong)GH_Public_TopView * topView;
@property (nonatomic, strong)GH_ReyiViewController * reyiVC;
@property (nonatomic, strong)GH_ZongjieViewController * zongJieVC;
@end

@implementation GH_DiscussViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"讨论";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatTop];
   [self creatUI];
}
- (void)creatTop{
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(Height_NavBar);
        make.height.equalTo(@(GH_HeightScale(68)));
    }];
}

- (void)creatUI{
    self.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, Height_NavBar + GH_HeightScale(68), screenWidth, screenHeight - Height_NavBar - GH_HeightScale(58) - Height_TabBar)];
    self.scrollerView.delegate = self;
    self.scrollerView.pagingEnabled = YES;
    [self.scrollerView setContentSize:CGSizeMake(screenWidth * 2, screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar)];
    [self.view addSubview:self.scrollerView];
  
    [self addChildViewController:self.reyiVC];
    self.reyiVC.view.frame = CGRectMake(0, 0, screenWidth,  screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar);
    [self.scrollerView addSubview:self.reyiVC.view];
    
    
    [self addChildViewController:self.zongJieVC];
       self.zongJieVC.view.frame = CGRectMake(screenWidth, 0, screenWidth,  screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar);
       [self.scrollerView addSubview:self.zongJieVC.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        [_topView firstBtAction];
    }else if (scrollView.contentOffset.x == screenWidth){
        [_topView secondBtAction];
    }
}

- (GH_Public_TopView *)topView{
    if (!_topView) {
        _topView = [GH_Public_TopView new];
        WeakSelf;
        _topView.firstBlock = ^{
            [weakSelf.scrollerView setContentOffset:CGPointMake(0, 0) animated:YES];
        };
        _topView.seconBlock = ^{
            [weakSelf.scrollerView setContentOffset:CGPointMake(screenWidth, 0) animated:YES];
        };
    }
    return _topView;
}

- (GH_ReyiViewController *)reyiVC{
    if (!_reyiVC) {
        _reyiVC = [GH_ReyiViewController new];
    }
    return _reyiVC;
}

- (GH_ZongjieViewController *)zongJieVC{
    if (!_zongJieVC) {
        _zongJieVC = [GH_ZongjieViewController new];
    }
    return _zongJieVC;
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
