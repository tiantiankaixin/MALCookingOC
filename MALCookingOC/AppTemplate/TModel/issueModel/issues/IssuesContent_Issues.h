//
//  IssuesContent_Issues.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssuesContent_Issues : NSObject

@property (nonatomic, assign) NSInteger items_count;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *issue_id;
@property (nonatomic, copy) NSString *publish_date;
@property (nonatomic, strong) NSArray *today_events;
@property (nonatomic, copy) NSString *column_name;

@end
