//
//  TopicListModel_topic.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic_author_model.h"

@interface TopicListModel_topic : NSObject

@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger n_comments;
@property (nonatomic, copy) NSString *latest_comment_time;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, assign) BOOL is_sticked;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) Topic_author_model *author;

@end
