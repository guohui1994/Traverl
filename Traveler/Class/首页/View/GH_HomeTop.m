//
//  GH_HomeTop.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/24.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_HomeTop.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "GH_BannerCollectionViewCell.h"
#import "GH_PublicButton1.h"
#import "GH_Home_TopCollectionViewCell.h"
@interface GH_HomeTop ()<TYCyclePagerViewDataSource, TYCyclePagerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong)UICollectionView * collectionView;
@end

@implementation GH_HomeTop

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatBannar];
        [self creatWhiteView];
    }
    return self;
}
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return self.banberListArray.count;
//    return 10;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    GH_BannerCollectionViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
//    GHHomeBanerModel * model = self.banberListArray[index];
    cell.ImageUrl = self.banberListArray[index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(GH_WidthScale(290), GH_HeightScale(140));
    layout.itemSpacing = GH_WidthScale(12);
    layout.layoutType = 1;
    //layout.minimumAlpha = 0.3;
    //    layout.itemHorizontalCenter = _horCenterSwitch.isOn;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index{
    if (self.banberListArray.count == 0) {
        
    }else{
//        GHHomeBanerModel * model = self.banberListArray[index];
//        if (self.selectAtIndex) {
//            self.selectAtIndex(model);
//        }
    }
}
- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
}
/**
 创建轮播图
 */
- (void)creatBannar{
    [self addSubview:self.pagerView];
    [self.pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(GH_HeightScale(20));
        make.left.right.equalTo(self);
        make.height.equalTo(@(ZY_HeightScale(140)));
    }];
}

- (void)creatWhiteView{
    UIView * whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    whiteView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
    whiteView.layer.shadowOffset = CGSizeMake(0,0.5);
    whiteView.layer.shadowRadius = 8;
    whiteView.layer.shadowOpacity = 1;
    whiteView.layer.cornerRadius = 5;
    [self addSubview:whiteView];
    whiteView.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.pagerView, GH_HeightScale(20))
    .widthIs(GH_WidthScale(351))
    .heightIs(GH_HeightScale(96));
    
    
    [whiteView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(whiteView).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
//    NSArray * array = @[@"风花雪月", @"风花雪月", @"风花雪月", @"风花雪月", @"风花雪月"];
//    NSMutableArray * temp = [NSMutableArray new];
//    for (int i = 0; i < 5; i++) {
//        GH_PublicButton1 * bt = [[GH_PublicButton1 alloc]initWithFrame:CGRectZero imageUrl:@"" title:array[i] textColor:@"#333333" textFont:Fonts(12)];
//        [whiteView addSubview:bt];
//        bt.sd_layout.heightIs(GH_HeightScale(96));
//        [temp addObject:bt];
//    }
//    [whiteView setupAutoWidthFlowItems:temp withPerRowItemsCount:5 verticalMargin:0 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:10];
//
//    [whiteView addSubview:self.collectionView];
//    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.top.equalTo(self.pagerView.mas_bottom).mas_offset(GH_HeightScale(20));
//        make.width.equalTo(@(GH_WidthScale(351)));
//        make.height.equalTo(@(GH_HeightScale(96)));
//    }];
}

#pragma mark ---UICollectionview 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GH_Home_TopCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GH_Home_TopCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"风华雪月");
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(GH_WidthScale(70), GH_HeightScale(96));
        [_collectionView registerClass:[GH_Home_TopCollectionViewCell class] forCellWithReuseIdentifier:@"GH_Home_TopCollectionViewCell"];
    }
    return _collectionView;
}

- (TYCyclePagerView *)pagerView{
    if (!_pagerView) {
        _pagerView = [[TYCyclePagerView alloc]init];
        _pagerView.isInfiniteLoop = YES;
        _pagerView.autoScrollInterval = 3.0;
        _pagerView.dataSource = self;
        _pagerView.delegate = self;
        [_pagerView registerClass:[GH_BannerCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
        _pagerView.layout.layoutType = 1;
    
    }
    return _pagerView;
}


@end
