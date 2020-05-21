//
//  GH_Public.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_PublicButton.h"

@interface GH_PublicButton ()
@property (nonatomic, strong)UIImageView * image;
@property (nonatomic, strong)UILabel * titlaLables;
@end

@implementation GH_PublicButton
- (id)initWithFrame:(CGRect)frame imageUrl:(NSString *)imageUrl title:(NSString *)title textColor:(NSString *)textColor textFont:(UIFont *)textFont{
    if ([super initWithFrame:frame]) {
        [self creaUIWithimageUrl:imageUrl title:title textColor:textColor textFont:textFont];
    }
    return self;
}


- (void)creaUIWithimageUrl:(NSString *)imageUrl title:(NSString *)title textColor:(NSString *)textColor textFont:(UIFont *)textFont{
    [self addSubview:self.image];
    self.image.image = Images(imageUrl);
    [self addSubview:self.titlaLables];
    self.titlaLables.text = title;
    self.titlaLables.textColor = Colors(textColor);
    self.titlaLables.font = textFont;
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).mas_offset(GH_WidthScale(10));
        make.width.height.equalTo(@(GH_WidthScale(14)));
    }];
    [self.titlaLables mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.image.mas_right).mas_offset(GH_WidthScale(6));
        make.right.equalTo(self.mas_right);
    }];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel.mas_right);
    }];
}
- (UIImageView *)image{
    if (!_image) {
        _image = [UIImageView new];
        _image.backgroundColor = [UIColor redColor];
    }
    return _image;
}

- (UILabel *)titlaLables{
    if (!_titlaLables) {
        _titlaLables = [UILabel new];
    }
    return _titlaLables;
}
@end
