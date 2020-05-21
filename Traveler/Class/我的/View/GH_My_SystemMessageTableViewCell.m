//
//  GH_My_SystemMessageTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_SystemMessageTableViewCell.h"

@interface GH_My_SystemMessageTableViewCell ()

@property (nonatomic, strong)UILabel * timeLable;

@property (nonatomic, strong)UIView * bgView;

@property (nonatomic, strong)UILabel * contenLable;

@end


@implementation GH_My_SystemMessageTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor =Colors(@"#F9F9F9");
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    
    [self.contentView addSubview:self.timeLable];
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.contenLable];
    self.timeLable.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.contentView, GH_HeightScale(5))
    .autoHeightRatio(0);
    
    self.bgView.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.timeLable, GH_HeightScale(5))
    .widthIs(GH_WidthScale(351))
    .autoHeightRatio(0);
    
    self.contenLable.sd_layout
    .leftSpaceToView(self.bgView, GH_WidthScale(10))
    .topSpaceToView(self.bgView, GH_HeightScale(12))
    .rightSpaceToView(self.bgView, GH_WidthScale(8))
    .autoHeightRatio(0);
    
    [self.bgView setupAutoHeightWithBottomView:self.contenLable bottomMargin:GH_HeightScale(12)];
    [self setupAutoHeightWithBottomView:self.bgView bottomMargin:10];
}

- (UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable = [UILabel new];
        _timeLable.text = @"2019年10月11日 09:10";
        _timeLable.textColor = Colors(@"#999999");
        _timeLable.font = Fonts(14);
        _timeLable.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLable;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = GH_WidthScale(5);
    }
    return _bgView;
}
- (UILabel *)contenLable
{
    if (!_contenLable) {
        _contenLable = [UILabel new];
        _contenLable.text = @"我们的成长要摆脱低俗事物的纷扰，用传统文化来滋养。有句话叫柔日读史，刚日读经。是说意志懈怠时读史以明志：谋臣策士，家国三寸簧舌里；金戈铁马，江山万里血泪中。读史书，能养浩然正气。也是指骄躁狂暴时读经以养性：老庄之道，清净无为是非空；菩提之心，灵台空明尘埃无。读经书，能塑静俭德性。我国浩瀚的书海之中，蕴含着无尽的宝藏，它们是我们成长真正的养分。";
        _contenLable.textColor = Colors(@"#666666");
        _contenLable.font = Fonts(15);
    }
    return _contenLable;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
