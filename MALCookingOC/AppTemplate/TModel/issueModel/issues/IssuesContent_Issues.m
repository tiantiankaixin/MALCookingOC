//
//  IssuesContent_Issues.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "IssuesContent_Issues.h"
#import "IssuesContent_Issues_Item.h"

@implementation IssuesContent_Issues

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"items"])
    {
        [IssuesContent_Issues_Item mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            
            return @{
                     @"Template" : @"template",
                     @"ID" : @"id"
                     };
        }];
        return [IssuesContent_Issues_Item mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

- (NSString *)description
{
    return self.title;
}

@end
