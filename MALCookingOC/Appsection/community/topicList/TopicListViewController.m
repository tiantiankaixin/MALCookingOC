//
//  TopicListViewController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicListViewController.h"
#import "CommunityRequest.h"
#import "TopicListModel.h"
#import "TopicListCell.h"
#import "TopicViewController.h"

@interface TopicListViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TopicListViewController

+ (TopicListViewController *)topicListVC
{
    TopicListViewController *topicList = ControllerWithSBAndIdentifier(StoryBoardWithName(@"Community"), @"topicList");
    return topicList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self pullDownRefresh];
}

- (void)setUpView
{
    SetBackItem;
   [self.navigationItem setTitle:@"主题"];
    
    //tableView
    self.tableView.backgroundColor = AppGeneralBgColor;
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicListCell" bundle:nil] forCellReuseIdentifier:topicListCell_Identifier];
    [self.tableView setTableFooterView:[UIView new]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //refresh
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefresh)];
}

- (void)pullDownRefresh
{
    WeakSelf(ws);
    [CommunityRequest getTopicListDataWithFinishBlock:^(RequestResult *result) {
        
        [ws.tableView.mj_header endRefreshing];
        ws.dataSource = [TopicListModel topicListModelArrayWithData:result.requestData];
        if (ws.dataSource.count > 0)
        {
            [ws.tableView reloadData];
        }
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return topicListCell_Height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicListCell *cell = [tableView dequeueReusableCellWithIdentifier:topicListCell_Identifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(TopicListCell *)cell setModel:self.dataSource[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicViewController *topic = [TopicViewController topicVCWithModel:self.dataSource[indexPath.row]];
    [self.navigationController pushViewController:topic animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
