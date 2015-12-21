//
//  Issues_titleCell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Issues_titleCell.h"
#import "TitleModel.h"

@implementation Issues_titleCell

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
    TitleModel *model = (TitleModel *)data;
    self.titleLB.text = model.title;
}

@end
