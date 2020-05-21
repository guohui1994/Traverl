//
//  GH_Home_RecommendedViewController.m
//  Traveler
//
//  Created by ZhiYuan on 2020/4/25.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import "GH_Home_RecommendedViewController.h"
#import "GH_PublicTableViewCell.h"
@interface GH_Home_RecommendedViewController ()<UITableViewDelegate,UITableViewDataSource,QQtableViewRequestDelegate>

@end

@implementation GH_Home_RecommendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNavBar.hidden = YES;
    self.view.backgroundColor = Colors(@"#F9F9F9");
    [self.view addSubview:self.tableView];
}
//这里是必须存在的方法 传递tableView的偏移量
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.tableView.scrollViewDidScroll) {
        self.tableView.scrollViewDidScroll(self.tableView);
    }
}
- (void)QQtableView:(BaseTabelView *)QQtableView requestFailed:(NSError *)error
{
    
}
-(void)QQtableView:(BaseTabelView *)QQtableView isPullDown:(BOOL)PullDown SuccessData:(id)SuccessData
{
    
    //    if (self.dataArray.count >0) {
    //        self.dataArray = @[].mutableCopy;
    //    }else{
    //        self.dataArray = @[@"",@"",@""].mutableCopy;
    //    }
    //处理返回的SuccessData 数据之后刷新table
    //    [self.tableView reloadData];
}
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return GH_HeightScale(560);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [UIView new];
    view.backgroundColor = Colors(@"#F9F9F9");
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GH_PublicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GH_PublicTableViewCell"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (BaseTabelView *)tableView
{
    if (!_tableView) {
        /**
         注意⚠️这里初始化QQtableView  千万不能使用[[QQtableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50 - 64)];
         这样初始化的话会造成走俩次创建方法 生成俩个tableView对象。
         具体原因不详，初步猜测是因为在ViewController中的self.demo1.tableView调用懒加载的时候initWithFrame。给的frame不为空
         view内部渲染涂层 ，没有及时的返回实例化对象 所以  [self.view addSubview:self.tableView];的时候_tableView还是nil所以又走了一次
         */
        _tableView = [[BaseTabelView alloc]initWithFrame:CGRectZero];
        _tableView.backgroundColor = BG_Color;
        //这里frame的高减了 64 是减去了nav的高度。  50 是PageView的中的titleView的高度就是搜索 、认证、我的 所处view的高度 具体请款视视图而定
        _tableView.frame = CGRectMake(0, GH_HeightScale(10), screenWidth - GH_WidthScale(0), screenHeight - Height_TabBar - Height_NavBar - GH_HeightScale(50));
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.RequestDelegate = self;
        //table是否有刷新
        _tableView.isHasHeaderRefresh = NO;
        _tableView.emptyView.imageName = @"NOData";
        _tableView.emptyView.imageSize = CGSizeMake(GH_WidthScale(434), GH_HeightScale(290));
        _tableView.emptyView.hintText = @"";
        _tableView.emptyView.hintTextFont = [UIFont systemFontOfSize:15 weight:(UIFontWeightMedium)];
        _tableView.emptyView.hintTextColor = [UIColor redColor];
        [_tableView registerClass:[GH_PublicTableViewCell class] forCellReuseIdentifier:@"GH_PublicTableViewCell"];
        WeakSelf;
        _tableView.mj_header = [GH_MJHeader headerWithRefreshingBlock:^{
            [weakSelf getData];
        }];
    }
    return _tableView;
    
}
- (void)getData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
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
