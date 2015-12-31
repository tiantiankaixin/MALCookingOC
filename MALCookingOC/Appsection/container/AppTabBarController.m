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
        _malTabBar = [MalTabBar malTabBarWithDefaultImageArray:@[@"tabBDeselected",@"tabBDeselected",@"tabCDeselected",@"tabDDeselected"] selectImageArray:@[@"tabASelected",@"tabBSelected",@"tabCSelected",@"tabDSelected"]];
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
    homeNavi.view.backgroundColor = AppGeneralBgColor;
    UINavigationController *marketNavi = [[UINavigationController alloc] initWithRootViewController:[MarketViewController marketVC]];
    marketNavi.view.backgroundColor = AppGeneralBgColor;
    UINavigationController *communityNavi = [[UINavigationController alloc] initWithRootViewController:[CommunityViewController communityVC]];
    communityNavi.view.backgroundColor = AppGeneralBgColor;
    UINavigationController *myNavi = [[UINavigationController alloc] initWithRootViewController:[MyViewController myVC]];
    self.viewControllers = @[homeNavi,marketNavi,communityNavi,myNavi];
}

- (void)addTabBar
{
    [self.tabBar addSubview:self.malTabBar];
    self.malTabBar.tabBarDelegate = self;
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
