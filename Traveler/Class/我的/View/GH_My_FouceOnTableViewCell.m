//
//  GH_My_FouceOnTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_FouceOnTableViewCell.h"

@interface GH_My_FouceOnTableViewCell ()

@property (nonatomic, strong)UIImageView * headerImage;

@property (nonatomic, strong)UILabel * nickName;

@property (nonatomic, strong)UILabel * signatureLable;

@property (nonatomic, strong)UIButton * fouceOnBt;

@end

@implementation GH_My_FouceOnTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    [self.contentView addSubview:self.headerImage];
    [self.contentView addSubview:self.nickName];
    [self.contentView addSubview:self.signatureLable];
    [self.contentView addSubview:self.fouceOnBt];
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).mas_offset(GH_WidthScale(10));
        make.top.equalTo(self.contentView).mas_offset(GH_HeightScale(10));
        make.width.height.equalTo(@(GH_WidthScale(40)));
    }];
    
    [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImage);
        make.left.equalTo(self.headerImage.mas_right).mas_offset(GH_WidthScale(10));
        make.right.equalTo(self.contentView.mas_right).mas_offset(-GH_WidthScale(82));
    }];
    
    [self.signatureLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nickName);
        make.top.equalTo(self.nickName.mas_bottom).mas_offset(GH_HeightScale(3));
    }];
    
    [self.fouceOnBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).mas_offset(-GH_WidthScale(10));
        make.top.equalTo(self.contentView).mas_offset(GH_HeightScale(10));
        make.width.equalTo(@(GH_WidthScale(54)));
        make.height.equalTo(@(GH_WidthScale(29)));
    }];
}
- (void)setType:(NSInteger)type{
    _type = type;
    if (type == 1) {
        
    }else
    {
        self.fouceOnBt.backgroundColor = [UIColor whiteColor];
        self.fouceOnBt.layer.borderColor = Colors(@"#FF9019").CGColor;
        self.fouceOnBt.layer.borderWidth = 1;
        [self.fouceOnBt setTitle:@"+关注" forState:UIControlStateNormal];
        [self.fouceOnBt setTitleColor:Colors(@"#FF9019") forState:UIControlStateNormal];
    }
}

- (UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [UIImageView new];
        _headerImage.backgroundColor = [UIColor redColor];
        _headerImage.layer.cornerRadius = GH_WidthScale(20);
    }
    return _headerImage;
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
        _signatureLable.text = @"怀念你柔情似水的眼睛  是我天空最美...";
        _signatureLable.textColor = Colors(@"#666666");
        _signatureLable.font = Fonts(12);
    }
    return _signatureLable;
}

- (UIButton *)fouceOnBt{
    if (!_fouceOnBt) {
        _fouceOnBt = [UIButton buttonWithType:UIButtonTypeCustom];
        _fouceOnBt.backgroundColor = Colors(@"#FF9019");
        _fouceOnBt.layer.cornerRadius = GH_WidthScale(15);
        _fouceOnBt.titleLabel.font = Fonts(12);
        [_fouceOnBt setTitle:@"取消关注" forState:UIControlStateNormal];
        [_fouceOnBt setTitleColor:Colors(@"#FFFFFF") forState:UIControlStateNormal];
    }
    return _fouceOnBt;
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
