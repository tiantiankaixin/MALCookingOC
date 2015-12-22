//
//  Home_header_nav_cell.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "Home_header_nav_cell.h"
#import "HomeHeader_Content_navs.h"
#define MSDSetImage(view,url,placeholder) [view sd_setImageWithURL:MALURL(url) placeholderImage:placeholder options:SDWebImageLowPriority]
@implementation Home_header_nav_cell

- (void)awakeFromNib
{
    
}

- (void)configueCellWithModel:(id)model
{
    HomeHeader_Content_navs *nav = (HomeHeader_Content_navs *)model;
    self.nameLB.text = nav.name;
    MSDSetImage(self.picurlIM, nav.picurl, nil);
}

@end
