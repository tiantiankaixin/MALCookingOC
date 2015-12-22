//
//  HomeRequest.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeRequest.h"
#import "TAdapter.h"

@implementation HomeRequest

+ (void)loadHomeTopDataWithFinishBlock:(FinishBlock)finish
{
    [MALAFNManger getDataWithUrl:HomeSection0Url parameters:nil finish:finish des:@"加载下厨房首页头部数据"];
}

+ (void)loadIssuesDataWithDate:(NSString *)dateStr finish:(FinishBlock)finish
{
    NSString *url;
    if (IsEmpty(dateStr))
    {
        url = HomeIssuesDataUrl;
    }
    else
    {
        NSString *timeZone = @"Asia%2FShanghai";
        url = [NSString stringWithFormat:@"http://api.xiachufang.com/v2/issues/list.json?cursor=%@&origin=iphone&api_sign=5f6591018538969d272505a3734d1d83&sk=zRbAJPx6TqqUQU5TKo-73A&size=2&timezone=%@&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00",dateStr,timeZone];
    }
    [MALAFNManger getDataWithUrl:url parameters:nil finish:finish des:@"加载下厨房首页issues数据"];
}

+ (void)loadAdDataWithFinishBlock:(FinishBlock)finish
{
    [MALAFNManger getDataWithUrl:HomeAdDataUrl parameters:nil finish:finish des:@"加载下厨房首页数据"];
}

@end
