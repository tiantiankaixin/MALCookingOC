//
//  CommunityRequest.h
//  MALCookingOC
//
//  Created by maliang on 15/12/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommunityRequest : NSObject

+ (void)getCommunithRequestDataWithFinishBlock:(FinishBlock)finish;

/**
 *  获得主题列表数据
 *
 *  @param finish 回调block
 */
+ (void)getTopicListDataWithFinishBlock:(FinishBlock)finish;

@end
