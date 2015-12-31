//
//  TopicListModel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicListModel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray *topics;
@property (nonatomic, assign) NSInteger total;

+ (NSMutableArray *)topicListModelArrayWithData:(NSDictionary *)dataDic;

@end
