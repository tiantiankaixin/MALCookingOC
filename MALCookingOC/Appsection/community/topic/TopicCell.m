//
//  TopicCell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/31.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TopicCell.h"

 NSString *const topicCellIdentifier = @"topicCellIdentifier";

@implementation TopicCell

- (void)awakeFromNib
{
    // Initialization code
    self.userIconIM.layer.cornerRadius = WIDTH(self.userIconIM) / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(TopicModel *)model
{
    [self.userIconIM sd_setImageWithURL:MALURL( model.author.photo160) placeholderImage:nil options:SDWebImageLowPriority];
    self.nameLB.text = model.author.name;
    self.txtLB.text = model.txt;
    self.dateLB.text = [[model.create_time componentsSeparatedByString:@" "] firstObject];
}

@end
