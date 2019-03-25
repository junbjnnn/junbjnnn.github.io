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
    NSDictionary *setupTagsInfo;
    UIRefreshControl* refreshControl;
    // TODO add fetch data to array => ...
}

@end

@implementation LPSearchResultListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _fetcher = [[LPShopFetcher alloc] init];
    
    // CHANGE TIEU DE
    self.navigationItem.title = @"検索結果";
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"titleCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopSearchViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopSearchViewCell"];
    
    [self fetchData];
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat leadingSubView = 10.0;
    CGFloat widthSubView = screenSize.width - leadingSubView;
    setupTagsInfo = @{@"btnSpace" : [NSNumber numberWithFloat:5.0],
                      @"topSpace" : [NSNumber numberWithFloat:0.0],
                      @"leftSpace" : [NSNumber numberWithFloat:0.0],
                      @"heightBtn" : [NSNumber numberWithFloat:20.0],
                      @"borderBtn" : [NSNumber numberWithFloat:1.0],
                      @"widthSubView" : [NSNumber numberWithFloat:widthSubView],
                      @"leadingSubView" : [NSNumber numberWithFloat:leadingSubView],
                      @"spaceInsideBtn" : [NSNumber numberWithFloat:20.0]
                      };
    
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
    
    [refreshControl endRefreshing];
    [self.tableView reloadData];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LPShopDetailViewController *shopDetailVC = [[LPShopDetailViewController alloc] initWithNibName:@"LPShopDetailViewController" bundle:nil];
    shopDetailVC.shop = [_fetcher shopEntityAtIndexPath:indexPath.row];
    [self.navigationController pushViewController:shopDetailVC animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : [_fetcher numberOfShopSearch];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        NSString *totalResult = [@([_fetcher totalResult]) stringValue];
        totalResult = [NSString stringWithFormat:@"%.2lu", (unsigned long)totalResult.length];
        NSString *titleString = [NSString stringWithFormat:@"%ld件の検索結果", (long)[_fetcher totalResult]];
        
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleString];
        [title addAttribute:NSFontAttributeName
                      value:[UIFont boldSystemFontOfSize:27.0]
                      range:NSMakeRange(0, [totalResult intValue])];
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        [cell.textLabel setAttributedText:title];
        
        return cell;
    }
    
    LPShopSearchViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"LPShopSearchViewCell"];
    [cell setupViewCell:[_fetcher shopEntityAtIndexPath:indexPath.row]
          setupTagsInfo:setupTagsInfo];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section == 0) ? 0.001 : 10.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50;
    }
        
    CGFloat heightShopInfo = 180.0;
    CGFloat btnSpace = [[setupTagsInfo valueForKey:@"btnSpace"] floatValue];
    CGFloat topSpace = [[setupTagsInfo valueForKey:@"topSpace"] floatValue];
    CGFloat leftSpace = [[setupTagsInfo valueForKey:@"leftSpace"] floatValue];
    CGFloat heightBtn = [[setupTagsInfo valueForKey:@"heightBtn"] floatValue];
    CGFloat borderBtn = [[setupTagsInfo valueForKey:@"borderBtn"] floatValue];
    CGFloat widthSubView = [[setupTagsInfo valueForKey:@"widthSubView"] floatValue];
    CGFloat spaceInsideBtn = [[setupTagsInfo valueForKey:@"spaceInsideBtn"] floatValue];
    
    UIFont *font = [UIFont fontWithName:@"Palatino-Roman" size:10.0];
    
    for (NSString *tag in [_fetcher shopEntityAtIndexPath:indexPath.row].tag) {
        CGSize stringSize = [tag sizeWithAttributes:@{NSFontAttributeName: font}];
        
        CGFloat widthBtn = stringSize.width + spaceInsideBtn;
        if ((leftSpace + btnSpace + widthBtn) > widthSubView) {
            leftSpace = 0.0;
            topSpace += heightBtn + btnSpace;
        }
        leftSpace += btnSpace + widthBtn + borderBtn*2;
    }
    
    return topSpace + heightBtn + heightShopInfo;
}

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
    if (distanceFromBottom < height && [_fetcher numberOfShopSearch] < [_fetcher totalResult]) {
        self.shopSearchParam.start = [@([_fetcher numberOfShopSearch] + 1) stringValue];
        [self fetchData];
    }
}

@end
