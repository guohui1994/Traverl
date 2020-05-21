//
//  GH_ReportViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/13.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_ReportViewController.h"
#import "JSAddOtherCollectionViewCell.h"
#import <objc/message.h>
@interface GH_ReportViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic,strong) NSArray * infoArr;

@property (nonatomic, strong)UIView * bgView;

@property (nonatomic, strong)UITextView * textView;

@property (nonatomic, strong)UITextField * textField;
@end

@implementation GH_ReportViewController

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 2, 0);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = YES;
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.scrollEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[JSAddOtherCollectionViewCell class] forCellWithReuseIdentifier:@"kReuseIdentifier0"];
        SEL sel = NSSelectorFromString(@"_setRowAlignmentsOptions:");
              if ([_collectionView.collectionViewLayout respondsToSelector:sel]) {
                  ((void(*)(id,SEL,NSDictionary*))objc_msgSend)(_collectionView.collectionViewLayout,sel,
                                                                @{@"UIFlowLayoutCommonRowHorizontalAlignmentKey":@(NSTextAlignmentLeft),
                                                                  @"UIFlowLayoutLastRowHorizontalAlignmentKey" : @(NSTextAlignmentLeft),
                                                                  @"UIFlowLayoutRowVerticalAlignmentKey" : @(NSTextAlignmentCenter)});
              }
        
        
    }
    return _collectionView;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.layer.cornerRadius = GH_WidthScale(5);
        _bgView.layer.borderColor = Colors(@"#E2E2E2").CGColor;
        _bgView.layer.borderWidth = 1;
    }
    return _bgView;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [UITextView new];
        _textView.textColor = Colors(@"#999999");
        _textView.font = Fonts(14);
        _textView.text = @"请详细描述该商家的恶意行为";
    }
    return _textView;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        NSString * placeHolder = @"请输入您的手机号码";
        _textField.attributedPlaceholder = [GH_Tools attributedStringWithString:placeHolder color:@"#E2E2E2" font:14 length:placeHolder.length];
        _textField.layer.borderColor = Colors(@"#E2E2E2").CGColor;
        _textField.layer.borderWidth = 1;
        _textField.layer.cornerRadius = GH_WidthScale(5);
    }
    return _textField;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"举报";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    self.customNavBar.backgroundColor = [UIColor whiteColor];
     _infoArr = @[@"色情低俗",@"政治敏感",@"违法暴力",@"血腥暴恐",@"侵犯公民个人信息",@"侵未成年人权益",@"存在其他违规行为"];
}
- (void)creatUI{
    UIView * whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = GH_WidthScale(5);
    whiteView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
    whiteView.layer.shadowOffset = CGSizeMake(0,0.5);
    whiteView.layer.shadowRadius = 8;
    whiteView.layer.shadowOpacity = 1;
    whiteView.layer.cornerRadius = 5;
    [self.view addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(Height_NavBar + GH_HeightScale(15));
        make.width.equalTo(@(GH_WidthScale(351)));
        make.height.equalTo(@(GH_HeightScale(470)));
    }];
    
    UILabel * lable = [UILabel new];
    lable.text = @"选择举报的理由（单选）";
    lable.textColor = Colors(@"#333333");
    lable.font = Fonts(16);
    [whiteView addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(whiteView).mas_offset(GH_HeightScale(10));
    }];
    
    [whiteView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(whiteView);
        make.top.equalTo(lable.mas_bottom).mas_offset(GH_HeightScale(10));
        make.height.equalTo(@(GH_HeightScale(200)));
    }];
    
    [whiteView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(whiteView);
        make.width.equalTo(@(GH_WidthScale(330)));
        make.height.equalTo(@(GH_HeightScale(246)));
        make.top.equalTo(self.collectionView.mas_bottom).mas_offset(GH_HeightScale(10));
    }];
    
    [self.bgView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).mas_offset(GH_WidthScale(10));
        make.right.equalTo(self.view.mas_right).mas_offset(-GH_WidthScale(10));
        make.top.equalTo(self.bgView).mas_offset(GH_HeightScale(10));
        make.height.equalTo(@(GH_HeightScale(153)));
    }];
    
    UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.backgroundColor = [UIColor blueColor];
    bt.layer.cornerRadius = GH_WidthScale(5);
    bt.layer.borderColor = Colors(@"#999999").CGColor;
    bt.layer.borderWidth = 1;
    
    [self.bgView addSubview:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).mas_offset(GH_WidthScale(10));
        make.bottom.equalTo(self.bgView.mas_bottom).mas_offset(-GH_WidthScale(10));
        make.width.height.equalTo(@(GH_WidthScale(73)));
    }];
    
    UILabel * lianXiLable = [UILabel new];
    lianXiLable.text = @"联系方式：";
    lianXiLable.textColor = Colors(@"#666666");
    lianXiLable.font = Fonts(14);
    [whiteView addSubview:lianXiLable];
    [lianXiLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self.bgView.mas_bottom).mas_offset(GH_HeightScale(25));
    }];
    
    [whiteView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lianXiLable);
        make.left.equalTo(lianXiLable.mas_right).offset(GH_WidthScale(5));
        make.width.equalTo(@(GH_WidthScale(190)));
        make.height.equalTo(@(GH_HeightScale(30)));
    }];
    
    
    UIButton * submitBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBt.layer addSublayer:[GH_Tools changColorWithWidth:GH_WidthScale(300) height:GH_HeightScale(40) Color:@"#439BF9" discolorationColor:@"#4BC6EF"]];
    [submitBt setTitle:@"提交" forState:UIControlStateNormal];
    [submitBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitBt.titleLabel.font = Fonts(16);
    submitBt.layer.cornerRadius = GH_WidthScale(5);
    submitBt.clipsToBounds = YES;
    [submitBt addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:submitBt];
    [submitBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(GH_WidthScale(300)));
        make.height.equalTo(@(GH_HeightScale(30)));
        make.centerX.equalTo(self.view);
        make.top.equalTo(whiteView.mas_bottom).mas_offset(GH_HeightScale(30));
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _infoArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //高度计算 建议放在model进行
    CGFloat itemHeight  = [self calculateStrwidthWithStr:_infoArr[indexPath.row] Font:[UIFont systemFontOfSize:GH_WidthScale(14)]];
   
    return CGSizeMake(itemHeight+GH_WidthScale(20),GH_HeightScale(30));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JSAddOtherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kReuseIdentifier0" forIndexPath:indexPath];
    cell.titleLabel.text = _infoArr[indexPath.row];
    NSLog(@"---%.f", _collectionView.contentSize.height);
    [_collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(_collectionView.contentSize.height));
    }];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", _infoArr[indexPath.row]);
}



- (float) calculateStrwidthWithStr:(NSString *)str Font: (UIFont *) font
{
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, font.pointSize)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil];
    
    return ceil(textRect.size.width);
}

- (void)submitAction{
    UIView * bgView = [UIView new];
    bgView.backgroundColor = [Colors(@"#000000") colorWithAlphaComponent:0.6];
    if (@available(iOS 13.0, *)) {
           [[UIApplication sharedApplication].windows[0] addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo([UIApplication sharedApplication].windows[0] ).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0   ));
          }];
       }else{
           [[UIApplication sharedApplication].keyWindow addSubview:bgView];
           [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.edges.equalTo([UIApplication sharedApplication].keyWindow ).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0   ));
           }];
       }
    UILabel * labe = [UILabel new];
    labe.text = @"提交成功!";
    labe.textColor = Colors(@"#FFFFFF");
    labe.font = Fonts(24);
    [bgView addSubview:labe];
    [labe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
    }];
   
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bgView removeFromSuperview];
    });
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
