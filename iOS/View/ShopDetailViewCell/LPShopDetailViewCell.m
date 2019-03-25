//
//  LPShopDetailViewCell.m
//  LessonPepper
//
//  Created by ~JunBjn~ on 3/25/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPShopDetailViewCell.h"
#import "LPShopEntity.h"

@interface LPShopDetailViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation LPShopDetailViewCell

-(void)setupViewCell:(NSString *)title content:(NSString *)content {
    self.titleLabel.text = title;
    self.contentLabel.text = content;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
