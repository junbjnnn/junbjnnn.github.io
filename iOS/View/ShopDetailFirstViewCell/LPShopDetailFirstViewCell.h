//
//  LPShopDetailFirstViewCell.h
//  LessonPepper
//
//  Created by RTC-R726 on 3/25/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LPShopEntity;

@interface LPShopDetailFirstViewCell : UITableViewCell
-(void)setupViewCell:(LPShopEntity *)shop;
@end

NS_ASSUME_NONNULL_END
