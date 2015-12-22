//
//  HomeHeaderModel.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeheaderModel_Content.h"

@interface HomeHeaderModel : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) HomeheaderModel_Content *content;

@end
