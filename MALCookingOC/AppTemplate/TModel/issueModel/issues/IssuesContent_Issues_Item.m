//
//  IssuesContent_Issues_Item.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "IssuesContent_Issues_Item.h"
#import "IssuesContet_Issues_item_contents.h"//template 5
#import "Template2item_Contents.h"
#import "Template1item_Contents.h"
#import "Template4item_Contents.h"
#import "NSString+YN.h"

@implementation IssuesContent_Issues_Item

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"contents"])
    {
        return [self contentWithOldValue:oldValue];
    }
    return oldValue;
}

- (id)contentWithOldValue:(id)oldValue
{
    id model;
    NSString *cellIdentifier;
    NSString *cellNibName;
    CGFloat cellHeight;
    switch (self.Template)
    {
        case 5:
        {
            cellIdentifier = @"Template5Cell_Identifier";
            cellNibName = @"Template5Cell";
            cellHeight = 79 + SCREEN_WIDTH * (23 / 40.0);
            model = [IssuesContet_Issues_item_contents mj_objectWithKeyValues:oldValue];
            break;
        }
        case 2:
        {
            cellIdentifier = @"Template2Cell_Identifier";
            cellNibName = @"Template2Cell";
            cellHeight = SCREEN_WIDTH * (219 / 320.0);
            model = [Template2item_Contents mj_objectWithKeyValues:oldValue];
            break;
        }
        case 1:
        {
            NSString *desc = oldValue[@"desc"];
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:13]};
            CGFloat descHeight = [desc stringHeightWithAttributes:attributes viewWidth:SCREEN_WIDTH - 17 minHeight:30];
            cellIdentifier = @"Template1Cell_Identifier";
            cellNibName = @"Template1Cell";
            cellHeight = SCREEN_WIDTH * (190 / 320.0) + 35 + descHeight;
            model = [Template1item_Contents mj_objectWithKeyValues:oldValue];
            break;
        }
        case 4:
        {
            cellIdentifier = @"Template4Cell_Identifier";
            cellNibName = @"Template4Cell";
            cellHeight = SCREEN_WIDTH;
            model = [Template4item_Contents mj_objectWithKeyValues:oldValue];
            break;
        }
        default:
            break;
    }
    self.cellIdentifier = cellIdentifier;
    self.cellHeight = cellHeight;
    self.cellNibName = cellNibName;
    return model;
}

@end
