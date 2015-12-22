//
//  AdModel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/22.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdContent.h"

@interface AdModel : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) AdContent *content;

@end
