//
//  LPShopDetailHeader.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/25/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPShopDetailHeader.h"

@interface LPShopDetailHeader()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation LPShopDetailHeader

- (LPShopDetailHeader *)setupWithImageName:(NSString *)imageName withTitle:(NSString *)title {
    
    UIImage *image = [UIImage imageNamed:imageName];
    self.imageView.image = image;
    self.titleLabel.text = title;
    
}

+ (CGFloat)viewHeight {
    return 20.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
