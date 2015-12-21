//
//  IssuesContent_Cursor.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssuesContent_Cursor : NSObject

@property (nonatomic, assign) BOOL has_next;
@property (nonatomic, assign) BOOL has_prev;
@property (nonatomic, copy) NSString *prev;
@property (nonatomic, copy) NSString *next;

@end
