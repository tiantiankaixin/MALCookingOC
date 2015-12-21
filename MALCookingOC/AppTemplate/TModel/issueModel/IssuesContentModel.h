//
//  IssuesContentModel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IssuesContent_Cursor.h"

@interface IssuesContentModel : NSObject

@property (nonatomic, strong) IssuesContent_Cursor *cursor;
@property (nonatomic, strong) NSArray *issues;
@property (nonatomic, assign) int count;

@end
