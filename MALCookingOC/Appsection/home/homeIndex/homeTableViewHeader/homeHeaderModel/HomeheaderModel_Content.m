//
//  HomeheaderModel_Content.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeheaderModel_Content.h"
#import "HomeHeader_Content_navs.h"

@implementation HomeheaderModel_Content

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"navs"])
    {
        return [HomeHeader_Content_navs mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

@end
