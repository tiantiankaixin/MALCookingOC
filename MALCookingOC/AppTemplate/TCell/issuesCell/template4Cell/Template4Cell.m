//
//  Template4Cell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Template4Cell.h"
#import "IssuesContent_Issues_Item.h"
#import "Template4item_Contents.h"

@implementation Template4Cell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellFilldata:(id)data
{
    IssuesContent_Issues_Item *item = (IssuesContent_Issues_Item *)data;
    Template4item_Contents *content = (Template4item_Contents *)item.contents;
    [self.imView sd_setImageWithURL:MALURL(content.image.url) placeholderImage:nil options:SDWebImageLowPriority];
    self.whisperLB.text = content.whisper;
}

@end
