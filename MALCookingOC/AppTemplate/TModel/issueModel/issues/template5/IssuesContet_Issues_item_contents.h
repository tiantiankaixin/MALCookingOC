//
//  IssuesContet_Issues_item_contents.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IssuesContet_Issues_item_contents_author.h"
#import "IssuesContet_Issues_item_contents_image.h"

@interface IssuesContet_Issues_item_contents : NSObject

@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, strong) IssuesContet_Issues_item_contents_author *author;
@property (nonatomic, strong) IssuesContet_Issues_item_contents_image *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger n_cooked;
@property (nonatomic, assign) NSInteger n_dishes;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *recipe_id;
@property (nonatomic, copy) NSString *desc;

@end
