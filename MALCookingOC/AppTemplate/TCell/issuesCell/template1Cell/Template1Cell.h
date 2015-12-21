//
//  Template1Cell.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tcell.h"

@interface Template1Cell : Tcell
@property (weak, nonatomic) IBOutlet UIImageView *imView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *descLB;

@end
