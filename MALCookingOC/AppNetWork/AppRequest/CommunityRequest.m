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

@end
