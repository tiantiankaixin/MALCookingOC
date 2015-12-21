//
//  Template5Cell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Template5Cell.h"
#import "IssuesContent_Issues_Item.h"
#import "IssuesContet_Issues_item_contents.h"

@implementation Template5Cell

- (void)awakeFromNib
{
    // Initialization code
    self.photoIM.layer.cornerRadius = WIDTH(self.photoIM) / 2;
    self.photoIM.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellFilldata:(id)data
{
    IssuesContent_Issues_Item *item = (IssuesContent_Issues_Item *)data;
    IssuesContet_Issues_item_contents *content = (IssuesContet_Issues_item_contents *)item.contents;
    [self.imView sd_setImageWithURL:MALURL(content.image.url) placeholderImage:nil];
    self.titleLB.text = content.title;
    self.descLB.text = content.desc;
    self.n_cookedLB.text = [NSString stringWithFormat:@"%ld人做过",content.n_cooked];
    [self.photoIM sd_setImageWithURL:MALURL(content.author.photo) placeholderImage:nil options:SDWebImageLowPriority];
}

@end
