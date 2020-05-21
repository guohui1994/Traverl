//
//  GH_My_ZhuanFaViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_ZhuanFaViewController.h"

@interface GH_My_ZhuanFaViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@end

@implementation GH_My_ZhuanFaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.type == 1) {
        self.titleText = @"转发";
    }else{
        self.titleText = @"回收站";
    }
    self.backText = @"";
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(Height_NavBar + 10);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
