//
//  GH_My_BottomView.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_BottomView.h"

@class clickBt;
@interface clickBt:UIButton

@property (nonatomic, strong)UIImageView * headerImage;

@property (nonatomic, strong)UILabel * titleLables;

@property (nonatomic, strong)UIImageView * rightImage;

@property (nonatomic, copy)NSString * titleString;
@property (nonatomic, copy)NSString * imageUrl;

@end
@implementation clickBt

- (id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    [self addSubview:self.headerImage];
    [self addSubview:self.titleLables];
    [self addSubview:self.rightImage];
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).mas_offset(GH_WidthScale(13));
        make.width.height.equalTo(@(GH_WidthScale(18)));
    }];
    [self.titleLables mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.headerImage.mas_right).mas_offset(GH_WidthScale(14));
    }];
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).mas_offset(-GH_WidthScale(12));
        make.width.equalTo(@(5));
        make.height.equalTo(@(10));
    }];
}

- (void)setTitleString:(NSString *)titleString{
    _titleString = titleString;
    _titleLables.text = titleString;
}
- (void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    _headerImage.image = Images(imageUrl);
}

- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = [UIColor redColor];
    }
    return _headerImage;
}

- (UILabel *)titleLables{
    if (!_titleLables) {
        _titleLables = [UILabel new];
        _titleLables.textColor = Colors(@"#666666");
        _titleLables.font = Fonts(15);
    }
    return _titleLables;
}

- (UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [UIImageView new];
        _rightImage.backgroundColor = [UIColor blueColor];
    }
    return _rightImage;
}


@end

@implementation GH_My_BottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame itemCount:(NSInteger)itemCount titleArray:(NSArray *)titleArray imageArray:(NSArray *)imageArray{
    if ([super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self creatUIWithItmeCount:itemCount titleArray:titleArray imageArray:imageArray];
    }
    return self;
}

- (void)creatUIWithItmeCount:(NSInteger)itemCount titleArray:(NSArray *)titleArray imageArray:(NSArray *)imageArray{
    NSMutableArray * temp = [NSMutableArray new];
    for (int i = 0; i < itemCount; i++) {
        clickBt * bt = [[clickBt alloc]initWithFrame:CGRectZero];
        bt.titleString = titleArray[i];
        bt.tag = 2020430 + i;
        [bt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:bt];
        bt.sd_layout
        .heightIs(GH_HeightScale(42));
        [temp addObject:bt];
    }
    [self setupAutoWidthFlowItems:temp withPerRowItemsCount:1 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:   0];
    
    
    
}

- (void)clickAction:(UIButton *)sender{
    if (self.selectBlock) {
        self.selectBlock(sender.tag - 2020430);
    }
    
}

@end
