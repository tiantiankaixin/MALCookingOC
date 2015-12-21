//
//  SingleClass.m
//  YNSugarNursety
//
//  Created by wangtian on 15/8/28.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "SingleClass.h"

@implementation SingleClass

+ (instancetype)shareInstance
{
    static id singleObject = nil;
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        
        singleObject = [[self alloc] init];
    });
    return singleObject;
}

@end
