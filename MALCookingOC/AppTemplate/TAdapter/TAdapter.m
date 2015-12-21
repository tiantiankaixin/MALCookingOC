//
//  TAdapter.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TAdapter.h"
#import "IssuesModel.h"
#import "IssuesContent_Issues.h"
#import "IssuesContent_Issues_Item.h"

@implementation TAdapter

+ (NSMutableArray *)adapterIssuesData:(NSDictionary *)data
{
    if (data == nil)
    {
        return nil;
    }
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    IssuesModel *model = [IssuesModel mj_objectWithKeyValues:data];
    [resultArray addObject:model.content.cursor];
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    [model.content.issues enumerateObjectsUsingBlock:^(IssuesContent_Issues *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        TitleModel *titleModel = [[TitleModel alloc] init];
        titleModel.title = obj.title;
        [modelArray addObject:titleModel];
        for (IssuesContent_Issues_Item *item in obj.items)
        {
            if (!IsEmpty(item.cellIdentifier))
            {
                [modelArray addObject:item];
            }
        }
    }];
    [resultArray addObject:modelArray];
    return resultArray;
}

@end
