//
//  IssuesModel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IssuesContentModel.h"
@interface IssuesModel : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) IssuesContentModel *content;

@end
