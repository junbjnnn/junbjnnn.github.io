//
//  LPShopSearchParamEntity.h
//  LessonPepper
//
//  Created by RTC-R726 on 3/22/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPBaseEntity.h"
#import "LPGenreEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface LPShopSearchParamEntity : LPBaseEntity

@property (nonatomic, strong) NSString *shopId;
@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) NSString *middleArea;
@property (nonatomic, strong) NSString *special;
@property (nonatomic, strong) NSArray<LPGenreEntity *> *genreSearch;
@property (nonatomic, strong) NSString *largeServiceArea;
@property (nonatomic, strong) NSString *isOpenWeek;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, strong) NSString *ktaiCoupon;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, strong) NSString *range;

@end

NS_ASSUME_NONNULL_END
