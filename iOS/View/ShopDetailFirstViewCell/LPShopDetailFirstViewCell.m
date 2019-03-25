//
//  LPShopDetailFirstViewCell.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/25/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPShopDetailFirstViewCell.h"

@interface LPShopDetailFirstViewCell()
@property (weak, nonatomic) IBOutlet UIView *opacityView;

@end

@implementation LPShopDetailFirstViewCell

- (void)setupViewCell:(LPShopEntity *)shop {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _opacityView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
