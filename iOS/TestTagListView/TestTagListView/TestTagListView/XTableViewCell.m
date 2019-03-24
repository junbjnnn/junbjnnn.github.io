//
//  XTableViewCell.m
//  TestTagListView
//
//  Created by ~JunBjn~ on 3/24/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//

#import "XTableViewCell.h"
@interface XTableViewCell() {
    CGFloat btnSpace;
    CGFloat topSpace;
    CGFloat leftSpace;
    CGFloat heightBtn;
    CGFloat spaceInsideBtn;
    CGFloat widthScreen;
}

@end
@implementation XTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setupViewCell:(NSMutableArray *)tags setupTagsInfo:(NSDictionary *)setupTagsInfo{
    // set view tag leading = 10, trailing = 0;
    btnSpace = [[setupTagsInfo valueForKey:@"btnSpace"] floatValue];
    topSpace = [[setupTagsInfo valueForKey:@"topSpace"] floatValue];
    leftSpace = [[setupTagsInfo valueForKey:@"leftSpace"] floatValue];
    heightBtn = [[setupTagsInfo valueForKey:@"heightBtn"] floatValue];
    spaceInsideBtn = [[setupTagsInfo valueForKey:@"spaceInsideBtn"] floatValue];
    widthScreen = self.viewTag.frame.size.width;
    
    for (NSString *tag in tags) {
        [self.viewTag addSubview:[self createTag:tag]];
    }
    
}

- (UIButton *)createTag:(NSString *)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button addTarget:self ction:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    // trai' , tren,
    [button setTitle:tag forState:UIControlStateNormal];
    CGSize stringSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: button.titleLabel.font}];
    
    CGFloat widthButton = stringSize.width + spaceInsideBtn;
    if ((leftSpace + btnSpace + widthButton) > widthScreen) {
        leftSpace = 0.0;
        topSpace += heightBtn + btnSpace;
    }
    
    button.frame = CGRectMake(leftSpace, topSpace, widthButton, heightBtn);
    // inside #c6d9f1 border #5a91d6 ||| #558ed5 mau chu xanh - #e2221a mau do - #800000 chu do - xam #d9d9d9
    button.backgroundColor = [UIColor redColor];
    button.layer.cornerRadius = 10;
    
    leftSpace += btnSpace + widthButton;
    
    return button;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self setBackgroundColor:[UIColor clearColor]];
    // Configure the view for the selected state
}

@end
