//
//  GH_TableView_TopTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_TableView_TopTableViewCell.h"

@interface GH_TableView_TopTableViewCell ()

@property (nonatomic, strong)UIImageView * headerImage;
@property (nonatomic, strong)UILabel * nickName;
@property (nonatomic, strong)UILabel * signatureLable;
@property (nonatomic, strong)UIView * lineView;
@property (nonatomic, strong)UILabel *titleLable;
@property (nonatomic, strong)UILabel * contenLable;
@property (nonatomic, strong)UIView * photoView;
@property (nonatomic, strong)UIView * lineView1;
@property (nonatomic, strong)UIView * linewView2;
@property (nonatomic, strong)UIButton * cancleFouceon;
@end

@implementation GH_TableView_TopTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creaUI];
    }
    return self;
}

- (void)creaUI{
    [self.contentView addSubview:self.headerImage];
    [self.contentView addSubview:self.nickName];
    [self.contentView addSubview:self.signatureLable];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.contenLable];
    [self.contentView addSubview:self.photoView];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.cancleFouceon];
    [self layout];
}

- (void)layout{
    self.headerImage.sd_layout
    .leftSpaceToView(self.contentView, GH_WidthScale(10))
    .topSpaceToView(self.contentView, GH_WidthScale(10))
    .widthIs(GH_WidthScale(40))
    .heightIs(GH_WidthScale(40));
    
    self.nickName.sd_layout
    .leftSpaceToView(self.headerImage, GH_WidthScale(10))
    .topEqualToView(self.headerImage)
    .rightEqualToView(self.contentView)
    .autoHeightRatio(0);
    
    self.signatureLable.sd_layout
    .leftEqualToView(self.nickName)
    .topSpaceToView(self.nickName, GH_HeightScale(3))
    .rightSpaceToView(self.contentView, GH_WidthScale(82))
    .autoHeightRatio(0);
    
    self.cancleFouceon.sd_layout
    .rightSpaceToView(self.contentView, GH_WidthScale(10))
    .topSpaceToView(self.contentView, GH_WidthScale(10))
    .widthIs(GH_WidthScale(54))
    .heightIs(GH_HeightScale(29));
    
    self.lineView.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.headerImage, GH_HeightScale(10))
    .heightIs(1);
    
    self.titleLable.sd_layout
    .leftSpaceToView(self.contentView, GH_WidthScale(10))
    .rightSpaceToView(self.contentView, GH_WidthScale(10))
    .topSpaceToView(self.lineView, GH_HeightScale(10))
    .autoHeightRatio(0);
    
    self.contenLable.sd_layout
    .leftSpaceToView(self.contentView, GH_WidthScale(10))
    .rightSpaceToView(self.contentView, GH_WidthScale(10))
    .topSpaceToView(self.titleLable, GH_HeightScale(5))
    .autoHeightRatio(0);
    self.photoView.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.contenLable, GH_HeightScale(10))
    .autoHeightRatio(0);
    NSMutableArray * temp = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        UIImageView * image = [UIImageView new];
        image.backgroundColor = [UIColor redColor];
        image.layer.cornerRadius = GH_WidthScale(5);
        [self.photoView addSubview:image];
        image.sd_layout
        .heightIs(GH_HeightScale(90));
        
        [temp addObject:image];
    }
    
    [self.photoView setupAutoWidthFlowItems:temp withPerRowItemsCount:3 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:5];
    [self setupAutoHeightWithBottomView:self.photoView
                           bottomMargin:10];
}

- (void)setIsHidderF:(BOOL)isHidderF{
    _isHidderF = isHidderF;
    if (isHidderF == YES) {
        self.cancleFouceon.hidden = NO;
    }else{
        self.cancleFouceon.hidden = YES;
    }
}

- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = [UIColor redColor];
        _headerImage.layer.cornerRadius = GH_WidthScale(20);
        _headerImage.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [_headerImage addGestureRecognizer:tap];
    }
    return _headerImage;
}
- (void)tapAction{
    UIViewController * v = [GH_Tools findVisibleViewController];
    GH_RecordViewController * vc = [GH_RecordViewController new];
    vc.type = 1;
    [v.navigationController pushViewController:vc animated:YES];
}

- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [UILabel new];
        _nickName.text = @"数不清的是思念";
        _nickName.textColor = Colors(@"#333333");
        _nickName.font = Fonts(16);
    }
    return _nickName;
}

- (UILabel *)signatureLable{
    if (!_signatureLable) {
        _signatureLable = [UILabel new];
        _signatureLable.text = @"怀念你柔情似水的眼睛  是我天空最美的星星";
        _signatureLable.textColor = Colors(@"#666666");
        _signatureLable.font = Fonts(12);
    }
    return _signatureLable;
}
- (UIButton *)cancleFouceon{
    if (!_cancleFouceon) {
        _cancleFouceon = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleFouceon setTitle:@"取消关注" forState:UIControlStateNormal];
        _cancleFouceon.backgroundColor = Colors(@"#FF9019");
        [_cancleFouceon setTitleColor:Colors(@"#FFFFFF") forState:UIControlStateNormal];
        _cancleFouceon.titleLabel.font = Fonts(12);
        _cancleFouceon.hidden = YES;
        _cancleFouceon.layer.cornerRadius = GH_WidthScale(15);
        [_cancleFouceon addTarget:self action:@selector(cancleFouceA) forControlEvents:UIControlEventTouchDown];
    }
    return _cancleFouceon;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = Colors(@"#E2E2E2");
    }
    return _lineView;
}
- (UIView *)linewView2{
    if (!_linewView2) {
        _linewView2 = [UIView new];
        _linewView2.backgroundColor = Colors(@"#E2E2E2");
    }
    return _linewView2;
}

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.text = @"关于《行者》这一app的学习与打卡是如何让我们成 为最好的自己,快来加入我们.....";
        _titleLable.textColor = Colors(@"#333333");
        _titleLable.font = Fonts(14);
        _titleLable.numberOfLines = 0;
    }
    return _titleLable;
}

- (UILabel *)contenLable{
    if (!_contenLable) {
        _contenLable = [UILabel new];
        _contenLable.text = @"追逐梦想，追寻金色的希望。每一次扬起风帆去远航，难免都会有阻挡，只要有梦想在鼓掌，未来就充满着希望；每一次张开翅膀去飞翔，难免都会受伤，只要有梦想在激励，未来就承载着希望。梦想，在心中埋藏，发觉它已经在慢慢走来，给人们带来希望、光明和心灵的洗涤......";
        _contenLable.textColor = Colors(@"#666666");
        _contenLable.font = Fonts(14);
        _contenLable.numberOfLines = 0;
    }
    return _contenLable;
}

- (void)cancleFouceA{
    if (self.cancleFouceOnBlock) {
        self.cancleFouceOnBlock();
    }
}

- (UIView *)photoView{
    if (!_photoView) {
        _photoView = [UIView new];
    }
    return _photoView;
}

- (UIView *)lineView1{
    if (!_lineView1) {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = Colors(@"#E2E2E2");
    }
    return _lineView1;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
