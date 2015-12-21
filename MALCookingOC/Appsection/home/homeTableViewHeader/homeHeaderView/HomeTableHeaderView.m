//
//  HomeTableHeaderView.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "HomeTableHeaderView.h"
#import "Home_header_nav_cell.h"
#import "Home_header_food_cell.h"

#define NavCell_Identifier @"nav"
#define FoodCell_Identifier @"food"

@interface HomeTableHeaderView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *navCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;

@end

@implementation HomeTableHeaderView

+ (HomeTableHeaderView *)hometableheaderView
{
    HomeTableHeaderView *homeHeader = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableHeaderView" owner:nil options:nil] firstObject];
    [homeHeader setUpView];
    return homeHeader;
}

- (void)setUpView
{
    [self.navCollectionView registerNib:[UINib nibWithNibName:@"Home_header_nav_cell" bundle:nil] forCellWithReuseIdentifier:NavCell_Identifier];
    [self.foodCollectionView registerNib:[UINib nibWithNibName:@"Home_header_food_cell" bundle:nil] forCellWithReuseIdentifier:FoodCell_Identifier];
    self.navCollectionView.delegate = self;
    self.navCollectionView.dataSource = self;
    self.foodCollectionView.dataSource = self;
    self.foodCollectionView.delegate = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger items = 0;
    if(collectionView == self.navCollectionView)
    {
        items = 4;
    }
    else if (collectionView == self.foodCollectionView)
    {
        items = 3;
    }
    return items;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = NavCell_Identifier;
    if (collectionView == self.foodCollectionView)
    {
        cellIdentifier = FoodCell_Identifier;
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * (15 / 64.0));
    if (collectionView == self.navCollectionView)
    {
        size.height = 75;
        size.width = SCREEN_WIDTH / 4;
    }
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

@end
