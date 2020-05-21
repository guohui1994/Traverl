//
//  GH_My_QuestionTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_QuestionTableViewCell.h"

@interface GH_My_QuestionTableViewCell ()

@property (nonatomic, strong)UILabel * titleLable;

@property (nonatomic, strong)UIImageView * rightImage;

@end

@implementation GH_My_QuestionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.rightImage];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).mas_offset(GH_WidthScale(10));
        make.right.equalTo(self.contentView).mas_offset(-GH_WidthScale(20));
    }];
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).mas_offset(-GH_WidthScale(12));
        make.width.equalTo(@(GH_WidthScale(5)));
        make.height.equalTo(@(GH_HeightScale(10)));
    }];
}

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.text = @"怎么修改密码？修改失败怎么办？";
        _titleLable.textColor = Colors(@"#666666");
        _titleLable.font = Fonts(15);
    }
    return _titleLable;
}

- (UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [UIImageView new];
        _rightImage.backgroundColor = [UIColor blueColor];
    }
    return _rightImage;
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
