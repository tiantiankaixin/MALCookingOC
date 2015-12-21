//
//  MalTabBar.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MalTabBarDelegate <NSObject>

- (void)selectIndex:(NSInteger)index;

@end

@interface MalTabBar : UIView

@property (nonatomic, weak) id<MalTabBarDelegate> tabBarDelegate;

+ (MalTabBar *)malTabBarWithImageArray:(NSArray *)imageArray;

- (void)selectItemWithIndex:(NSInteger)needSelectIndex;

@end
