//
//  AppTabBarController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "AppTabBarController.h"
#import "HomeViewController.h"
#import "MarketViewController.h"
#import "CommunityViewController.h"
#import "MyViewController.h"
#import "MalTabBar.h"

@interface AppTabBarController ()<MalTabBarDelegate>

@property (nonatomic, strong) MalTabBar *malTabBar;

@end

@implementation AppTabBarController

- (MalTabBar *)malTabBar
{
    if (_malTabBar == nil)
    {
        _malTabBar = [MalTabBar malTabBarWithImageArray:nil];
    }
    return _malTabBar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addChildVC];
    [self addTabBar];
}

- (void)addChildVC
{
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:[HomeViewController homeVC]];
    UINavigationController *marketNavi = [[UINavigationController alloc] initWithRootViewController:[MarketViewController marketVC]];
    UINavigationController *communityNavi = [[UINavigationController alloc] initWithRootViewController:[CommunityViewController communityVC]];
    UINavigationController *myNavi = [[UINavigationController alloc] initWithRootViewController:[MyViewController myVC]];
    self.viewControllers = @[homeNavi,marketNavi,communityNavi,myNavi];
}

- (void)addTabBar
{
    [self.tabBar addSubview:self.malTabBar];
    //self.malTabBar.tabBarDelegate = self;
}

#pragma mark - tabbar delegate
- (void)selectIndex:(NSInteger)index
{
    if(index != self.selectedIndex)
    {
        self.selectedIndex = index;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
