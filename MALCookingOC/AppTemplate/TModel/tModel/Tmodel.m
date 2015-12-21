//
//  Tmodel.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Tmodel.h"

@implementation Tmodel

- (id)cellWithtableView:(UITableView *)tableView
{
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:self.cellNibName bundle:nil] forCellReuseIdentifier:self.cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    return cell;
}

- (NSString *)description
{
    return self.cellIdentifier;
}

@end
