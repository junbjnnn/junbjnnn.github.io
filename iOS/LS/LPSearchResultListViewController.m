//
//
//  LPSearchResultListViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/21/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPSearchResultListViewController.h"
#import "LPShopDetailViewController.h"
#import "LPShopSearchViewCell.h"
#import "LPShopFetcher.h"
#import "MBProgressHUD.h"

@interface LPSearchResultListViewController () {
    LPShopFetcher* _fetcher;
    CGFloat screenWidth;
    UIRefreshControl* refreshControl;
}

@end

@implementation LPSearchResultListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _fetcher = [[LPShopFetcher alloc] init];
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    self.navigationItem.title = @"検索結果";
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"titleCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopSearchViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopSearchViewCell"];
    
    [self fetchData];
    
    // refresh control table
    refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    
    if (@available(iOS 10.0, *)) {
        self.tableView.refreshControl = refreshControl;
    } else {
        [self.tableView addSubview:refreshControl];
    }
}

- (void)refreshTable {
    self.shopSearchParam.start = @"1";
    [_fetcher beginFetchWithSuccessTask:^{
        [self.tableView reloadData];
        [refreshControl endRefreshing];
    } errorTask:^(NSError *error) {
    } shopSearchParam:self.shopSearchParam];
}

- (void)fetchData {
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [_fetcher beginFetchWithSuccessTask:^{
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        [self.tableView reloadData];
    } errorTask:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
    } shopSearchParam:self.shopSearchParam];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LPShopEntity *shop = [_fetcher shopEntityAtIndexPath:indexPath.row];
    LPShopDetailViewController *shopDetailVC = [[LPShopDetailViewController alloc] initWithNibName:@"LPShopDetailViewController" bundle:nil];
    shopDetailVC.shop = shop;
    [self.navigationController pushViewController:shopDetailVC animated:YES];
}

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
        NSString *totalResult = [_fetcher totalResult];
        totalResult = [NSString stringWithFormat:@"%.2lu", (unsigned long)totalResult.length];
        NSString *titleString = [NSString stringWithFormat:@"%@件の検索結果", [_fetcher totalResult]];
        
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

// scroll to load more

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self scrollingFinish:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollingFinish:scrollView];
}

- (void)scrollingFinish:(UIScrollView *)scrollView {
    NSInteger height = scrollView.frame.size.height;
    NSInteger contentYoffset = scrollView.contentOffset.y;
    NSInteger distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    if (distanceFromBottom < height && [_fetcher numberOfShopSearch] < [[_fetcher totalResult] integerValue]) {
        self.shopSearchParam.start = [@([_fetcher numberOfShopSearch] + 1) stringValue];
        [self fetchData];
    }
}

@end
