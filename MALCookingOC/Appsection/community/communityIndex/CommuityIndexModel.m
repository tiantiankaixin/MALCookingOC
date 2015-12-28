//
//  CommuityIndexModel.m
//  MALCookingOC
//
//  Created by maliang on 15/12/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "CommuityIndexModel.h"
#import "Latest_authors.h"

@implementation CommuityIndexModel

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"latest_authors"])
    {
        return [Latest_authors mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

+ (NSArray *)getCommunityIndexDataSourceWithData:(NSDictionary *)data
{
    if (![[data objectForKey:@"status"] isEqualToString:@"ok"])
    {
        return nil;
    }
    [CommuityIndexModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{
                 
                 @"ID" : @"id"
                 };
    }];
    return [CommuityIndexModel mj_objectArrayWithKeyValuesArray:data[@"content"][@"forums"]];
}

@end
