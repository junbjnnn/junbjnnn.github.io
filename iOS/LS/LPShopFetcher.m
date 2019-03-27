//
//  LPShopFetcher.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/21/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPShopFetcher.h"
#import "LPShopEntity.h"
#import "LPShopSearchParamEntity.h"
#import "MBProgressHUD.h"

@interface LPShopFetcher() {
    NSString* totalResult;
    NSManagedObjectContext *context;
    NSFetchRequest *fetchRequest;
    NSArray *shopBookmark;
    NSArray *shopBookmarkId;
    NSString *countShopFetchVal;
    NSString *maxShopBookmarkVal;
    BOOL isCoupon;
    BOOL isOpenTime;
}

@property (nonatomic, strong) NSMutableArray* shopArray;
@property (nonatomic, strong) NSMutableDictionary* tagParam;

@end

@implementation LPShopFetcher

- (id)init {
    self = [super init];
    if (self) {
        totalResult = @"";
        self.shopArray = [[NSMutableArray alloc] init];
        self.tagParam = [[NSMutableDictionary alloc] init];
        
        [self.tagParam setObject:@"コースあり" forKey:@"course"];
        [self.tagParam setObject:@"飲み放題あり" forKey:@"freeDrink"];
        [self.tagParam setObject:@"食べ放題あり" forKey:@"freeFood"];
        [self.tagParam setObject:@"個室あり" forKey:@"privateRoom"];
        [self.tagParam setObject:@"掘りごたつあり" forKey:@"horigotatsu"];
        [self.tagParam setObject:@"座敷あり" forKey:@"tatami"];
        [self.tagParam setObject:@"カード利用可" forKey:@"card"];
        [self.tagParam setObject:@"一部禁煙" forKey:@"nonSmoking"];
    }
    
    return self;
}

- (void)getSettingFromUser {
    // get setting param from user data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    countShopFetchVal = [defaults stringForKey:@"countShopFetch"];
    maxShopBookmarkVal = [defaults stringForKey:@"maxShopBookmark"];
    isCoupon = [defaults boolForKey:@"isCoupon"];
    isOpenTime = [defaults boolForKey:@"isOpenTime"];
}

- (void) beginFetchWithSuccessTask:(void (^)(void))successTask errorTask:(void (^)(NSError*))errorTask shopSearchParam:(LPShopSearchParamEntity*)param
{
    [self getSettingFromUser];
    //show network indicator in status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // get url fetch
    NSString *urlString = [LPPropertyListUtility valueForKeyOfMaster:@"kSearchShopBaseURL" master:@"masterData"];
    urlString = [self appendUrlString:urlString param:@"id" value:param.shopId];
    urlString = [self appendUrlString:urlString param:@"keyword" value:param.keyword];
    urlString = [self appendUrlString:urlString param:@"middle_area" value:param.middleArea];
    urlString = [self appendUrlString:urlString param:@"special" value:param.special];
    urlString = [self appendUrlString:urlString param:@"genre" value:param.genreSearch];
    urlString = [self appendUrlString:urlString param:@"large_service_area" value:param.largeServiceArea];
    urlString = [self appendUrlString:urlString param:@"is_open_week" value:param.isOpenWeek];
    urlString = [self appendUrlString:urlString param:@"lat" value:param.lat];
    urlString = [self appendUrlString:urlString param:@"lng" value:param.lng];
    urlString = [self appendUrlString:urlString param:@"range" value:param.range];
    urlString = [self appendUrlString:urlString param:@"start" value:param.start];
    urlString = [self appendUrlString:urlString param:@"count" value:countShopFetchVal];
    urlString = [self appendUrlString:urlString param:@"ktai_coupon" value:isCoupon ? @"0" : @"1"];
    urlString = [self appendUrlString:urlString param:@"is_open_time" value:isOpenTime ? @"now" : nil];
    
    GTMHTTPFetcher *fetcher = (GTMHTTPFetcher *) [self managedFetcherWithURLString:urlString];
    
    //remove all object inarrays
    if ([param.start isEqualToString:@"1"]) {
        [self.shopArray removeAllObjects];
    }
    
    __weak LPShopFetcher *weakself = self;
    [fetcher beginFetchWithCompletionHandler:^(NSData *data, NSError *error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (!error) {
            //alloc xml and check conditon of error
            NSError *error = nil;
            GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData: data
                                                                   options: 0
                                                                     error: &error];
            
            //get data
            totalResult = [self stringValueFromGData:doc.rootElement byElementName:@"results_available"];
            NSArray* shops = [doc.rootElement elementsForName:@"shop"];
            for (GDataXMLElement *shop in shops) {
                
                GDataXMLElement *budgetNode  = [shop elementsForName:@"budget"][0];
                LPBudgetEntity *budgetEntity = [[LPBudgetEntity alloc] init];
                budgetEntity.code       = [self stringValueFromGData:budgetNode byElementName:@"code"];
                budgetEntity.name       = [self stringValueFromGData:budgetNode byElementName:@"name"];
                budgetEntity.average    = [self stringValueFromGData:budgetNode byElementName:@"average"];
                
                GDataXMLElement *genreNode = [shop elementsForName:@"genre"][0];
                LPGenreEntity *genreEntity = [[LPGenreEntity alloc] init];
                genreEntity.code = [self stringValueFromGData:genreNode byElementName:@"code"];
                genreEntity.name = [self stringValueFromGData:genreNode byElementName:@"name"];
                
                GDataXMLElement *photo = [shop elementsForName:@"photo"][0];
                GDataXMLElement *photoMobile = [photo elementsForName:@"mobile"][0];
                
                //complie data
                LPShopEntity *shopEntity    = [[LPShopEntity alloc] init];
                shopEntity.shopId           = [self stringValueFromGData:shop byElementName:@"id"];
                shopEntity.access           = [self stringValueFromGData:shop byElementName:@"access"];
                shopEntity.address          = [self stringValueFromGData:shop byElementName:@"address"];
                shopEntity.barrierFree      = [self stringValueFromGData:shop byElementName:@"barrier_free"];
                shopEntity.budgetMemo       = [self stringValueFromGData:shop byElementName:@"budget_memo"];
                shopEntity.capacity         = [self stringValueFromGData:shop byElementName:@"capacity"];
                shopEntity.card             = [self stringValueFromGData:shop byElementName:@"card"];
                shopEntity.catchh           = [self stringValueFromGData:shop byElementName:@"catch"];
                shopEntity.charter          = [self stringValueFromGData:shop byElementName:@"charter"];
                shopEntity.child            = [self stringValueFromGData:shop byElementName:@"child"];
                shopEntity.close            = [self stringValueFromGData:shop byElementName:@"close"];
                shopEntity.course           = [self stringValueFromGData:shop byElementName:@"course"];
                shopEntity.english          = [self stringValueFromGData:shop byElementName:@"english"];
                shopEntity.freeDrink        = [self stringValueFromGData:shop byElementName:@"free_drink"];
                shopEntity.freeFood         = [self stringValueFromGData:shop byElementName:@"free_food"];
                shopEntity.horigotatsu      = [self stringValueFromGData:shop byElementName:@"horigotatsu"];
                shopEntity.ktaiCoupon       = [self stringValueFromGData:shop byElementName:@"ktai_coupon"];
                shopEntity.name             = [self stringValueFromGData:shop byElementName:@"name"];
                shopEntity.nameKana         = [self stringValueFromGData:shop byElementName:@"name_kana"];
                shopEntity.nonSmoking       = [self stringValueFromGData:shop byElementName:@"non_smoking"];
                shopEntity.open             = [self stringValueFromGData:shop byElementName:@"open"];
                shopEntity.otherMemo        = [self stringValueFromGData:shop byElementName:@"other_memo"];
                shopEntity.parking          = [self stringValueFromGData:shop byElementName:@"parking"];
                shopEntity.partyCapacity    = [self stringValueFromGData:shop byElementName:@"party_capacity"];
                shopEntity.privateRoom      = [self stringValueFromGData:shop byElementName:@"private_room"];
                shopEntity.shopDetailMemo   = [self stringValueFromGData:shop byElementName:@"shop_detail_memo"];
                shopEntity.tatami           = [self stringValueFromGData:shop byElementName:@"tatami"];
                shopEntity.wedding          = [self stringValueFromGData:shop byElementName:@"wedding"];
                shopEntity.wifi             = [self stringValueFromGData:shop byElementName:@"wifi"];
                shopEntity.photo            = [self stringValueFromGData:photoMobile byElementName:@"s"];
                shopEntity.tag              = [self shopTagArray:shopEntity];
                shopEntity.budget           = budgetEntity;
                shopEntity.genre            = genreEntity;
                
                // add object to array
                [weakself.shopArray addObject:shopEntity];
            }
            
            successTask();
            
        } else {
            //TODO: Google Toolkit for Mac API が制御したError...
            NSLog(@"***Error*** %@::%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error localizedDescription]);
            errorTask(error);
        }
        
    }];
}

// fetch from core data
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)fetchRequest {
    // Fetch the shop from persistent data store
    context = [self managedObjectContext];
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ShopBookmark"];
    
    shopBookmark = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    shopBookmarkId = [shopBookmark valueForKey:@"shopId"];
    
}

- (void)fetchShopBookmark {
    [self fetchRequest];
    [self getSettingFromUser];
    
    totalResult = [@(shopBookmark.count) stringValue];
    [self.shopArray removeAllObjects];
    int i = 0;
    for (NSManagedObject *shop in shopBookmark) {
        if (++i > [maxShopBookmarkVal intValue]) {
            break;
        }
        
        LPGenreEntity *genre = [[LPGenreEntity alloc] init];
        LPShopEntity *shopEntity = [[LPShopEntity alloc] init];
        shopEntity.shopId   = [shop valueForKey:@"shopId"];
        shopEntity.photo    = [shop valueForKey:@"photo"];
        shopEntity.open     = [shop valueForKey:@"open"];
        shopEntity.name     = [shop valueForKey:@"name"];
        shopEntity.catchh   = [shop valueForKey:@"catch"];
        shopEntity.access   = [shop valueForKey:@"access"];
        genre.name          = [shop valueForKey:@"genreName"];
        shopEntity.genre    = genre;
        
        shopEntity.course       = [shop valueForKey:@"course"];
        shopEntity.freeDrink    = [shop valueForKey:@"freeDrink"];
        shopEntity.freeFood     = [shop valueForKey:@"freeFood"];
        shopEntity.privateRoom  = [shop valueForKey:@"privateRoom"];
        shopEntity.horigotatsu  = [shop valueForKey:@"horigotatsu"];
        shopEntity.tatami       = [shop valueForKey:@"tatami"];
        shopEntity.card         = [shop valueForKey:@"card"];
        shopEntity.nonSmoking   = [shop valueForKey:@"nonSmoking"];
        shopEntity.tag          = [self shopTagArray:shopEntity];
        
        // add object to array
        [self.shopArray addObject:shopEntity];
    }
}

- (BOOL)addShopBookmark:(LPShopEntity *)shop {
    [self getSettingFromUser];
    
    if ([shopBookmark count] < [maxShopBookmarkVal integerValue]) {
        NSManagedObject *newShopBookmark = [NSEntityDescription insertNewObjectForEntityForName:@"ShopBookmark" inManagedObjectContext:context];
        
        [newShopBookmark setValue:shop.shopId forKey:@"shopId"];
        [newShopBookmark setValue:shop.genre.name forKey: @"genreName"];
        [newShopBookmark setValue:shop.name forKey:@"name"];
        [newShopBookmark setValue:shop.access forKey:@"access"];
        [newShopBookmark setValue:shop.catchh forKey:@"catch"];
        [newShopBookmark setValue:shop.open forKey:@"open"];
        [newShopBookmark setValue:shop.photo forKey:@"photo"];
        
        [newShopBookmark setValue:shop.course forKey:@"course"];
        [newShopBookmark setValue:shop.freeDrink forKey: @"freeDrink"];
        [newShopBookmark setValue:shop.freeFood forKey:@"freeFood"];
        [newShopBookmark setValue:shop.privateRoom forKey:@"privateRoom"];
        [newShopBookmark setValue:shop.horigotatsu forKey:@"horigotatsu"];
        [newShopBookmark setValue:shop.tatami forKey:@"tatami"];
        [newShopBookmark setValue:shop.card forKey:@"card"];
        [newShopBookmark setValue:shop.nonSmoking forKey:@"nonSmoking"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        return YES;
    }
    
    return NO;
}

- (NSString *)getTotalBookmark {
    if ([totalResult intValue] < [maxShopBookmarkVal intValue]) {
        return totalResult;
    }
    return maxShopBookmarkVal;
}

- (void)deleteShopBookmark:(NSString *)shopId {
    [self fetchRequest];
    
    NSInteger index = [shopBookmarkId indexOfObject:shopId];
    [context deleteObject:[shopBookmark objectAtIndex:index]];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
}

- (void)deleteAllShopBookmark {
    [self fetchRequest];
    
    for (NSString *shopId in shopBookmarkId) {
        [self deleteShopBookmark:shopId];
    }
}

- (BOOL)isShopBookmark:(NSString *)shopId {
    [self fetchRequest];
    
    return [shopBookmarkId containsObject:shopId];
}

- (LPShopEntity *)shopEntityAtIndexPath:(NSInteger)idx {
    if (self.shopArray.count > 0) {
        return [self.shopArray objectAtIndex:idx];
    }
    return [[LPShopEntity alloc]init];
}

- (NSInteger)numberOfShopSearch {
    return [self.shopArray count];
}

- (NSString *)totalResult {
    return totalResult;
}

- (NSString*)stringValueFromGData:(GDataXMLElement*)gData byElementName:(NSString*)elementName{
    NSArray *arr = [gData elementsForName:elementName];
    GDataXMLElement *node = [arr objectAtIndex:0];
    return node.stringValue;
}

- (NSString*)appendUrlString:(NSString*)urlString param:(NSString*)param value:(NSObject*)value {
    if ([param isEqualToString:@"genre"]) {
        NSArray<LPGenreEntity*> *genres = (NSArray *)value;
        for (LPGenreEntity *genre in genres) {
            urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&genre=%@", genre.code]];
        }
    } else if (value != nil) {
        urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"&%@=%@", param, value]];
    }
    return urlString;
}

- (NSMutableArray *)shopTagArray:(LPShopEntity *)shop {
    NSMutableArray *shopTagArray = [[NSMutableArray alloc] init];
    
    [self addTag:shopTagArray byCheckString:shop.course forKey:@"course"];
    [self addTag:shopTagArray byCheckString:shop.freeDrink forKey:@"freeDrink"];
    [self addTag:shopTagArray byCheckString:shop.freeFood forKey:@"freeFood"];
    [self addTag:shopTagArray byCheckString:shop.privateRoom forKey:@"privateRoom"];
    [self addTag:shopTagArray byCheckString:shop.horigotatsu forKey:@"horigotatsu"];
    [self addTag:shopTagArray byCheckString:shop.tatami forKey:@"tatami"];
    [self addTag:shopTagArray byCheckString:shop.card forKey:@"card"];
    [self addTag:shopTagArray byCheckString:shop.nonSmoking forKey:@"nonSmoking"];
    
    return shopTagArray;
}

- (NSMutableArray *)addTag:(NSMutableArray *)shopTagArray byCheckString:(NSString *)checkString forKey:(NSString *)key {
    if (([key isEqualToString:@"card"] && [checkString containsString:@"利用可"])
        || ([key isEqualToString:@"nonSmoking"] && [checkString containsString:@"一部禁煙"])
        || [checkString containsString:@"あり"]) {
        [shopTagArray addObject:[self.tagParam objectForKey:key]];
    }
    return shopTagArray;
}

@end
