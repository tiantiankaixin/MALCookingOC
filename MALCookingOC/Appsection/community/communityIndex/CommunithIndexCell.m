//
//  CommunithIndexCell.m
//  MALCookingOC
//
//  Created by maliang on 15/12/26.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "CommunithIndexCell.h"
#import "Latest_authors.h"

@implementation CommunithIndexCell

- (void)awakeFromNib
{
    // Initialization code
    self.imContainerView.layer.cornerRadius = 4;
    self.imContainerView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(CommuityIndexModel *)model
{
    _model = model;
    self.nameLB.text = model.name;
    self.desLB.text = model.desc;
    [model.latest_authors enumerateObjectsUsingBlock:^(Latest_authors *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImageView *im = self.imArray[idx];
        MSDSetImage(im, obj.photo60, nil);
    }];
}

@end
