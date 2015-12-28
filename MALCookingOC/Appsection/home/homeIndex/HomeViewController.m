//
//  HomeViewController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeRequest.h"
#import "TAdapter.h"
#import "Tmodel.h"
#import "Tcell.h"
#import "IssuesContent_Cursor.h"
#import "HomeTableHeaderView.h"
#import "HomeHeaderModel.h"
#import "AdModel.h"
#import "HomeNavHeader.h"
#import "TplaceholderModel.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IssuesContent_Cursor *cursor;
@property (nonatomic, copy) NSString *dayStr;
@property (nonatomic, weak) NSDateFormatter *formatter;
@property (nonatomic, strong) HomeTableHeaderView *headerView;
@property (nonatomic, assign) BOOL isRequesting;

@end

@implementation HomeViewController

- (HomeTableHeaderView *)headerView
{
    if (_headerView == nil)
    {
        _headerView = [HomeTableHeaderView hometableheaderView];
    }
    return _headerView;
}

+ (HomeViewController *)homeVC
{
    UIStoryboard *home = StoryBoardWithName(@"Home");
    return [home instantiateViewControllerWithIdentifier:@"home"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self configueSomeDefaultData];
    [self pullDownRefresh];
}

#pragma mark - 配置一些默认数据
- (void)configueSomeDefaultData
{
    self.dataSource = [TplaceholderModel getPlaceHolderWithNo:3];
}

- (void)setUpView
{
    [HomeNavHeader addHeaderWithNavigationBar:self.navigationController.navigationBar];
    self.tableView.backgroundColor = AppGeneralBgColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefresh)];
    //TODO: 上拉加载更多有问题
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUpRefresh)];
}

- (void)pullDownRefresh
{
    if(self.isRequesting)
    {
        return;
    }
    self.isRequesting = YES;
    self.dayStr = nil;
    WeakSelf(ws);
    //加载顶部视图数据
    [HomeRequest loadHomeTopDataWithFinishBlock:^(RequestResult *result) {
        
        NSString *status = result.requestData[@"status"];
        if ([status isEqualToString:@"ok"])
        {
           HomeHeaderModel *model = [HomeHeaderModel mj_objectWithKeyValues:result.requestData];
            [ws.headerView fillHeaderDataWithModel:model];
        }
    }];
    
    //加载广告数据
    [HomeRequest loadAdDataWithFinishBlock:^(RequestResult *result) {
        
        NSString *status = result.requestData[@"status"];
        if ([status isEqualToString:@"ok"])
        {
            AdModel *ad = [AdModel mj_objectWithKeyValues:result.requestData];
            [ws.headerView fillAdDataWithModel:ad];
        }
    }];
    
    //加载issues数据
    [HomeRequest loadIssuesDataWithDate:self.dayStr finish:^(RequestResult *result) {
        
        ws.isRequesting = NO;
        [ws.tableView.mj_header endRefreshing];
        NSMutableArray *array = [TAdapter adapterIssuesData:result.requestData];
        if (!IsEmpty(array))
        {
            ws.dataSource = [array objectAtIndex:1];
            ws.cursor = [array objectAtIndex:0];
            [ws.tableView reloadData];
        }
    }];
}

//- (void)pullUpRefresh
//{
//    if (self.cursor)
//    {
//        if (self.cursor.has_next)
//        {
//            self.dayStr = self.cursor.next;
//            WeakSelf(ws);
//            [HomeRequest loadIssuesDataWithDate:self.dayStr finish:^(RequestResult *result) {
//                
//                [ws.tableView.mj_footer endRefreshing];
//                NSMutableArray *array = [TAdapter adapterIssuesData:result.requestData];
//                ws.cursor = [array objectAtIndex:0];
//                [ws.dataSource addObjectsFromArray:array];
//                NSInteger local = ws.dataSource.count;
//                NSMutableArray *insertCellArray = [[NSMutableArray alloc] init];
//                for(int i = 0; i < array.count; i++)
//                {
//                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:local + i inSection:0];
//                    [insertCellArray addObject:indexPath];
//                }
//                [ws.tableView insertRowsAtIndexPaths:insertCellArray withRowAnimation:UITableViewRowAnimationAutomatic];
//            }];
//        }
//    }
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150 + (SCREEN_WIDTH / 2.0) * (96 / 160.0) + SCREEN_WIDTH * (15 / 64.0);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.dataSource[indexPath.row];
    return [model cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.dataSource[indexPath.row];
    id cell = [model cellWithtableView:tableView];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.dataSource[indexPath.row];
    id iCell = cell;
    [iCell cellFilldata:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
