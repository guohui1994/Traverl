//
//  GH_PersionMessageTableViewCell.m
//  zhichengEducation
//
//  Created by ZhiYuan on 2019/11/6.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "GH_PersionMessageTableViewCell.h"

@interface GH_PersionMessageTableViewCell ()

@property(nonatomic, strong)UILabel * titleLable;//标题
@property (nonatomic, strong)UILabel * messageLable;//信息
@property (nonatomic, strong)UIImageView * backimageView;//箭头
@property (nonatomic, strong)UIImageView * headerImage;//头像

@end

@implementation GH_PersionMessageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.messageLable];
    [self.contentView addSubview:self.headerImage];
    [self.contentView addSubview:self.backimageView];
    [self layout];
}

- (void)layout{
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).mas_offset(GH_WidthScale(24));
    }];
    
    [self.backimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).mas_offset(-GH_WidthScale(10));
        make.width.equalTo(@(GH_WidthScale(14)));
        make.height.equalTo(@(GH_HeightScale(24)));
    }];
    
    [self.messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.backimageView.mas_left).mas_offset(-GH_WidthScale(9));
    }];
    
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
       make.right.equalTo(self.backimageView.mas_left).mas_offset(-GH_WidthScale(8));
        make.width.height.equalTo(@(GH_WidthScale(50)));
    }];
}

- (void)setIsHiddenHeaderImage:(BOOL)isHiddenHeaderImage{
    _isHiddenHeaderImage = isHiddenHeaderImage;
    if (isHiddenHeaderImage == YES) {
        self.headerImage.hidden = YES;
        self.messageLable.hidden = NO;
    }else{
        self.headerImage.hidden = NO;
        self.messageLable.hidden = YES;
//        [self.headerImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", self.message]]];
    }
    
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLable.text = title;
}

- (void)setMessage:(NSString *)message{
    if (self.isHiddenHeaderImage == NO) {
//        self.headerImage.backgroundColor = [UIColor blueColor];
        [self.headerImage sd_setImageWithURL:[NSURL URLWithString:message]];
    }else{
        self.messageLable.text = message;
    }
    
}

- (UILabel *)titleLable{
    if (!_titleLable ) {
        _titleLable = [UILabel new];
        _titleLable.text = @"头像";
        _titleLable.font = Fonts(15);
        _titleLable.textColor = Colors(@"#333333");
    }
    return _titleLable;
}

- (UILabel *)messageLable{
    if (!_messageLable) {
        _messageLable = [UILabel new];
        _messageLable.text = @"";
        _messageLable.textColor = Colors(@"#666666");
        _messageLable.font = Font12;
        _messageLable.textAlignment = NSTextAlignmentRight;
    }
    return _messageLable;
}

- (UIImageView *)backimageView{
    if (!_backimageView) {
        _backimageView = [UIImageView new];
        _backimageView.image = Images(@"right_Back");
    }
    return _backimageView;
}

- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.layer.cornerRadius = GH_WidthScale(5);
        _headerImage.clipsToBounds = YES;
        _headerImage.hidden = YES;
        _headerImage.backgroundColor = [UIColor redColor];
    }
    return _headerImage;
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
