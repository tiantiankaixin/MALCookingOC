//
//  HomeRequest.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeRequest : NSObject

/**
 *  加载下厨房首页顶部数据
 *
 *  @param finish 回调block
 */
+ (void)loadHomeTopDataWithFinishBlock:(FinishBlock)finish;

/**
 *  加载下厨房首页issues数据
 *
 *  @param dateStr 日期
 *  @param finish  回调block
 */
+ (void)loadIssuesDataWithDate:(NSString *)dateStr finish:(FinishBlock)finish;

+ (void)loadAdDataWithFinishBlock:(FinishBlock)finish;

@end
