//
//  LPSearchResultListViewController.h
//  LessonPepper
//
//  Created by RTC-R726 on 3/21/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class LPShopSearchParamEntity;

@interface LPSearchResultListViewController : LPBaseTableViewController
@property (nonatomic, strong) LPShopSearchParamEntity* shopSearchParam;

@end

NS_ASSUME_NONNULL_END
