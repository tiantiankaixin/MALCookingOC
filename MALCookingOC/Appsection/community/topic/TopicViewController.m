//
//  TopicViewController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicViewController.h"

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
}

- (void)pullDownRefresh
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
