//
//  Template1item_Contents.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IssuesContet_Issues_item_contents_image.h"

@interface Template1item_Contents : NSObject

@property (nonatomic, strong) IssuesContet_Issues_item_contents_image *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;

@end
