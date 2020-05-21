//
//  GH_Home_TopCollectionViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/11.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_Home_TopCollectionViewCell.h"

@interface GH_Home_TopCollectionViewCell ()
@property (nonatomic, strong)UIImageView * image;
@property (nonatomic, strong)UILabel * titlaLables;
@end

@implementation GH_Home_TopCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    [self.contentView addSubview:self.image];
    [self.contentView addSubview:self.titlaLables];
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).mas_offset(GH_HeightScale(10));
        make.centerX.equalTo(self.contentView);
        make.width.height.equalTo(@(GH_WidthScale(55)));
    }];
    
    [self.titlaLables mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.image.mas_bottom).mas_offset(GH_HeightScale(10));
        make.left.right.equalTo(self.contentView);
    }];
}
- (UIImageView *)image{
    if (!_image) {
        _image = [UIImageView new];
        _image.backgroundColor = [UIColor redColor];
        _image.layer.cornerRadius = GH_WidthScale(27.5);
    }
    return _image;
}

- (UILabel *)titlaLables{
    if (!_titlaLables) {
        _titlaLables = [UILabel new];
        _titlaLables.text = @"风花雪月";
        _titlaLables.font = Fonts(12);
        _titlaLables.textColor = Colors(@"#333333");
        _titlaLables.textAlignment =NSTextAlignmentCenter;
    }
    return _titlaLables;
}
@end
