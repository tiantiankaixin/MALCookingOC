//
//  TopicViewController.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicListModel_topic.h"

@interface TopicViewController : UIViewController

+ (TopicViewController *)topicVCWithModel:(TopicListModel_topic *)model;

@end
