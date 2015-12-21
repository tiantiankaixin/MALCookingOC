//
//  IssuesContet_Issues_item_contents.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "IssuesContet_Issues_item_contents.h"

@implementation IssuesContet_Issues_item_contents

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"author"])
    {
        [IssuesContet_Issues_item_contents_author mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            
            return @{@"ID":@"id"};
        }];
        return [IssuesContet_Issues_item_contents_author mj_objectWithKeyValues:oldValue];
    }
    return oldValue;
}

@end
