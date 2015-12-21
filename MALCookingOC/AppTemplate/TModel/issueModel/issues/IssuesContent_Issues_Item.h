//
//  IssuesContent_Issues_Item.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tmodel.h"

@interface IssuesContent_Issues_Item : Tmodel

@property (nonatomic, copy) NSString *publish_time;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) NSInteger Template;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) id contents;


@end
