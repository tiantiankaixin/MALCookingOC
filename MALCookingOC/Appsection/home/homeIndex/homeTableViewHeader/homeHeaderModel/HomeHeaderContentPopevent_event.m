//
//  HomeHeaderContentPopevent_event.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/22.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeHeaderContentPopevent_event.h"
#import "HomeHeader_Content_PopEvent_dishes.h"

@implementation HomeHeaderContentPopevent_event

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"dishes"])
    {
        NSArray *dishesArray = oldValue[@"dishes"];
        return [HomeHeader_Content_PopEvent_dishes mj_objectArrayWithKeyValuesArray:dishesArray];
    }
    return oldValue;
}

@end
