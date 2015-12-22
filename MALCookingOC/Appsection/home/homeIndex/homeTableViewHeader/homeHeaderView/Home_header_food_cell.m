//
//  Home_header_food_cell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Home_header_food_cell.h"
#import "HomeHeaderContentPopevent_event.h"
#import "HomeHeader_Content_PopEvent_dishes.h"

@implementation Home_header_food_cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configueCellWithModel:(id)model
{
    HomeHeaderContentPopevent_event *event = (HomeHeaderContentPopevent_event *)model;
    NSString *name = [[event.name componentsSeparatedByString:@"•"] firstObject];
    self.nameLB.text = [NSString stringWithFormat:@"- %@ -",name];
    self.ndishsLB.text = [NSString stringWithFormat:@"%@作品",event.n_dishes];
    NSString *imageUrlStr = [[event.dishes firstObject] thumbnail_280];
    [self.rightIM sd_setImageWithURL:MALURL(imageUrlStr) placeholderImage:nil options:SDWebImageLowPriority];
}

@end
