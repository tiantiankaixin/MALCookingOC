//
//  CommunityRequest.m
//  MALCookingOC
//
//  Created by maliang on 15/12/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "CommunityRequest.h"

@implementation CommunityRequest

+ (void)getCommunithRequestDataWithFinishBlock:(FinishBlock)finish
{
    [MALAFNManger getDataWithUrl:CommunityIndexUrl parameters:nil finish:finish des:@"加载社区首页数据"];
}

#pragma mark - 获得主题列表数据
+ (void)getTopicListDataWithFinishBlock:(FinishBlock)finish
{
    [MALAFNManger getDataWithUrl:TopicListUrl parameters:nil finish:finish des:@"获得主题列表数据"];
}

#pragma mark - 根据id加载主题数据
+ (void)getTopicDataWithID:(NSString *)ID finishBlock:(FinishBlock)finish
{
    [MALAFNManger getDataWithUrl:TopicWithID(ID) parameters:nil finish:finish des:@"获得主题数据"];
}

@end
