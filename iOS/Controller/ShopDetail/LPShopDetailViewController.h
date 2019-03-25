//
//  LPShopDetailViewController.h
//  LessonPepper
//
//  Created by RTC-R726 on 3/22/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class LPShopEntity;

@interface LPShopDetailViewController : LPBaseTableViewController
@property (nonatomic, strong) LPShopEntity* shop;

@end

NS_ASSUME_NONNULL_END
