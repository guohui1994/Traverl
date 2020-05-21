//
//  GH_DetailViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/5/11.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_Public_DetailViewController.h"
#import "GH_TableView_TopTableViewCell.h"
#import "GH_TableView_FooterView.h"
#import "GH_TableView_HeaderView.h"
#import "GH_Public_MessageTableViewCell.h"
@interface GH_Public_DetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@property (nonatomic, strong)GH_TableView_FooterView * footerView;
@end

@implementation GH_Public_DetailViewController

- (UITableView *)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        [_table registerClass:[GH_TableView_TopTableViewCell class] forCellReuseIdentifier:@"GH_TableView_TopTableViewCell"];
        [_table registerClass:[GH_Public_MessageTableViewCell class] forCellReuseIdentifier:@"GH_Public_MessageTableViewCell"];
        _table.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.35].CGColor;
       _table.layer.shadowOffset = CGSizeMake(0,0.5);
       _table.layer.shadowRadius = 8;
       _table.layer.shadowOpacity = 1;
       _table.layer.cornerRadius = 5;
    }
    return _table;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"详情";
    self.backText = @"";
    self.view.backgroundColor = Colors(@"#F9F9F9");
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(Height_NavBar + 15, 12, 12, 10));
    }];
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
            cell.isHidderF = NO;
        WeakSelf;
        cell.cancleFouceOnBlock = ^{

        };
    return cell;
    }else{
        GH_Public_MessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_Public_MessageTableViewCell"];
        if (indexPath.row == 0) {
            cell.isHiddenBgView = YES;
        }else{
            cell.isReply = YES;
        }
        return cell;
    }
}
//
//
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

@end
