//
//  GH_My_FouceOnViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_FouceOnViewController.h"
#import "GH_My_FouceOnTableViewCell.h"
@interface GH_My_FouceOnViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@end

@implementation GH_My_FouceOnViewController

- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.layer.cornerRadius = GH_WidthScale(6);
        [_table registerClass:[GH_My_FouceOnTableViewCell class] forCellReuseIdentifier:@"GH_My_FouceOnTableViewCell"];
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.type == 1) {
        self.titleText = @"关注";
    }else{
        self.titleText = @"粉丝";
    }
    
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(Height_NavBar + GH_HeightScale(15), GH_WidthScale(12), 0, GH_WidthScale(12)));
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return GH_HeightScale(60);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_My_FouceOnTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_My_FouceOnTableViewCell"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.type = self.type;
    return cell;
}

@end
