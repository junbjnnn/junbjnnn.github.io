//
//  XTableViewCell.h
//  TestTagListView
//
//  Created by ~JunBjn~ on 3/24/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewTag;
@property (weak, nonatomic) IBOutlet UILabel *labb;

-(void)setupViewCell:(NSMutableArray *)tags setupTagsInfo:(NSDictionary *)setupTagsInfo;

@end
