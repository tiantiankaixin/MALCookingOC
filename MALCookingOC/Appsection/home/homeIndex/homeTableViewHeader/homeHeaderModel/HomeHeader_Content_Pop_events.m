//
//  HomeHeader_Content_Pop_events.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeHeader_Content_Pop_events.h"
#import "HomeHeaderContentPopevent_event.h"

@implementation HomeHeader_Content_Pop_events

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"events"])
    {
        [HomeHeaderContentPopevent_event mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            
            return @{
                     
                     @"ID" :@"id"
                     
                     };
        }];
        return [HomeHeaderContentPopevent_event mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

@end
