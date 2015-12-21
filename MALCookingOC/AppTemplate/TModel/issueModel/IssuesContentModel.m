//
//  IssuesContentModel.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "IssuesContentModel.h"
#import "IssuesContent_Issues.h"
@implementation IssuesContentModel


- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"issues"])
    {
        return [IssuesContent_Issues mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

@end
