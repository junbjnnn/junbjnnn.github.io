//
//  AppDelegate.m
//
//  Created by Takayoshi Koshida on 12/12/03.
//  Copyright (c) 2012年 Recruit Technologies Co.,Ltd. All rights reserved.
//

#import "LPAppDelegate.h"
#import "GTMHTTPFetcher/GTMHTTPFetcherLogging.h"
#import "SDSCrashReporter/SDSCrashReporter.h"
#import "SDSNotifier/SDSNotifier.h"
#import "SDSNotifier/SDSNotifierDefaultHandler.h"
#import "SDSABTester.h"
#import "PusnaRS.h"
#import "PRSPush.h"
#import "PRSConfig.h"
#import <CoreData/CoreData.h>


@interface LPAppDelegate () <SDSCrashReporterDelegate> {
    SDSCrashReporter *_reporter;
    SDSNotifier *_notifier;
    SDSNotifierDefaultHandler *_notifierHandler;
}

@end

@implementation LPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // set default setting in NSUserDefaults
    [self setDefaultSetting];
#if DEBUG
    [GTMHTTPFetcher setLoggingEnabled:YES];
#endif
    // SDS:エラーログ収集機能を開始する
    [self startSDSCrashReporter];
    
    // SDS:お知らせ／強制アップデート機能を開始する
    [self startSDSNotifier];
    
    // SDS:ABテスト機能を開始する
    //[self startSDSABTester];
    
    
    // PusnaRS:PusnaRSを開始する
    //[self startPusnaRS];
   
    return YES;
}

#pragma set default setting in NSUserDefaults
- (void)setDefaultSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults stringForKey:@"countShopFetch"] == nil) {
        [defaults setInteger:10 forKey:@"countShopFetch"];
    }
    if ([defaults stringForKey:@"maxShopBookmark"] == nil) {
        [defaults setInteger:20 forKey:@"maxShopBookmark"];
    }
}

#pragma mark - PusnaRS

- (void)startPusnaRS
{
    /*
     PusnaRSの開始
     */
    PRSConfig *config = [PRSConfig defaultConfig];
#if DEBUG && !ADHOC
    config.logging = YES;
    config.inProduction = NO;
#endif
    
    [[PusnaRS shared] start:config];
    
    /*
     Pushの利用登録
     */
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000    // Xcode6以降でビルドする場合
    if ([[UIApplication sharedApplication] respondsToSelector:NSSelectorFromString(@"registerUserNotificationSettings:")]) {
        // iOS 8以降
        UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge;
        NSSet *categories = nil;
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
        
        [[PRSPush shared] registerForRemoteNotifications];
    } else {
        // iOS 7以下
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        UIRemoteNotificationType types = UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge;
        [[PRSPush shared] registerForRemoteNotificationTypes:types];
#pragma GCC diagnostic pop
    }
#else   // Xcode5以前でビルドする場合
    UIRemoteNotificationType types = UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge;
    [[PRSPush shared] registerForRemoteNotificationTypes:types];
#endif
}


#pragma mark - SDS

/*
 * SDSエラーログ収集機能を開始する
 */
- (void)startSDSCrashReporter
{
#if DEBUG
    [SDSCrashReporter outputLog];
#endif
    
    _reporter = [SDSCrashReporter sharedManager];
    _reporter.delegate = self;
    
#if DEBUG || ADHOC
    _reporter.submissionURL = kSDSErrorLogAPIDevelopmentURL;
#else
    _reporter.submissionURL = kSDSErrorLogAPIProductionURL;
#endif
}

/*
 * SDSお知らせ／強制アップデート機能を開始する
 */
- (void)startSDSNotifier
{
#if DEBUG
    [SDSNotifier outputLog];
#endif
    
    _notifierHandler = [[SDSNotifierDefaultHandler alloc] init];
#warning updateURLをAppStoreのURLに変更してください
    _notifierHandler.updateURL = @"";
    
    _notifier = [SDSNotifier sharedManager];
    _notifier.delegate = _notifierHandler;
#if DEBUG || ADHOC
    _notifier.requestURL = kSDSNotifierAPIDevelopmentURL;
    _notifier.interval = 0;
#else
    _notifier.requestURL = kSDSNotifierAPIProductionURL;
#endif
    
    [_notifier check];
}

/*
 * SDS ABテスト機能を開始する
 */
- (void)startSDSABTester
{
#if DEBUG
    [SDSABTester outputLog];
#endif
    
    SDSABTester *tester = [SDSABTester sharedManager];
#if DEBUG || ADHOC
    tester.requestURL = kSDSABTesterAPIDevelopmentURL;
#else
    tester.requestURL = kSDSABTesterAPIProductionURL;
#endif
}

#pragma mark - SDSCrashReporterDelegate

- (NSString *)crashReporterAppStatusOnTerminate:(BOOL)onTerminate
{
    return nil;
}

- (void)crashReporterAppDidCrashInLastSession:(SDSCrashReport *)report
{
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "net.sontq.MyStore" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ShopBookmark" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ShopBookmark.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
