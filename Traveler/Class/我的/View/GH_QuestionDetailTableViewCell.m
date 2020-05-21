//
//  GH_QuestionDetailTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_QuestionDetailTableViewCell.h"

@interface GH_QuestionDetailTableViewCell ()
@property (nonatomic, strong)UILabel * titleLable;

@property (nonatomic, strong)UILabel * contentLabel;


@end


@implementation GH_QuestionDetailTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.contentLabel];
    self.titleLable.sd_layout
    .leftSpaceToView(self.contentView, GH_WidthScale(10))
    .rightSpaceToView(self.contentView, GH_WidthScale(10))
    .topEqualToView(self.contentView)
    .autoHeightRatio(0);
    self.contentLabel.sd_layout
    .leftEqualToView(self.titleLable)
    .rightEqualToView(self.titleLable)
    .topSpaceToView(self.titleLable, GH_HeightScale(10))
    .autoHeightRatio(0);
    [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:0];
}

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.text = @"怎么修改密码？修改失败怎么办？";
        _titleLable.font = BoldFont(16);
        _titleLable.textColor = Colors(@"#333333");
        _titleLable.numberOfLines = 0;
    }
    return _titleLable;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.text = @"有人说：好好学习，天天向上，的确，我们是应该这么做，作为一个中小学生的感受来理解学习，我们大概都认为学习不好玩，读书的都是书呆子，但是等到知道学习能干什么时，大家也就都会恍然大悟了，因为学习能使我们学习到更多的知识，用知识来充实自己。在学习中，难免会碰到一些困难，给我们带来烦恼。成绩较差，虽然自己努力了，却总不见效；练习立定跳远，却总是跳不过那根优秀线……这样的例子有很多。当我们遇到这些困难时，该拥用怎样的心态？我们“班务栏”里“班级目标”后写着一句话：“每天进步一点”。我们就是要抱着这种良好的心态，努力学习，争取每天进步一点。学时用，用时学。在日常生活中，我们都在运用我们的知识，而又可以从中学到新知识。比方说，在我们与别人交谈时，至少用到了语文，语文让我们如何把语言变得 更通俗、更简洁。而当别人畅所欲言时，我们同样要运用语文，语文让我们能够准确地理解对方所要表达的意思，我们便可以同其他人交谈时借鉴过来，不断地完善自己。当今时代，新知识、新科技、新理论以先人难以想象的速度增加和传播，人类知识总量从过去几十年甚至上百年才增长一倍变成了现在三至五年甚至更快翻一番。在这 知识主宰经济、知识支配世界、知识创造未来的时代，不努力学习新知识，不认真了解新科技，不深入钻研新理论，不要说不可能当一个事业所真正需要、人民所真 正拥护的领导干部，就是当一个真正的通过诚实劳动脱贫致富奔小康的农民都已经非常困难了。努力的过程中未来和自己的存亡就像是紧攥在自己手里。我们这些热血沸腾的新一代有时会因困境而止步不前，会因挫折而踉跄却步，会因误解而举步维艰。可是呢， 别忘了！我们还年轻，我们还是鲜活明丽充满生机，所以就算被困境逼得止步不前，被挫折跘的凉踉跄跄，被误解困的举步维艰，我们也能迅速振作起来，握紧拳 头，仰头嘶吼：“我们在努力！我们在拼搏！”";
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = Colors(@"#333333");
        _contentLabel.font = Fonts(14);
    }
    return _contentLabel;
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
