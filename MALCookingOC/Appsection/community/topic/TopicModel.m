//
//  TopicModel.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicModel.h"


@implementation TopicModel

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"txt"])
    {
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15]};
        CGFloat txtHeight = [oldValue stringHeightWithAttributes:attributes viewWidth:SCREEN_WIDTH - (320 - 246) minHeight:24] + 52;
        self.cellHeight = txtHeight;
    }
    return oldValue;
}

+ (NSMutableArray *)topicDataSourceWithData:(NSDictionary *)dataDic
{
    NSMutableArray *resultArray;
    NSString *status = dataDic[@"status"];
    if ([status isEqualToString:@"ok"])
    {
        NSArray *commentsArray = dataDic[@"content"][@"comments"];
        NSArray *topicDataArray = [TopicModel mj_objectArrayWithKeyValuesArray:commentsArray];
        resultArray = [NSMutableArray arrayWithArray:topicDataArray];
    }
    return resultArray;
}


@end
