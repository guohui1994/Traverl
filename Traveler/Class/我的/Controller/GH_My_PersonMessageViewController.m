//
//  GH_My_PersonMessageViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/30.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_My_PersonMessageViewController.h"
#import "GH_PersionMessageTableViewCell.h"
#import "GH_UserNameViewController.h"
#import "GH_SetSexViewController.h"
#import "GH_SetPhoneViewController.h"
#import "GH_KouHaoViewController.h"
@interface GH_My_PersonMessageViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView * table;
@property (nonatomic, strong)NSArray * titleArray;//标题数组
@property(nonatomic, strong)NSMutableArray * messageArray;//个人信息数组
@end

@implementation GH_My_PersonMessageViewController
- (UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.layer.cornerRadius = GH_WidthScale(5);
        _table.backgroundColor = [UIColor whiteColor];
        [_table registerClass:[GH_PersionMessageTableViewCell class] forCellReuseIdentifier:@"GH_PersionMessageTableViewCell"];
    }
    return _table;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleText = @"个人信息";
    self.backText = @"";
     self.titleArray = @[@"头像",@"昵称", @"ID", @"性别", @"手机号", @"兴趣", @"口号", @"班级"];
    self.messageArray = [NSMutableArray new];
    self.messageArray  = [@[@"别怕我伤心", @"786495", @"女", @"15169857423", @"矩形 162", @"想要忘记  谈何容易  怪我如此不堪一击"] mutableCopy];
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self creatUI];
}
- (void)creatUI{
    [self.view addSubview:self.table];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(Height_NavBar + 10, 12, GH_HeightScale(213), 12 ));
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.row == 0) {
        return GH_HeightScale(70);
    }else{
        return GH_HeightScale(50);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GH_PersionMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_PersionMessageTableViewCell"];
    if (indexPath.row == 0) {
        cell.isHiddenHeaderImage = NO;
    }else{
        cell.isHiddenHeaderImage = YES;
        cell.message = self.messageArray[indexPath.row - 1];
    }
    cell.title = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        GH_UserNameViewController * vc = [GH_UserNameViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        GH_SetSexViewController * sex = [GH_SetSexViewController new];
        [self.navigationController pushViewController:sex animated:YES];
    }else if (indexPath.row == 4){
        GH_SetPhoneViewController * vc = [GH_SetPhoneViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        GH_KouHaoViewController * vc = [GH_KouHaoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * new = [UIView new];
    return new;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * new = [UIView new];
    return new;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
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
