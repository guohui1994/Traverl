//
//  GH_RecordViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_RecordViewController.h"
#import "GH_Public_TopView1.h"
#import "GH_XingQUViewController.h"
#import "GH_RiLuViewController.h"
#import "GH_YueLuViewController.h"
#import "GH_AddView.h"
#import "GH_AddViewController.h"
@interface GH_RecordViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)GH_Public_TopView1 * topView;
@property (nonatomic, strong)UIScrollView * scrollerView;
@property (nonatomic, strong)GH_RiLuViewController * riLuVC;
@property (nonatomic, strong)GH_YueLuViewController * yueLuVC;
@property (nonatomic, strong)GH_XingQUViewController * xingQUVC;


@property (nonatomic, strong)UIButton * addBt;
@property (nonatomic, strong)UIView * bgView;
@end

@implementation GH_RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"笔录";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    if (self.type == 1) {
        self.backText = @"";
    }
    [self creatTop];
    [self creatUI];
    // Do any additional setup after loading the view.
}
- (void)creatTop{
    [self.customNavBar addSubview:self.addBt];
    [self.addBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.customNavBar.mas_right).mas_offset(-10);
        make.bottom.equalTo(self.customNavBar.mas_bottom).mas_offset(-16);
        make.width.height.equalTo(@(GH_WidthScale(17.5)));
    }];
    
    
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
    [self.scrollerView setContentSize:CGSizeMake(screenWidth * 3, screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar)];
    [self.view addSubview:self.scrollerView];
  
    [self addChildViewController:self.riLuVC];
    self.riLuVC.view.frame = CGRectMake(0, 0, screenWidth,  screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar);
    [self.scrollerView addSubview:self.riLuVC.view];
    
    
    [self addChildViewController:self.yueLuVC];
       self.yueLuVC.view.frame = CGRectMake(screenWidth, 0, screenWidth,  screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar);
       [self.scrollerView addSubview:self.yueLuVC.view];
    [self addChildViewController:self.xingQUVC];
    self.xingQUVC.view.frame = CGRectMake(screenWidth * 2, 0, screenWidth,  screenHeight - Height_NavBar - GH_HeightScale(58)- Height_TabBar);
     [self.scrollerView addSubview:self.xingQUVC.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        [_topView firstBtAction];
    }else if (scrollView.contentOffset.x == screenWidth){
        [_topView secondBtAction];
    }else if (scrollView.contentOffset.x == screenWidth * 2){
        [_topView thirdBtAction];
    }
}
- (GH_Public_TopView1 *)topView{
    if (!_topView) {
        _topView = [GH_Public_TopView1 new];
        WeakSelf;
        _topView.firstBlock = ^{
            [weakSelf.scrollerView setContentOffset:CGPointMake(0, 0) animated:YES];
        };
        _topView.seconBlock = ^{
            [weakSelf.scrollerView setContentOffset:CGPointMake(screenWidth, 0) animated:YES];
        };
        _topView.thirBlock = ^{
            [weakSelf.scrollerView setContentOffset:CGPointMake(screenWidth * 2, 0) animated:YES];
        };
    }
    return _topView;
}

- (GH_RiLuViewController *)riLuVC{
    if (!_riLuVC) {
        _riLuVC = [GH_RiLuViewController new];
    }
    return _riLuVC;
}

- (GH_YueLuViewController *)yueLuVC{
    if (!_yueLuVC) {
        _yueLuVC = [GH_YueLuViewController new];
    }
    return _yueLuVC;
}

- (GH_XingQUViewController *)xingQUVC{
    if (!_xingQUVC) {
        _xingQUVC = [GH_XingQUViewController new];
    }
    return _xingQUVC;
}

- (UIButton *)addBt{
    if (!_addBt) {
        _addBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBt.backgroundColor = [UIColor redColor];
        [_addBt addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchDown];
    }
    return _addBt;
}

- (void)addAction{
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor clearColor];
    self.bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeFromSuperview)];
    [self.bgView addGestureRecognizer:tap];
    [[UIApplication sharedApplication].keyWindow addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo([UIApplication sharedApplication].keyWindow).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    GH_AddView * add = [GH_AddView new];
    add.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
    add.layer.shadowOffset = CGSizeMake(0,1);
    add.layer.shadowOpacity = 1;
    add.layer.shadowRadius = 8;
    add.layer.cornerRadius = 5;
    WeakSelf;
    add.riLuBlock = ^{
        [weakSelf.bgView removeFromSuperview];
        GH_AddViewController * addVC = [GH_AddViewController new];
        addVC.title = @"新增笔录";
        [weakSelf.navigationController pushViewController:addVC animated:YES];
    };
    add.yueLuBlock = ^{
         [weakSelf.bgView removeFromSuperview];
        GH_AddViewController * addVC = [GH_AddViewController new];
        addVC.title = @"新增月录";
        [weakSelf.navigationController pushViewController:addVC animated:YES];
    };
    add.xingQueBlock = ^{
         [weakSelf.bgView removeFromSuperview];
    };
    [self.bgView addSubview:add];
    [add mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).mas_offset(GH_HeightScale(55));
        make.right.equalTo(self.bgView).mas_offset(-GH_WidthScale(19.5));
        make.width.equalTo(@(GH_WidthScale(85)));
        make.height.equalTo(@(GH_HeightScale(95)));
    }];
   
    
}
- (void)removeFromSuperview{
    [self.bgView removeFromSuperview];
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
