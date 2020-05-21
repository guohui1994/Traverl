//
//  GH_My_QuestionViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_QuestionViewController.h"
#import "GH_My_QuestionTableViewCell.h"
#import "GH_My_QuestionDetailViewController.h"
@interface GH_My_QuestionViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@end

@implementation GH_My_QuestionViewController

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = Colors(@"#F9F9F9");
        [_table registerClass:[GH_My_QuestionTableViewCell class] forCellReuseIdentifier:@"GH_My_QuestionTableViewCell"];
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"常见问题";
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return GH_HeightScale(39);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_My_QuestionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_My_QuestionTableViewCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_My_QuestionDetailViewController * vc = [GH_My_QuestionDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
