//
//  CommunityViewController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityRequest.h"
#import "CommunithIndexCell.h"

@interface CommunityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation CommunityViewController

+ (CommunityViewController *)communityVC
{
    UIStoryboard *marketSTB = StoryBoardWithName(@"Community");
    return [marketSTB instantiateViewControllerWithIdentifier:@"community"];
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
    [self.navigationItem setTitle:@"社区"];
    self.tableView.backgroundColor = AppGeneralBgColor;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerNib:[UINib nibWithNibName:@"CommunithIndexCell" bundle:nil] forCellReuseIdentifier:CommunityIndexCell_Identifier];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefresh)];
}

- (void)pullDownRefresh
{
    WeakSelf(ws);
    [CommunityRequest getCommunithRequestDataWithFinishBlock:^(RequestResult *result) {
        
        [ws.tableView.mj_header endRefreshing];
        ws.dataSource = [CommuityIndexModel getCommunityIndexDataSourceWithData:result.requestData];
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
    return CommunityIndexCell_Height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunithIndexCell *cell = [tableView dequeueReusableCellWithIdentifier:CommunityIndexCell_Identifier];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(CommunithIndexCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setModel:self.dataSource[indexPath.row]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
