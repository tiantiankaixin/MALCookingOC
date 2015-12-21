//
//  Template1Cell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Template1Cell.h"
#import "IssuesContent_Issues_Item.h"
#import "Template1item_Contents.h"

@implementation Template1Cell

- (void)awakeFromNib {
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
    Template1item_Contents *content = (Template1item_Contents *)item.contents;
    [self.imView sd_setImageWithURL:MALURL(content.image.url) placeholderImage:nil options:SDWebImageLowPriority];
    self.titleLB.text = content.title;
    self.descLB.text = content.desc;
}

@end
