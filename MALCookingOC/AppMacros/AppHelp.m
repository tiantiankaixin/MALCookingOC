//
//  AppHelp.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "AppHelp.h"

@interface AppHelp()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation AppHelp

- (NSDateFormatter *)dateFormatter
{
    if (_dateFormatter == nil)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}

- (NSDateFormatter *)formatterWithDateformat:(NSString *)dateFormat
{
    _dateFormatter.dateFormat = dateFormat;
    return _dateFormatter;
}

@end
