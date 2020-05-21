//
//  GH_BannerCollectionViewCell.m
//  zhiChengEducation_HD
//
//  Created by ZhiYuan on 2019/12/11.
//  Copyright © 2019 郭徽. All rights reserved.
//

#import "GH_BannerCollectionViewCell.h"

@interface GH_BannerCollectionViewCell ()

@property (nonatomic, strong)UIImageView * bannerImageView;

@end


@implementation GH_BannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addLabel];
    }
    return self;
}

- (void)setImageUrl:(NSString *)ImageUrl{
    _ImageUrl = ImageUrl;
    [_bannerImageView sd_setImageWithURL:[NSURL URLWithString:ImageUrl]];
}

- (void)addLabel {
    UIImageView  *bannerImageView = [[UIImageView alloc]init];
    bannerImageView.layer.cornerRadius = GH_WidthScale(5);
    bannerImageView.clipsToBounds = YES;
    [self addSubview:bannerImageView];
    _bannerImageView = bannerImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _bannerImageView.frame = self.bounds;
}

@end
