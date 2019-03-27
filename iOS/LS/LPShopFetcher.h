//
//  LPShopFetcher.h
//  LessonPepper
//
//  Created by RTC-R726 on 3/21/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "LPFetcherBase.h"
#import "LPShopEntity.h"
#import "LPShopSearchParamEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface LPShopFetcher : LPFetcherBase
/*!
 @abstract  Featured information to be obtained from the network (the entire)
 @param     successTask: tasks that process of acquiring feature information is to run in ViewController side when completed successfully
 errorTask: Tasks to be performed in the ViewController side when the feature information acquisition process has failed
 */
- (void) beginFetchWithSuccessTask:(void (^)(void))successTask
                         errorTask:(void (^)(NSError*))errorTask
                   shopSearchParam:(LPShopSearchParamEntity*)param;
/*!
 @abstract  It returns the feature information corresponding to the specified index from a feature information that you are managing
 @param     idx: index value of the feature information to be acquired
 @return    Special information corresponding to the specified index value
 */
- (LPShopEntity *)shopEntityAtIndexPath:(NSInteger)idx;
/*!
 @abstract It will return the total number of feature information that you are fetching
 */
- (NSInteger)numberOfShopSearch;
/*!
 @abstract It will return the total number of feature information that you are managing
 */
- (NSString *)totalResult;

- (void)fetchShopBookmark;
- (NSString *)getTotalBookmark;
- (BOOL)addShopBookmark:(LPShopEntity *)shop;
- (void)deleteShopBookmark:(NSString *)shopId;
- (void)deleteAllShopBookmark;
- (BOOL)isShopBookmark:(NSString *)shopId;

@end

NS_ASSUME_NONNULL_END
