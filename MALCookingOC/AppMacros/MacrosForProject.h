//
//  MacrosForProject.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/22.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#ifndef MacrosForProject_h
#define MacrosForProject_h

#pragma mark - 应用内使用的一些全局变量

#define AppGeneralBgColor   RGB(245, 245, 236)

#pragma mark - 第三方框架
//SDWebImage
#define MSDSetImage(view,url,placeholder) [view sd_setImageWithURL:MALURL(url) placeholderImage:placeholder options:SDWebImageLowPriority]



#endif /* MacrosForProject_h */
