//
//  TopicListCell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicListCell.h"

int const topicListCell_Height = 100;
NSString *const topicListCell_Identifier = @"topicListCell_Identifier";

@implementation TopicListCell

- (void)awakeFromNib
{
    // Initialization code
    self.userIcon.layer.cornerRadius = WIDTH(self.userIcon) / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(TopicListModel_topic *)model
{
    _model = model;
    [self.userIcon sd_setImageWithURL:MALURL(model.author.photo160) placeholderImage:nil options:SDWebImageLowPriority];
    self.nameLB.text = model.author.name;
    self.n_commentsLB.text = [NSString stringWithFormat:@"%ld评论",model.n_comments];
    self.contentLB.text = model.content;
}

@end
