//
//  LPGenreSearchViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/26/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPGenreSearchViewController.h"
#import "LPSearchResultListViewController.h"
#import "LPGenreEntity.h"
#import "LPGenreFetcher.h"
#import "LPShopSearchParamEntity.h"
#import "MBProgressHUD.h"
#import "BlueGradientButton.h"

@interface LPGenreSearchViewController () {
    LPGenreFetcher* _fetcher;
    NSMutableArray* genres;
}
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end

@implementation LPGenreSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _fetcher = [[LPGenreFetcher alloc] init];
    genres = [[NSMutableArray alloc] init];
    
    CGFloat widthBtn = [[UIScreen mainScreen] bounds].size.width - 60;
    self.searchBtn = [BlueGradientButton setGradient:self.searchBtn widthBtn:widthBtn];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [_fetcher beginFetchWithSuccessTask:^{
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
        [self.tableView reloadData];
    } errorTask:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 50.0)];
}

- (IBAction)searchAction:(id)sender {
    // get genre selected object
    NSMutableArray *genreSearch = [[NSMutableArray alloc] init];
    for(NSNumber *i in genres) {
        NSIndexPath *tempIndexPath = [NSIndexPath indexPathForRow:[i integerValue] inSection:0];
        [genreSearch addObject:[_fetcher genreEntityAtIndex:tempIndexPath.row-1]];
    }
    
    // create search param object
    LPShopSearchParamEntity *param = [[LPShopSearchParamEntity alloc] init];
    param.genreSearch = genreSearch;
    
    // push vc with param
    LPSearchResultListViewController *searchResultListVC = [[LPSearchResultListViewController alloc] initWithNibName:@"LPSearchResultListViewController" bundle:nil];
    searchResultListVC.shopSearchParam = param;
    [self.navigationController pushViewController:searchResultListVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        // deselect all row
        for(NSNumber *i in genres) {
            NSIndexPath *tempIndexPath = [NSIndexPath indexPathForRow:[i integerValue] inSection:0];
            [tableView cellForRowAtIndexPath:tempIndexPath].accessoryType = UITableViewCellAccessoryNone;
        }
        [genres removeAllObjects];
        return;
    }
    
    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark){
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [genres removeObject:[NSNumber numberWithInteger:indexPath.row]];
    } else if (genres.count < 3) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [genres addObject:[NSNumber numberWithInteger:indexPath.row]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_fetcher numberOfGenre] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = indexPath.row == 0 ? @"指定なし" : [_fetcher genreEntityAtIndex:indexPath.row-1].name;
    
    if ([genres containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 55.0)];
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 20.0, self.view.frame.size.width, 20.0)];
    headerTitle.text = @"ジャンルを選択";
    [headerView setBackgroundColor:[UIColor colorWithHexString:@"#d9d9d9"]];
    [headerView addSubview:headerTitle];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}

@end
