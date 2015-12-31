//
//  TopicListModel.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicListModel.h"
#import "TopicListModel_topic.h"

@implementation TopicListModel

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"topics"])
    {
        [TopicListModel_topic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            
            return @{
                     
                     @"ID" : @"id"
                     
                     };
        }];
        return [TopicListModel_topic mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

+ (NSMutableArray *)topicListModelArrayWithData:(NSDictionary *)dataDic
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *status = dataDic[@"status"];
    if ([status isEqualToString:@"ok"])
    {
        NSDictionary *content = dataDic[@"content"];
        TopicListModel *model = [TopicListModel mj_objectWithKeyValues:content];
        [array addObjectsFromArray:model.topics];
    }
    return array;
}

@end
