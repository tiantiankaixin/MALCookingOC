//
//  TopicCell.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"

extern NSString *const topicCellIdentifier;

@interface TopicCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userIconIM;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *txtLB;
@property (weak, nonatomic) IBOutlet UILabel *dateLB;
@property (nonatomic, strong) TopicModel *model;

@end
