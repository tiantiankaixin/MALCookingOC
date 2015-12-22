//
//  Home_header_nav_cell.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home_header_nav_cell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picurlIM;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;

- (void)configueCellWithModel:(id)model;

@end
