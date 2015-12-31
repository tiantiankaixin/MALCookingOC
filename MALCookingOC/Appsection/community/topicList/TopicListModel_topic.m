//
//  TopicListModel_topic.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicListModel_topic.h"


@implementation TopicListModel_topic

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"author"])
    {
        [Topic_author_model mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            
            return @{
                     
                     @"ID" : @"id"
                     
                     };
        }];
        return [Topic_author_model mj_objectWithKeyValues:oldValue];
    }
    return oldValue;
}

@end
