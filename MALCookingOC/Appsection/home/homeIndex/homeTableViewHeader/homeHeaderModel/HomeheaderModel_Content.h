//
//  HomeheaderModel_Content.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeHeader_Content_Pop_events.h"

@interface HomeheaderModel_Content : NSObject

@property (nonatomic, copy) NSString *pop_recipe_picurl;
@property (nonatomic, strong) HomeHeader_Content_Pop_events *pop_events;
@property (nonatomic, strong) NSArray *navs;

@end
