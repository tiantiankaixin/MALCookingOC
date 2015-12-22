//
//  HomeTableHeaderView.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHeaderModel.h"
#import "AdModel.h"

@interface HomeTableHeaderView : UIView

+ (HomeTableHeaderView *)hometableheaderView;
/**
 *  填充header除了广告栏外的数据
 *
 *  @param model model description
 */
- (void)fillHeaderDataWithModel:(HomeHeaderModel *)model;

/**
 *  填充广告栏数据
 *
 *  @param adModel adModel description
 */
- (void)fillAdDataWithModel:(AdModel *)adModel;

@end
