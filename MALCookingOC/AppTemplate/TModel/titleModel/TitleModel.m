//
//  TitleModel.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TitleModel.h"

@implementation TitleModel

- (instancetype)init
{
    if (self = [super init])
    {
        self.cellIdentifier = @"Issues_titleCell_Identifier";
        self.cellNibName = @"Issues_titleCell";
        self.cellHeight = 64;
    }
    return self;
}

@end
