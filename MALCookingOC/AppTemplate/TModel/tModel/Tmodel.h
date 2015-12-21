//
//  Tmodel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tmodel : NSObject

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, copy) NSString *cellNibName;

- (id)cellWithtableView:(UITableView *)tableView;

@end
