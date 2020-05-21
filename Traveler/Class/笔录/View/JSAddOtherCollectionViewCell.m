//
//  JSAddOtherCollectionViewCell.m
//  MelonBaseProject
//
//  Created by 氧车乐 on 2020/4/7.
//  Copyright © 2020 Melon. All rights reserved.
//

#import "JSAddOtherCollectionViewCell.h"

@interface JSAddOtherCollectionViewCell ()

@property (nonatomic, strong)UIImageView * addOrDeleteImage;
@end

@implementation JSAddOtherCollectionViewCell


- (instancetype)init{
    abort();
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
 
        [self setup];
    }
    
    return self;
}

- (void)setup{
    
    _setView = [UIView new];
    _setView.backgroundColor = [UIColor whiteColor];
    _setView.layer.cornerRadius = GH_WidthScale(5);
    _setView.layer.borderColor = Colors(@"#E2E2E2").CGColor;
    _setView.layer.borderWidth = 1;
    [self.contentView addSubview:_setView];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = Fonts(14);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = Colors(@"#666666");
    [_setView addSubview:_titleLabel];
    
    [self.contentView addSubview:self.addOrDeleteImage];
    [self.addOrDeleteImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.setView.mas_right).mas_offset(GH_WidthScale(5));
        make.top.equalTo(self.setView.mas_top).mas_offset(-GH_WidthScale(5));
        make.width.height.equalTo(@(GH_WidthScale(10)));
    }];
}

- (void)setAddHidden:(BOOL)addHidden{
    _addOrDeleteImage.hidden = !addHidden;
    _addOrDeleteImage.backgroundColor = [UIColor blueColor];
}
- (void)setDeleteHidden:(BOOL)deleteHidden{
    _addOrDeleteImage.hidden = !deleteHidden;
    _addOrDeleteImage.backgroundColor = [UIColor redColor];
}

- (UIImageView *)addOrDeleteImage{
    if (!_addOrDeleteImage) {
        _addOrDeleteImage = [UIImageView new];
        _addOrDeleteImage.backgroundColor = [UIColor redColor];
        _addOrDeleteImage.layer.cornerRadius = GH_WidthScale(5);
        _addOrDeleteImage.hidden = YES;
    }
    return _addOrDeleteImage;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"
- (void)updateConstraints{
    
    [_setView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.contentView);
//        make.right.equalTo(self.contentView.mas_right).mas_offset(-GH_WidthScale(3));
        make.edges.equalTo(self.contentView).mas_offset(UIEdgeInsetsMake(GH_WidthScale(5), 0, 0, GH_WidthScale(5)));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_setView);
        make.centerY.equalTo(_setView);
        make.width.equalTo(self.setView);
        make.height.mas_offset(35);
    }];
    
    [super updateConstraints];
}
#pragma clang diagnostic pop

- (void)didMoveToSuperview{
    [self setNeedsUpdateConstraints];
}
@end

