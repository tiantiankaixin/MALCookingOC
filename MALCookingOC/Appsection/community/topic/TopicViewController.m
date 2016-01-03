//
//  TopicViewController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicCell.h"
#import "CommunityRequest.h"

@interface TopicViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) TopicListModel_topic *topicModel;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TopicViewController


+ (TopicViewController *)topicVCWithModel:(TopicListModel_topic *)model
{
    TopicViewController *topic = ControllerWithSBAndIdentifier(StoryBoardWithName(@"Community"), @"topic");
    topic.topicModel = model;
    return topic;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    [self pullDownRefresh];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    [self.navigationItem setTitle:@"主题"];
    //tableView
    self.tableView.backgroundColor = AppGeneralBgColor;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicCell" bundle:nil] forCellReuseIdentifier:topicCellIdentifier];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefresh)];
}

- (void)pullDownRefresh
{
    WeakSelf(ws);
    [CommunityRequest getTopicDataWithID:self.topicModel.ID finishBlock:^(RequestResult *result) {
        
        [ws.tableView.mj_header endRefreshing];
        ws.dataSource = [TopicModel topicDataSourceWithData:result.requestData];
        if (ws.dataSource.count > 0)
        {
            [ws.tableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicModel *model = self.dataSource[indexPath.row];
    
    
    
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:topicCellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicCell *tCell = (TopicCell *)cell;
    [tCell setModel:self.dataSource[indexPath.row]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
