//
//  GH_Public_MessageTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/27.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_Public_MessageTableViewCell.h"

@interface GH_Public_MessageTableViewCell ()

@property (nonatomic, strong)UIView * bgVIew;
@property (nonatomic, strong)UILabel * messageLable;
@property (nonatomic, strong)UILabel * nameLable;//回复的人的昵称
@property (nonatomic, strong)UILabel * contentLable;//回复内容
@end


@implementation GH_Public_MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
}

- (void)setIsHiddenBgView:(BOOL)isHiddenBgView{
    _isHiddenBgView = isHiddenBgView;
    if (isHiddenBgView) {
        _bgVIew.backgroundColor = [UIColor whiteColor];
    }else{
        
    }
}
- (void)setIsReply:(BOOL)isReply{
    _isReply = isReply;
    if (isReply) {
        self.messageLable.hidden = YES;
        self.nameLable.hidden = NO;
        self.contentLable.hidden = NO;
        [self.bgVIew setupAutoHeightWithBottomView:self.contentLable bottomMargin:5
            ];
        [self setupAutoHeightWithBottomView:self.bgVIew bottomMargin:0];
    }
}
- (void)creatUI{
    [self.contentView addSubview:self.bgVIew];
    [self.bgVIew addSubview:self.messageLable];
    [self.bgVIew addSubview:self.nameLable];
    [self.bgVIew addSubview:self.contentLable];
    self.bgVIew.sd_layout
    .leftSpaceToView(self.contentView, GH_WidthScale(60))
    .rightSpaceToView(self.contentView, GH_WidthScale(10))
    .topEqualToView(self.contentView)
    .autoHeightRatio(0);
    self.messageLable.sd_layout
    .leftEqualToView(self.bgVIew)
    .rightEqualToView(self.bgVIew)
    .topSpaceToView(self.bgVIew, 5)
    .autoHeightRatio(0);
//    self.nameLable.sd_layout
//    .leftEqualToView(self.bgVIew)
//    .topSpaceToView(self.bgVIew, 5)
//    .heightIs(20);
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgVIew).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self.bgVIew).mas_offset(5);
    }];
    
    self.contentLable.sd_layout
    .leftSpaceToView(self.nameLable, 0)
    .rightEqualToView(self.bgVIew)
       .topSpaceToView(self.bgVIew, 5)
       .autoHeightRatio(0);
    [self.bgVIew setupAutoHeightWithBottomView:self.messageLable bottomMargin:5
     ];
    [self setupAutoHeightWithBottomView:self.bgVIew bottomMargin:5];
}

- (UIView *)bgVIew{
    if (!_bgVIew) {
        _bgVIew = [UIView new];
        _bgVIew.backgroundColor = Colors(@"#F6F6F6");
        _bgVIew.layer.cornerRadius = GH_WidthScale(3);
    }
    return _bgVIew;
}

- (UILabel *)messageLable{
    if (!_messageLable) {
        _messageLable   = [UILabel new];
        _messageLable.text = @"加油,我也是一个人在异地学习,我始终坚信:坚持下去,我们的努力总是有回报。                            ";
        _messageLable.textColor = Colors(@"#666666");
        _messageLable.font = Fonts(14);
        _messageLable.numberOfLines = 0;
    }
    return _messageLable;
}
- (UILabel *)nameLable{
    if (!_nameLable) {
        _nameLable = [UILabel new];
        _nameLable.text = @"数不清的思念:";
        _nameLable.textColor = Colors(@"#439CF6");
        _nameLable.font = Fonts(14);
        _nameLable.hidden = YES;
    }
    return _nameLable;
}

- (UILabel *)contentLable{
    if (!_contentLable) {
        _contentLable = [UILabel new];
        _contentLable.text = @"加油";
        _contentLable.textColor = Colors(@"#666666");
        _contentLable.font = Fonts(14);
        _contentLable.numberOfLines = 0;
        _contentLable.hidden = YES;
    }
    return _contentLable;
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
