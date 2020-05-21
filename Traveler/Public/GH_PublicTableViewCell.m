//
//  GH_PublicTableViewCell.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_PublicTableViewCell.h"
#import "GH_TableView_TopTableViewCell.h"
#import "GH_TableView_FooterView.h"
#import "GH_TableView_HeaderView.h"
#import "GH_Public_MessageTableViewCell.h"
@interface GH_PublicTableViewCell ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@property (nonatomic, strong)UIView * bgView;
@property (nonatomic, strong)GH_TableView_FooterView * footerView;
@end

@implementation GH_PublicTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"self.bgView----%@", self.bgView);
//    self.table.contentSize = CGSizeMake(screenWidth - 48, 437);
}



- (void)creatUI{
    _bgView = [UIView new];
    [_bgView setBackgroundColor:Colors(@"#F9F9F9")];
    [_bgView.layer setCornerRadius:4];
    [_bgView.layer setShadowColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor];
//    [_bgView.layer setShadowColor:[UIColor redColor].CGColor];
    [_bgView.layer setShadowOffset:CGSizeMake(0,0.5)];
    [_bgView.layer setShadowOpacity:1.0];
    [_bgView.layer setShadowRadius:8.0];
//    [_bgView.layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.bounds] CGPath]];
    //设置缓存仅用于设置此选项。
    [_bgView.layer setShouldRasterize:YES];
    //设置对应比例，防止cell出现模糊和锯齿
    [_bgView.layer setRasterizationScale:[UIScreen mainScreen] .scale];
    [self.contentView addSubview:self.bgView];
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView).mas_offset(UIEdgeInsetsMake(2, 20, 0, 20));
//        make.left.equalTo(self.contentView).mas_offset(20);
//        make.top.equalTo(self.contentView);
//        make.right.equalTo(self.contentView.mas_right).mas_offset(-GH_WidthScale(20));
//    }];
    self.bgView.sd_layout
    .leftSpaceToView(self.contentView, 20)
    .rightSpaceToView(self.contentView, 20)
    .topSpaceToView(self.contentView, 2)
    .bottomEqualToView(self.contentView);
    self.backgroundColor = Colors(@"#F9F9F9");
    [self.bgView addSubview:self.table];
    self.table.sd_layout
    .leftSpaceToView(self.bgView, 2)
    .rightSpaceToView(self.bgView, 2)
    .topSpaceToView(self.bgView, 0)
    .bottomSpaceToView(self.bgView, 0);
    [self.bgView setupAutoHeightWithBottomView:self.table bottomMargin:0];
      [self setupAutoHeightWithBottomView:self.bgView bottomMargin:10];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
    return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell---%.f", [self.table cellHeightForIndexPath:indexPath cellContentViewWidth:screenWidth - 48 tableView:tableView]);
    return [self.table cellHeightForIndexPath:indexPath cellContentViewWidth:screenWidth - 48 tableView:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
    GH_TableView_TopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_TableView_TopTableViewCell"];
        if (self.isHidderF) {
            cell.isHidderF = self.isHidderF;
        }
        WeakSelf;
        cell.cancleFouceOnBlock = ^{
            if (weakSelf.cancleFouceOnBlock) {
                weakSelf.cancleFouceOnBlock();
            }
        };
         NSLog(@"heoll------%.f", self.table.contentSize.height);
    return cell;
    }else{
        GH_Public_MessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_Public_MessageTableViewCell"];
        if (indexPath.row == 0) {
            cell.isHiddenBgView = YES;
        }else{
            cell.isReply = YES;
        }
         NSLog(@"heoll------%.f", self.table.contentSize.height);
       
        return cell;
    }
    
   
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * v = [GH_Tools findVisibleViewController];
    GH_Public_DetailViewController * vc = [GH_Public_DetailViewController new];
    [v.navigationController pushViewController:vc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }else{
    GH_TableView_HeaderView * header = [[GH_TableView_HeaderView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, GH_HeightScale(42))];
    return header;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }else{
    return GH_HeightScale(42);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
    self.footerView = [[GH_TableView_FooterView alloc]initWithFrame:CGRectMake(0, 0, screenWidth - 48, GH_HeightScale(32))];
    self.footerView.backgroundColor = [UIColor whiteColor];
    return self.footerView;
    }else{
        UIView * view = [UIView new];
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return GH_HeightScale(42);
    }else{
    return 0.01;
    }
}

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.scrollEnabled = NO;
        _table.backgroundColor = [UIColor whiteColor];
        [_table registerClass:[GH_TableView_TopTableViewCell class] forCellReuseIdentifier:@"GH_TableView_TopTableViewCell"];
        [_table registerClass:[GH_Public_MessageTableViewCell class] forCellReuseIdentifier:@"GH_Public_MessageTableViewCell"];
        _table.layer.cornerRadius = GH_WidthScale(5);
        
    }
    return _table;
}

//- (UIView *)bgView{
//    if (!_bgView) {
//        _bgView = [UIView new];
//        [_bgView setBackgroundColor:Colors(@"#F9F9F9")];
//           [_bgView.layer setCornerRadius:4];
////           [_bgView.layer setShadowColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor];
//        [_bgView.layer setShadowColor:[UIColor redColor].CGColor];
//           [_bgView.layer setShadowOffset:CGSizeMake(10,12)];
//           [_bgView.layer setShadowOpacity:1.0];
//           [_bgView.layer setShadowRadius:4.0];
//           [_bgView.layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.bounds] CGPath]];
//           //设置缓存仅用于设置此选项。
//           [_bgView.layer setShouldRasterize:YES];
//           //设置对应比例，防止cell出现模糊和锯齿
//           [_bgView.layer setRasterizationScale:[UIScreen mainScreen] .scale];
//    }
//    return _bgView;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
