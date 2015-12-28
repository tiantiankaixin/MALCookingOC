//
//  CommunithIndexCell.h
//  MALCookingOC
//
//  Created by maliang on 15/12/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommuityIndexModel.h"

#define CommunityIndexCell_Identifier @"CommunithIndexCell"
#define CommunityIndexCell_Height  70

@interface CommunithIndexCell : UITableViewCell

@property (nonatomic, strong) CommuityIndexModel *model;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imArray;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *desLB;
@property (weak, nonatomic) IBOutlet UIView *imContainerView;

@end
