//
//  GH_PublicButton1.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/11.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_PublicButton1.h"

@interface GH_PublicButton1 ()
@property (nonatomic, strong)UIImageView * image;
@property (nonatomic, strong)UILabel * titlaLables;

@end

@implementation GH_PublicButton1
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
        make.centerX.equalTo(self);
        make.top.equalTo(self).mas_offset(GH_HeightScale(10));
        make.width.height.equalTo(@(GH_WidthScale(55)));
    }];
    [self.titlaLables mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.image.mas_bottom).mas_offset(GH_HeightScale(10));
        make.left.right.equalTo(self);
    }];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titlaLables);
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
    }
    return _titlaLables;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
