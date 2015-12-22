//
//  AdContent.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/22.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdContent_adInfo.h"
@interface AdContent : NSObject

@property (nonatomic, assign) NSInteger ad_type;
@property (nonatomic, strong) AdContent_adInfo *ad_info;

@end
