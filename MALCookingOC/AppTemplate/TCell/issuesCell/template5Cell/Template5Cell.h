//
//  Template5Cell.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/21.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tcell.h"

@interface Template5Cell : Tcell

@property (weak, nonatomic) IBOutlet UIImageView *imView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *descLB;
@property (weak, nonatomic) IBOutlet UILabel *n_cookedLB;
@property (weak, nonatomic) IBOutlet UIImageView *photoIM;

@end
