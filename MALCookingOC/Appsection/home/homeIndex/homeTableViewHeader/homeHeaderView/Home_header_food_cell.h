//
//  Home_header_food_cell.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home_header_food_cell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftIM;
@property (weak, nonatomic) IBOutlet UIImageView *rightIM;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *ndishsLB;

- (void)configueCellWithModel:(id)model;

@end
