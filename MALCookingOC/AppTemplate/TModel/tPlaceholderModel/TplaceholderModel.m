//
//  TplaceholderModel.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/23.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "TplaceholderModel.h"

@implementation TplaceholderModel

+ (TplaceholderModel *)placeholderModel
{
    TplaceholderModel *model = [[TplaceholderModel alloc] init];
    
    model.cellIdentifier = @"PlaceholderCell_Identifier";
    model.cellNibName = @"PlaceholderCell";
    model.cellHeight = 269;
    
    return model;
}

+ (NSMutableArray *)getPlaceHolderWithNo:(NSInteger)no
{
    NSMutableArray *placeHolders = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < no; i++)
    {
        [placeHolders addObject:[TplaceholderModel placeholderModel]];
    }
    
    return placeHolders;
}

@end
