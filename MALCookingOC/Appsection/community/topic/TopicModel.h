//
//  TopicModel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic_author_model.h"

@interface TopicModel : NSObject

@property (nonatomic, strong) Topic_author_model *author;

@property (nonatomic, strong) NSArray *at_users;

@property (nonatomic, copy) NSString *target_id;

@property (nonatomic, copy) NSString *txt;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, assign) CGFloat cellHeight;

+ (NSMutableArray *)topicDataSourceWithData:(NSDictionary *)dataDic;

@end
