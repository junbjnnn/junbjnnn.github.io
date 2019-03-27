//
//  LPShopDetailViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/22/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPShopDetailViewController.h"
#import "LPShopDetailFirstViewCell.h"
#import "LPShopDetailViewCell.h"
#import "LPShopFetcher.h"
#import "LPShopEntity.h"
#import "LPShopDetailHeaderView.h"

@interface LPShopDetailViewController () {
    NSArray *titleSection;
    NSArray *titleRow;
    NSArray *contentRow;
    LPShopFetcher *_fetcher;
    NSMutableArray *shopBookmark;
    NSMutableArray *shopBookmarkId;
    BOOL isBookmark;
}

@end

@implementation LPShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.allowsSelection = NO;
    self.tableView.estimatedRowHeight = 88.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.navigationItem.title = @"店舗詳細";
    
    _fetcher = [[LPShopFetcher alloc] init];
    
    LPShopEntity *s = self.shop;
    NSString *capacity = [NSString stringWithFormat:@"%@席(個室やテーブル席など各種ご用意！同窓会など各種宴会はお任せ！)",s.capacity];
    NSString *partyCapacity = [NSString stringWithFormat:@"%@席(個室やテーブル席など各種ご用意！同窓会など各種宴会はお任せ！)",s.partyCapacity];
    
    titleSection = @[@"", @"お店情報", @"お席", @"設備", @"その他"];
    titleRow = @[@"",
                 @[@"店名", @"住所", @"アクセス", @"営業時間", @"定休日", @"平均予算", @"クレジットカード", @"料金備考"],
                 @[@"総席数", @"最大宴会収容人数", @"個室", @"座敷", @"掘りごたつ", @"貸切", @"禁煙・喫煙"],
                 @[@"携帯の電波", @"Wi-Fi", @"バリアフリ", @"駐車場", @"英語メニュー", @"その他設備"],
                 @[@"飲み放題", @"食べ放題", @"お子様連れ", @"ウェディングパーティー二次会", @"備考"]];
    contentRow = @[@"",
                   @[s.nameKana, s.address, s.access, s.open, s.close, s.budget.average, s.card, s.budgetMemo],
                   @[capacity, partyCapacity, s.privateRoom, s.tatami, s.horigotatsu, s.charter, s.nonSmoking],
                   @[s.ktaiCoupon, s.wifi, s.barrierFree, s.parking, s.english, s.otherMemo],
                   @[s.freeDrink, s.freeFood, s.child, s.wedding, s.shopDetailMemo]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopDetailFirstViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopDetailFirstViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopDetailViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopDetailViewCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    // set bookmark => delete on bookmark page => recheck
    isBookmark = [_fetcher isShopBookmark:self.shop.shopId];
    [self setBookmarkButton];
}

- (void)bookmarkAction:(id)sender {
    
    if (isBookmark) {
        [_fetcher deleteShopBookmark:self.shop.shopId];
    } else if ([_fetcher addShopBookmark:self.shop]) {
        isBookmark = !isBookmark;
        [self setBookmarkButton];
    }
    
}

- (void)setBookmarkButton {
    NSString *imageNamed = isBookmark ? @"ic_remove_bookmark" : @"ic_add_bookmark";
    
    UIBarButtonItem *bookmarkBtn = [[UIBarButtonItem alloc]
                                    initWithImage:[UIImage imageNamed:imageNamed]
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(bookmarkAction:)];
    [bookmarkBtn setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = bookmarkBtn;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 9 - section;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    if (indexPath.section == 0) {
        LPShopDetailFirstViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LPShopDetailFirstViewCell" forIndexPath:indexPath];
        [cell setupViewCell:self.shop];
        
        return cell;
    }
    
    LPShopDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LPShopDetailViewCell" forIndexPath:indexPath];
    [cell setupViewCell:titleRow[indexPath.section][indexPath.row] content:contentRow[indexPath.section][indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (indexPath.section == 0) {
        return 40.0 + screenSize.width * 3 / 4;
    }
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *topLevelViews = [[NSBundle mainBundle] loadNibNamed:@"LPShopDetailHeaderView"
                                                           owner:self
                                                         options:nil];
    LPShopDetailHeaderView* headerView = topLevelViews[0];
    
    [headerView setupWithTitle:titleSection[section]];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0f;
    }
    return [LPShopDetailHeaderView viewHeight];
}

@end
