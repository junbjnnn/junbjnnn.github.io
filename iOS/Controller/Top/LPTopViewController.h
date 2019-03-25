//
//  LPTopViewController.h
//  LessonPepper
//
//  Created by RTC-R726 on 3/19/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 @class  LPTopViewController
 @abstract appear information of LPTopViewController
 */
@interface LPTopViewController : UITableViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/*!
 @abstract appear information of LPTopViewController
 @param sender (url)
 */
- (IBAction)openURL:(id)sender;
- (IBAction)tapSearchButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
