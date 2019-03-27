//
//  LPBookmarkViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/27/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPBookmarkViewController.h"
#import "LPShopDetailViewController.h"
#import "LPShopSearchViewCell.h"
#import "LPShopFetcher.h"
#import "MBProgressHUD.h"

@interface LPBookmarkViewController () {
    LPShopFetcher* _fetcher;
    CGFloat screenWidth;
}

@end

@implementation LPBookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.tableView.allowsSelection = NO;
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    _fetcher = [[LPShopFetcher alloc] init];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"titleCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopSearchViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopSearchViewCell"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_fetcher fetchShopBookmark];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return [_fetcher numberOfShopSearch];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        // TODO - Tach view
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        NSString *totalResult = [_fetcher getTotalBookmark];
        totalResult = [NSString stringWithFormat:@"%.2lu", (unsigned long)totalResult.length];
        NSString *titleString = [NSString stringWithFormat:@"%@件の検索結果", [_fetcher getTotalBookmark]];
        
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleString];
        [title addAttribute:NSFontAttributeName
                      value:[UIFont boldSystemFontOfSize:27.0]
                      range:NSMakeRange(0, [totalResult intValue])];
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        [cell.textLabel setAttributedText:title];
        
        return cell;
    }
    
    LPShopEntity *shop = [_fetcher shopEntityAtIndexPath:indexPath.row];
    LPShopSearchViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LPShopSearchViewCell"];
    [cell setupConstaintValue:screenWidth];
    [cell setupViewCell:shop];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001f;
    }
    return 10.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50.0f;
    }
    
    LPShopEntity *shop = [_fetcher shopEntityAtIndexPath:indexPath.row];
    LPShopSearchViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LPShopSearchViewCell"];
    [cell setupConstaintValue:screenWidth];
    
    return [cell getHeightForCell:shop heightShopInfo:180.0f];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    LPShopEntity *shop = [_fetcher shopEntityAtIndexPath:indexPath.row];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"削除"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self deleteBookmark:shop.shopId];
    }];
    
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

- (void)deleteBookmark:(NSString *)shopId {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@""
                                 message:@"ブックマークを削除します。\nよろしいですか？"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //Add Buttons
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"YES"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    [_fetcher deleteShopBookmark:shopId];
                                    [self viewWillAppear:YES];
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"NO"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    
    //Add your buttons to alert controller
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
