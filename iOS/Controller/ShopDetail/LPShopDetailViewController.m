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
#import "LPShopEntity.h"
#import "LPShopDetailHeader.h"

@interface LPShopDetailViewController () {
    NSArray *titleSection;
    NSArray *titleRow;
    NSArray *contentRow;
}

@end

@implementation LPShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.estimatedRowHeight = 88.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.navigationItem.title = @"XXX";
    
    titleSection = @[@"",@"お店情報",@"お席",@"設備",@"その他"];
    titleRow = @[@[@"店名",@"住所",@"アクセス",@"営業時間",@"定休日",@"平均予算",@"クレジットカード",@"料金備考"],
                 @[@"総席数",@"最大宴会収容人数",@"個室",@"座敷",@"掘りごたつ",@"貸切",@"禁煙・喫煙"],
                 @[@"携帯の電波",@"Wi-Fi",@"バリアフリ",@"駐車場",@"英語メニュー",@"その他設備"],
                 @[@"飲み放題",@"食べ放題",@"お子様連れ",@"ウェディングパーティー二次会",@"備考"]];
    contentRow = @[@[self.shop.nameKana, self.shop.address, self.shop.access, self.shop.open, self.shop.close, self.shop.budget.average, self.shop.card, self.shop.budgetMemo],
                  @[[NSString stringWithFormat:@"%@席(個室やテーブル席など各種ご用意！同窓会など各種宴会はお任せ！)",self.shop.capacity],
                    [NSString stringWithFormat:@"%@人(個室やテーブル席など各種ご用意！同窓会など各種宴会はお任せ！)",self.shop.partyCapacity],
                    self.shop.privateRoom, self.shop.tatami, self.shop.horigotatsu, self.shop.charter, self.shop.nonSmoking],
                   @[self.shop.ktaiCoupon, self.shop.wifi, self.shop.barrierFree, self.shop.parking, self.shop.english, self.shop.otherMemo],
                   @[self.shop.freeDrink, self.shop.freeFood, self.shop.child, self.shop.wedding, self.shop.shopDetailMemo]];

    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopDetailFirstViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopDetailFirstViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LPShopDetailViewCell" bundle:nil] forCellReuseIdentifier:@"LPShopDetailViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : 9 - section;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    if (indexPath.section == 0) {
        LPShopDetailFirstViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LPShopDetailFirstViewCell" forIndexPath:indexPath];
        [cell setupViewCell:self.shop];
        return cell;
    }
    LPShopDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LPShopDetailViewCell" forIndexPath:indexPath];
    [cell setupViewCell:titleRow[indexPath.section-1][indexPath.row] content:contentRow[indexPath.section-1][indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 55.0)];
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(40.0, 20.0, self.view.frame.size.width, 20.0)];
    
    UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20.0, 20.0, 20.0)];
    UIImage *image = [UIImage imageNamed:@"ic_genre.jpg"];
    imageHolder.image = image;
    // [imageHolder sizeToFit];
    [headerView addSubview:imageHolder];
    
    headerTitle.text = section == 0 ? @"" : titleSection[section - 1];
    [headerView setBackgroundColor:[UIColor colorWithHexString:@"#d9d9d9"]];
    [headerView addSubview:headerTitle];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0f;
    }
    return 50.0f;
}

@end
