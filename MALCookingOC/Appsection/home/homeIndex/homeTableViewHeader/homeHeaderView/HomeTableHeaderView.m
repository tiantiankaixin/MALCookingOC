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

@interface HomeTableHeaderView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *navCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *pop_recipe_picurl_IM;
@property (weak, nonatomic) IBOutlet UIButton *adBtn;
@property (nonatomic, strong) NSMutableArray *navDataSource;
@property (nonatomic, strong) NSMutableArray *pop_eventsDataSource;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) HomeHeaderModel *headerModel;
@property (nonatomic, strong) AdModel *adModel;
@property (weak, nonatomic) IBOutlet UIView *findFriendsView;

@end

@implementation HomeTableHeaderView

- (NSMutableArray *)navDataSource
{
    if (_navDataSource == nil)
    {
        _navDataSource = [[NSMutableArray alloc] init];
    }
    return _navDataSource;
}

- (NSMutableArray *)pop_eventsDataSource
{
    if (_pop_eventsDataSource == nil)
    {
        _pop_eventsDataSource = [[NSMutableArray alloc] init];
    }
    return _pop_eventsDataSource;
}

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
    self.navCollectionView.bounces = YES;
    self.foodCollectionView.bounces = YES;
}

#pragma mark - 填充header除了广告栏外的数据
- (void)fillHeaderDataWithModel:(HomeHeaderModel *)model
{
    self.headerModel = model;
    self.findFriendsView.hidden = NO;
    
    [self.pop_recipe_picurl_IM sd_setImageWithURL:MALURL(model.content.pop_recipe_picurl) placeholderImage:nil options:SDWebImageLowPriority];
    
    //pop_events
    [self.pop_eventsDataSource addObjectsFromArray:model.content.pop_events.events];
    self.pageControl.numberOfPages = self.pop_eventsDataSource.count;
    self.pageControl.hidden = NO;
    
    //navs
    [self.navDataSource addObjectsFromArray:model.content.navs];
    
    [self.navCollectionView reloadData];
    [self.foodCollectionView reloadData];
}

#pragma mark - 填充广告栏数据
- (void)fillAdDataWithModel:(AdModel *)adModel
{
    self.adModel = adModel;
    [self.adBtn sd_setImageWithURL:MALURL(adModel.content.ad_info.pic_url) forState:(UIControlStateNormal) placeholderImage:nil options:SDWebImageLowPriority];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger items = 0;
    if(collectionView == self.navCollectionView)
    {
        items = self.navDataSource.count;
    }
    else if (collectionView == self.foodCollectionView)
    {
        items = self.pop_eventsDataSource.count;
    }
    return items;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = NavCell_Identifier;
    NSMutableArray *dataSource = self.navDataSource;
    if (collectionView == self.foodCollectionView)
    {
        cellIdentifier = FoodCell_Identifier;
        dataSource = self.pop_eventsDataSource;
    }
    id model = dataSource[indexPath.row];
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell configueCellWithModel:model];
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

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.foodCollectionView)
    {
        CGFloat contentoffsetx = scrollView.contentOffset.x;
        NSInteger index = contentoffsetx / SCREEN_WIDTH;
        self.pageControl.currentPage = index;
    }
}

@end
