//
//  TopicListCell.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicListModel_topic.h"

extern const int topicListCell_Height;
extern NSString *const topicListCell_Identifier;

@interface TopicListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *contentLB;
@property (weak, nonatomic) IBOutlet UILabel *latestCommentTimeLB;
@property (weak, nonatomic) IBOutlet UILabel *n_commentsLB;
@property (nonatomic, strong) TopicListModel_topic *model;


@end
