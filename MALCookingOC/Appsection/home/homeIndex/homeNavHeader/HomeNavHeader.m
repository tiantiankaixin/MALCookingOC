//
//  HomeNavHeader.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/22.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeNavHeader.h"

@implementation HomeNavHeader

+ (HomeNavHeader *)homeNavHeaderView
{
    HomeNavHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"HomeNavHeader" owner:nil options:nil] firstObject];
    
    
    return header;
}

+ (HomeNavHeader *)addHeaderWithNavigationBar:(UINavigationBar *)naviBar
{
    HomeNavHeader *header = [HomeNavHeader homeNavHeaderView];
    
    [header setViewWidth:SCREEN_WIDTH];
    [header setViewY:0];
    [naviBar addSubview:header];
    
    return header;
}

@end
