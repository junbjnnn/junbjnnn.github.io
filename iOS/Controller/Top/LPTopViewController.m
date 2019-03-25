//
//  LPTopViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/19/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPSearchResultListViewController.h"
#import "LPMainAreaSelectViewController.h"
#import "LPSpecialSearchViewController.h"
#import "LPSpecialCategoryViewCell.h"
#import "LPSpecialCategoryFetcher.h"
#import "LPCalendarViewController.h"
#import "LPShopSearchParamEntity.h"
#import "LPTopViewController.h"
#import "MBProgressHUD.h"

@interface LPTopViewController () {
    NSInteger itemsPerRow;
    UIEdgeInsets sectionInsets;
    LPSpecialCategoryFetcher* _fetcher;
}
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureScreen;

@end

@implementation LPTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fetcher = [[LPSpecialCategoryFetcher alloc] init];
    sectionInsets = UIEdgeInsetsMake(0.0,0.0,0.0,0.0);
    itemsPerRow = 2;
    
    self.tableView.allowsSelection = NO;
    self.tapGestureScreen.cancelsTouchesInView = NO;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#d9d9d9"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LPSpecialCategoryViewCell" bundle:nil] forCellWithReuseIdentifier:@"SpecialCategoryViewCell"];

    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [_fetcher beginFetchWithSuccessTask:^{
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        [self.collectionView reloadData];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    } errorTask:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
    }];
    
}

// goi lai khi chuyen tab / khi click 3 nut / khi click header
- (IBAction)deselectTextfield:(id)sender {
    [_searchTextField resignFirstResponder];
}

- (IBAction)openURL:(id)sender {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[LPPropertyListUtility valueForKeyOfMaster:@"kWebViewURL" master:@"masterData"]]];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (IBAction)tapSearchButton:(id)sender {
    // create search param object
    LPShopSearchParamEntity *param = [[LPShopSearchParamEntity alloc] init];
    param.keyword 	= [self.searchTextField.text urlEncodedString];
    
    // push vc with param
    LPSearchResultListViewController *searchResultListVC = [[LPSearchResultListViewController alloc] initWithNibName:@"LPSearchResultListViewController" bundle:nil];
    searchResultListVC.shopSearchParam = param;
    [self.navigationController pushViewController:searchResultListVC animated:YES];
}

// Search area
- (IBAction)tapCalendar:(UILongPressGestureRecognizer *)sender {
    [self highlightTapSearchArea:sender];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        LPCalendarViewController *calendarVC = [[LPCalendarViewController alloc] initWithNibName:@"LPCalendarViewController" bundle:nil];
        [self.navigationController pushViewController:calendarVC animated:YES];
    }
}

- (IBAction)tapSearch:(UILongPressGestureRecognizer *)sender {
    [self highlightTapSearchArea:sender];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        LPMainAreaSelectViewController *mainAreaSelectVC = [[LPMainAreaSelectViewController alloc] initWithNibName:@"LPMainAreaSelectViewController" bundle:nil];
        [self.navigationController pushViewController:mainAreaSelectVC animated:YES];
    }
}

- (IBAction)tapMap:(UILongPressGestureRecognizer *)sender {
    [self highlightTapSearchArea:sender];
}

- (void)highlightTapSearchArea:(UILongPressGestureRecognizer *)sender {
    [self deselectTextfield:nil];
    sender.view.backgroundColor = (sender.state == UIGestureRecognizerStateBegan) ? [UIColor lightGrayColor] : [UIColor clearColor];
}

#pragma UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = CGRectMake(15, 5, self.view.frame.size.width, (section == 0) ? 30.0 : 50.0);
    label.font = [UIFont boldSystemFontOfSize:15];
    label.text = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView setBackgroundColor:[UIColor colorWithHexString:@"#d9d9d9"]];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section == 0) ? 30.0 : 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 60.0;
    } else if (indexPath.section == 1) {
        return 60.0 + self.view.frame.size.width / 3;
    } else {
        return ceil([_fetcher numberOfSpecialCategory] / 2.0) * 50.0;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self deselectTextfield:nil];
}

#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger n = [_fetcher numberOfSpecialCategory];
    return (n % 2 == 1) ? n + 1 : n;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LPSpecialCategoryEntity *sc = [_fetcher specialCategoryEntityAtIndex:indexPath.row];
    if (sc == nil) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"EmptyCell" forIndexPath:indexPath];
    }
    
    LPSpecialCategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SpecialCategoryViewCell" forIndexPath:indexPath];
    
    [cell setupViewCell:sc];
    
    return cell;
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < [_fetcher numberOfSpecialCategory]) {
        LPSpecialSearchViewController *specialSearchVC = [[LPSpecialSearchViewController alloc] initWithNibName:@"LPSpecialSearchViewController" bundle:nil];
        specialSearchVC.specialCategoryCode = [_fetcher specialCategoryEntityAtIndex:indexPath.row].code;
        [self.navigationController pushViewController:specialSearchVC animated:YES];
    }
}

#pragma UICollectionViewLayoutDelegare
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger widthPerItem = self.view.frame.size.width / itemsPerRow;
    NSInteger heightPerItem = 50;
    return CGSizeMake(widthPerItem, heightPerItem);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return sectionInsets;
}

@end
