//
//  AppHelp.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "SingleClass.h"

#define appHelp  [AppHelp shareInstance]

@interface AppHelp : SingleClass

- (NSDateFormatter *)formatterWithDateformat:(NSString *)dateFormat;

@end
