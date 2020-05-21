//
//  GH_My_QuestionDetailViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_QuestionDetailViewController.h"
#import "GH_QuestionDetailTableViewCell.h"
@interface GH_My_QuestionDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@end

@implementation GH_My_QuestionDetailViewController
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = Colors(@"#F9F9F9");
        [_table registerClass:[GH_QuestionDetailTableViewCell class] forCellReuseIdentifier:@"GH_QuestionDetailTableViewCell"];
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.titleString.length != 0) {
        self.titleText  = self.titleString;
    }else{
    self.titleText = @"问题详情";
    }
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(Height_NavBar + GH_HeightScale(10), GH_WidthScale(12), 0, GH_WidthScale(12)));
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.table cellHeightForIndexPath:indexPath cellContentViewWidth:screenWidth - GH_WidthScale(24) tableView:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_QuestionDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_QuestionDetailTableViewCell"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return GH_HeightScale(12);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = [UIView new];
    [header.layer addSublayer:[GH_Tools roundWithWidth:screenWidth - GH_WidthScale(24) height:GH_HeightScale(12) Color:@"#FFFFFF" CorenersModel:LeftTopAndRightTop cornerRadiiWidth:5 cornerRadiiHeight:5]];
    return header;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return GH_HeightScale(12);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footer = [UIView new];
       [footer.layer addSublayer:[GH_Tools roundWithWidth:screenWidth - GH_WidthScale(24) height:GH_HeightScale(12) Color:@"#FFFFFF" CorenersModel:LeftBottomAndRightBottom cornerRadiiWidth:5 cornerRadiiHeight:5]];
       return footer;
}

@end
