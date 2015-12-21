//
//  NSDate+mal.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "NSDate+mal.h"

@implementation NSDate (mal)

+ (NSString *)todayStrWithDateformatter:(NSDateFormatter *)formatter
{
    return [formatter stringFromDate:[NSDate date]];
}

@end
