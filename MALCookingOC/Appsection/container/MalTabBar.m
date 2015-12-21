//
//  MalTabBar.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "MalTabBar.h"

@interface MalTabBar()

@property (nonatomic, assign) NSInteger currentIndex;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelArray;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageArray;
@property (nonatomic, strong) UIColor *defaultColor;
@property (nonatomic, strong) UIColor *selectColor;

@end

@implementation MalTabBar

+ (MalTabBar *)malTabBarWithImageArray:(NSArray *)imageArray
{
    MalTabBar *tabBar = (MalTabBar *)[[[NSBundle mainBundle] loadNibNamed:@"MalTabBar" owner:nil options:nil] firstObject];
    
    [tabBar setUpView];
    [tabBar configureSomeData];
    
    return tabBar;
}

- (void)setUpView
{
    [self setViewWidth:SCREEN_WIDTH];
}

- (void)configureSomeData
{
    self.currentIndex = -1;
    self.defaultColor = [UIColor blackColor];
    self.selectColor = [UIColor redColor];
    [self selectItemWithIndex:0];
}

- (IBAction)itemClick:(UIControl *)sender
{
    NSInteger selectIndex = sender.tag - 1;
    if ([self.tabBarDelegate respondsToSelector:@selector(selectIndex:)])
    {
        [self.tabBarDelegate selectIndex:selectIndex];
    }
    [self selectItemWithIndex:selectIndex];
}

- (void)selectItemWithIndex:(NSInteger)needSelectIndex
{
    if (needSelectIndex != self.currentIndex)
    {
        [self selectItemFromIndex:self.currentIndex toIndex:needSelectIndex];
    }
}

+ (BOOL)vaildIndex:(NSInteger)index
{
    if (index < 0 || index > 3)
    {
        return NO;
    }
    return YES;
}

- (void)selectItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    if ([MalTabBar vaildIndex:fromIndex])
    {
       UILabel *lb = self.labelArray[fromIndex];
       lb.textColor = self.defaultColor;
    }
    if ([MalTabBar vaildIndex:toIndex])
    {
        UILabel *lb = self.labelArray[toIndex];
        lb.textColor = self.selectColor;
    }
    self.currentIndex = toIndex;
}



@end
