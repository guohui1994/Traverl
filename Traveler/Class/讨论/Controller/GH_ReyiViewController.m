//
//  GH_ReyiViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/28.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_ReyiViewController.h"
#import "GH_PublicTableViewCell.h"

@interface GH_ReyiViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@end

@implementation GH_ReyiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Colors(@"#F9F9F9");
    self.customNavBar.hidden = YES;
    [self creatUI];
    [self.table.mj_header beginRefreshing];
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[GH_PublicTableViewCell class] forCellReuseIdentifier:@"GH_PublicTableViewCell"];
    }
    return _table;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_PublicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_PublicTableViewCell"];
    cell.isHidderF = YES;
    cell.cancleFouceOnBlock = ^{
        NSLog(@"取消关注");
    };
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [UIView new];
    view.backgroundColor = Colors(@"#F9F9F9");
//    view.backgroundColor = [UIColor blueColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return GH_HeightScale(560);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [UIView new];
    view.backgroundColor = Colors(@"#F9F9F9");
    return view;
}


@end
