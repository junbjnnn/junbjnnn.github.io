//
//  BlueGradientButton.m
//  LessonPepper
//
//  Created by ~JunBjn~ on 3/27/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "BlueGradientButton.h"

@implementation BlueGradientButton

+ (UIButton *)setGradient:(UIButton *)btn widthBtn:(CGFloat)widthBtn {
    btn.layer.borderColor = [[UIColor colorWithHexString:@"#4a7ebb"] CGColor];
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 8;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    CGRect frame = btn.layer.bounds;
    frame.size.width = widthBtn;
    gradientLayer.frame = frame;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithHexString:@"#b2cfff"].CGColor,
                            (id)[UIColor colorWithHexString:@"#4385d3"].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = btn.layer.cornerRadius;
    [btn.layer addSublayer:gradientLayer];
    
    return btn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
