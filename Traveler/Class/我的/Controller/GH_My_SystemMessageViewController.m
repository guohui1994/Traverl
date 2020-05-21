//
//  GH_My_SystemMessageViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_SystemMessageViewController.h"
#import "GH_My_SystemMessageTableViewCell.h"
@interface GH_My_SystemMessageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@end

@implementation GH_My_SystemMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"系统消息";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatUI];
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(Height_NavBar, 0, 0, 0));
    }];
}
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = Colors(@"#F9F9F9");
        [_table registerClass:[GH_My_SystemMessageTableViewCell class] forCellReuseIdentifier:@"GH_My_SystemMessageTableViewCell"];
    }
    return _table;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.table cellHeightForIndexPath:indexPath cellContentViewWidth:screenWidth tableView:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_My_SystemMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_My_SystemMessageTableViewCell"];
    return cell;
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
