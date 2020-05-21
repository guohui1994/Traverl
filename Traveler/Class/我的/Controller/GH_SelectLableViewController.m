//
//  GH_SelectLableViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/6.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_SelectLableViewController.h"
#import "JSAddOtherCollectionViewCell.h"
#import <objc/message.h>
@interface GH_SelectLableViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UIView * bgView;
@property (nonatomic, strong)UICollectionView * selectCollectionView;
@property (nonatomic, strong)UICollectionView * unSelectCollectionView;
@property (nonatomic, strong)NSMutableArray * selectArray;
@property (nonatomic, strong)NSMutableArray * unSelectArray;
@property (nonatomic, strong)UIButton * saveBt;
@end

@implementation GH_SelectLableViewController

- (NSMutableArray *)selectArray{
    if (!_selectArray) {
        _selectArray = [NSMutableArray new];
    }
    return _selectArray;
}

- (NSMutableArray *)unSelectArray{
    if (!_unSelectArray) {
        _unSelectArray = [NSMutableArray new];
    }
    return _unSelectArray;
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
- (UICollectionView *)selectCollectionView{
    if (!_selectCollectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _selectCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(GH_WidthScale(6), 5, 2, 0);
        _selectCollectionView.delegate = self;
        _selectCollectionView.dataSource = self;
        _selectCollectionView.showsHorizontalScrollIndicator = YES;
        _selectCollectionView.showsVerticalScrollIndicator = YES;
        _selectCollectionView.scrollEnabled = YES;
        _selectCollectionView.backgroundColor = [UIColor whiteColor];
        
        [_selectCollectionView registerClass:[JSAddOtherCollectionViewCell class] forCellWithReuseIdentifier:@"kReuseIdentifier0"];
        SEL sel = NSSelectorFromString(@"_setRowAlignmentsOptions:");
              if ([_selectCollectionView.collectionViewLayout respondsToSelector:sel]) {
                  ((void(*)(id,SEL,NSDictionary*))objc_msgSend)(_selectCollectionView.collectionViewLayout,sel,
                                                                @{@"UIFlowLayoutCommonRowHorizontalAlignmentKey":@(NSTextAlignmentLeft),
                                                                  @"UIFlowLayoutLastRowHorizontalAlignmentKey" : @(NSTextAlignmentLeft),
                                                                  @"UIFlowLayoutRowVerticalAlignmentKey" : @(NSTextAlignmentCenter)});
              }
        
        
    }
    return _selectCollectionView;
}

- (UICollectionView *)unSelectCollectionView{
    if (!_unSelectCollectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _unSelectCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(GH_WidthScale(6), 5, 2, 0);
        _unSelectCollectionView.delegate = self;
        _unSelectCollectionView.dataSource = self;
        _unSelectCollectionView.showsHorizontalScrollIndicator = YES;
        _unSelectCollectionView.showsVerticalScrollIndicator = YES;
        _unSelectCollectionView.scrollEnabled = YES;
        _unSelectCollectionView.backgroundColor = [UIColor whiteColor];
        
        [_unSelectCollectionView registerClass:[JSAddOtherCollectionViewCell class] forCellWithReuseIdentifier:@"kReuseIdentifier0"];
        SEL sel = NSSelectorFromString(@"_setRowAlignmentsOptions:");
              if ([_unSelectCollectionView.collectionViewLayout respondsToSelector:sel]) {
                  ((void(*)(id,SEL,NSDictionary*))objc_msgSend)(_unSelectCollectionView.collectionViewLayout,sel,
                                                                @{@"UIFlowLayoutCommonRowHorizontalAlignmentKey":@(NSTextAlignmentLeft),
                                                                  @"UIFlowLayoutLastRowHorizontalAlignmentKey" : @(NSTextAlignmentLeft),
                                                                  @"UIFlowLayoutRowVerticalAlignmentKey" : @(NSTextAlignmentCenter)});
              }
        
        
    }
    return _unSelectCollectionView;
}

- (UIButton *)saveBt{
    if (!_saveBt) {
        _saveBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_saveBt.layer addSublayer:[GH_Tools changColorWithWidth:GH_WidthScale(300) height:GH_HeightScale(40) Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
        [_saveBt setTitle:@"保存" forState:UIControlStateNormal];
        [_saveBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _saveBt.titleLabel.font = Fonts(16);
        _saveBt.layer.cornerRadius = GH_WidthScale(5);
        _saveBt.clipsToBounds = YES;
    }
    return _saveBt;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"选择标签";
    self.backText = @"";
    self.selectArray = [@[] mutableCopy];
    self.unSelectArray = [@[@"色情低俗",@"政治敏感政治敏感政治敏感政治敏感政治敏感政治敏感政治敏感政治敏感",@"违法暴力",@"血腥暴恐",@"侵犯公民个人信息",@"侵未成年人权益",@"存在其他违规行为", @"危害社会安全", @"社会暴乱",@"乱", @"社会", @"社会爆"] mutableCopy];
}
- (void)creatUI{
    [self.view addSubview:self.bgView];
  
    UILabel * selectLable = [UILabel new];
    selectLable.text = @"已选择的标签";
    selectLable.textColor = Colors(@"#333333");
    selectLable.font = Fonts(16);
    [self.bgView addSubview:selectLable];
    [selectLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self.bgView).mas_offset(GH_HeightScale(10));
    }];
    [self.bgView addSubview:self.selectCollectionView];
    [self.selectCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(selectLable.mas_bottom).mas_offset(GH_HeightScale(9));
        make.height.equalTo(@(GH_HeightScale(10)));
    }];
    UILabel * unSelectlable = [UILabel new];
    unSelectlable.text = @"标签列表";
    unSelectlable.textColor = Colors(@"#333333");
    unSelectlable.font = Fonts(16);
    [self.bgView addSubview:unSelectlable];
    [unSelectlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selectLable);
        make.top.equalTo(self.selectCollectionView.mas_bottom).mas_offset(GH_HeightScale(10));
    }];
    [self.bgView addSubview:self.unSelectCollectionView];
    [self.unSelectCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.selectCollectionView);
        make.top.equalTo(unSelectlable.mas_bottom).mas_offset(GH_HeightScale(9));
        make.height.equalTo(@(GH_HeightScale(200)));
    }];
      [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).mas_offset(GH_HeightScale(15) + Height_NavBar);
            make.width.equalTo(@(GH_WidthScale(351)));
          make.bottom.equalTo(self.unSelectCollectionView.mas_bottom).mas_offset(GH_HeightScale(10));
    //        make.height.equalTo(@(GH_HeightScale(310)));
        }];
    
    [self.view addSubview:self.saveBt];
    [self.saveBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.bgView.mas_bottom).mas_offset(GH_HeightScale(40));
        make.width.equalTo(@(GH_WidthScale(300)));
        make.height.equalTo(@(GH_HeightScale(30)));
    }];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.selectCollectionView) {
        return self.selectArray.count;
    }else{
        return self.unSelectArray.count;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.selectCollectionView) {
           //高度计算 建议放在model进行
            CGFloat itemHeight  = [self calculateStrwidthWithStr:self.selectArray[indexPath.row] Font:[UIFont systemFontOfSize:GH_WidthScale(14)]];
        if (self.selectArray.count == 0) {
            return CGSizeMake(0, 10);
        }else{
        return CGSizeMake(itemHeight+GH_WidthScale(20) > GH_WidthScale(351) ? GH_WidthScale(340) : itemHeight+GH_WidthScale(20) ,GH_HeightScale(30));
        }
       }else{
           //高度计算 建议放在model进行
            CGFloat itemHeight  = [self calculateStrwidthWithStr:self.unSelectArray[indexPath.row] Font:[UIFont systemFontOfSize:GH_WidthScale(14)]];
           if (self.unSelectArray.count == 0) {
               return CGSizeMake(0, 10);
           }else{
            return CGSizeMake(itemHeight+GH_WidthScale(20) > GH_WidthScale(351) ? GH_WidthScale(340) : itemHeight+GH_WidthScale(20),GH_HeightScale(30));
           }
       }
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JSAddOtherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kReuseIdentifier0" forIndexPath:indexPath];
    WeakSelf;
    if (collectionView == self.selectCollectionView) {
           cell.titleLabel.text = self.selectArray[indexPath.row];
        cell.deleteHidden = YES;
         NSLog(@"---%.f", self.selectCollectionView.contentSize.height);
        [self.selectCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(weakSelf.selectCollectionView.contentSize.height));
        }];
        return cell;
      }else{
          cell.titleLabel.text = self.unSelectArray[indexPath.row];
          cell.addHidden = YES;
          [self.unSelectCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
              make.height.equalTo(@(weakSelf.unSelectCollectionView.contentSize.height));
          }];
          return cell;
      }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.selectCollectionView) {
        [self.unSelectArray addObject:self.selectArray[indexPath.row]];
        [self.selectArray removeObject:self.selectArray[indexPath.row]];
    }else{
        [self.selectArray addObject:self.unSelectArray[indexPath.row]];
        [self.unSelectArray removeObject:self.unSelectArray[indexPath.row]];
    }
    [self.unSelectCollectionView reloadData];
    [self.selectCollectionView reloadData];
}



- (float) calculateStrwidthWithStr:(NSString *)str Font: (UIFont *) font
{
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, font.pointSize)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    
    return ceil(textRect.size.width);
}
@end
