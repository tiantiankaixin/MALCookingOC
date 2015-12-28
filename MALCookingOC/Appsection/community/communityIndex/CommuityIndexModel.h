//
//  CommuityIndexModel.h
//  MALCookingOC
//
//  Created by maliang on 15/12/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommuityIndexModel : NSObject

@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *latest_authors;

+ (NSArray *)getCommunityIndexDataSourceWithData:(NSDictionary *)data;

@end
