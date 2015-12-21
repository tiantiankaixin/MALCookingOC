//
//  Template2Cell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Template2Cell.h"
#import "IssuesContent_Issues_Item.h"
#import "Template2item_Contents.h"

@implementation Template2Cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellFilldata:(id)data
{
    IssuesContent_Issues_Item *item = (IssuesContent_Issues_Item *)data;
    Template2item_Contents *content = (Template2item_Contents *)item.contents;
    self.title_1stLB.text = content.title_1st;
    self.title_2ndLB.text = content.title_2nd;
    [self.imView sd_setImageWithURL:MALURL(content.image.url) placeholderImage:nil options:SDWebImageLowPriority];
}

@end
