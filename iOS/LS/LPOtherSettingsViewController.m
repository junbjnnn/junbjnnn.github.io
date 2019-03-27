//
//  LPOtherSettingsViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/27/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPOtherSettingsViewController.h"
#import "BlueGradientButton.h"
#import "LPShopFetcher.h"

@interface LPOtherSettingsViewController () {
    LPShopFetcher* _fetcher;
    NSArray *countShopFetch;
    NSArray *maxShopBookmark;
    NSString *namePickerView;
    BOOL isShowPickerView;
    NSUserDefaults *defaults;
}
@property (weak, nonatomic) IBOutlet UILabel *countShopFetchLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxShopBookmarkLabel;
@property (weak, nonatomic) IBOutlet UISwitch *isCouponSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isOpenTimeSwitch;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *pickBtn;

@end

@implementation LPOtherSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _fetcher = [[LPShopFetcher alloc] init];
    countShopFetch = @[@"1", @"10", @"20", @"30", @"40"];
    maxShopBookmark = @[@"5", @"10", @"20", @"30", @"40", @"50"];
    
    CGFloat widthBtn = [[UIScreen mainScreen] bounds].size.width - 60;
    self.pickBtn = [BlueGradientButton setGradient:self.pickBtn widthBtn:widthBtn];
    
    defaults = [NSUserDefaults standardUserDefaults];
    NSString *countShopFetchVal = [defaults stringForKey:@"countShopFetch"];
    NSString *maxShopBookmarkVal = [defaults stringForKey:@"maxShopBookmark"];
    BOOL isCoupon = [defaults boolForKey:@"isCoupon"];
    BOOL isOpenTime = [defaults boolForKey:@"isOpenTime"];
    
    self.countShopFetchLabel.text = [NSString stringWithFormat:@"%@件", countShopFetchVal];
    self.maxShopBookmarkLabel.text = [NSString stringWithFormat:@"%@件", maxShopBookmarkVal];
    [self.isCouponSwitch setOn:isCoupon animated:YES];
    [self.isOpenTimeSwitch setOn:isOpenTime animated:YES];
}

- (IBAction)isCouponAction:(id)sender {
    [self setBoolToUserDefaults:sender forKey:@"isCoupon"];
}

- (IBAction)isOpenTimeAction:(id)sender {
    [self setBoolToUserDefaults:sender forKey:@"isOpenTime"];
}

- (void)setBoolToUserDefaults:(id)sender forKey:(NSString *)key {
    defaults = [NSUserDefaults standardUserDefaults];
    UISwitch *mySwitch = (UISwitch *)sender;
    [defaults setBool:[mySwitch isOn] forKey:key];
}

#pragma UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = CGRectMake(20, (section == 0) ? 20 : 30, self.view.frame.size.width, 20);
    label.font = [UIFont systemFontOfSize:16];
    label.text = [self tableView:tableView titleForHeaderInSection:section];
    label.textColor = [UIColor darkGrayColor];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50.0f;
    }
    return 60.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return isShowPickerView ? 150.0f : 0.0f;
    }
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    // pick count shop fetch
    if (section == 0 && row == 0) {
        namePickerView = @"countShopFetch";
        [self reloadPickerView:namePickerView];
        return;
    }
    
    // pick max shop bookmark
    if (section == 1 && row == 0) {
        namePickerView = @"maxShopBookmark";
        [self reloadPickerView:namePickerView];
        return;
    }
    
    // delete all bookmark
    if (section == 1 && row == 1) {
        [self deleteAllBookmark];
    }
}

- (void)reloadPickerView:(NSString *)namePickerView {
    isShowPickerView = YES;
    
    [self.pickerView reloadAllComponents];
    [self.pickerView selectRow:0 inComponent:0 animated:YES];
    [self.tableView reloadData];
    //[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)pickAction:(id)sender {
    isShowPickerView = NO;
    
    defaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [self.pickerView selectedRowInComponent:0];
    NSInteger pickVal;
    
    if ([namePickerView isEqualToString:@"countShopFetch"]) {
        pickVal = [[countShopFetch objectAtIndex:index] integerValue];
        [defaults setInteger:pickVal forKey:@"countShopFetch"];
        self.countShopFetchLabel.text = [NSString stringWithFormat:@"%@件", @(pickVal)];
    } else {
        pickVal = [[maxShopBookmark objectAtIndex:index] integerValue];
        [defaults setInteger:pickVal forKey:@"maxShopBookmark"];
        self.maxShopBookmarkLabel.text = [NSString stringWithFormat:@"%@件", @(pickVal)];
    }
    
    [self.tableView reloadData];
}

- (void)deleteAllBookmark {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@""
                                 message:@"ブックマークを全て削除します。\nよろしいですか？"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //Add Buttons
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"YES"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    [_fetcher deleteAllShopBookmark];
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

#pragma UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    if ([namePickerView isEqualToString:@"countShopFetch"]) {
        return countShopFetch.count;
    }
    return maxShopBookmark.count;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if ([namePickerView isEqualToString:@"countShopFetch"]) {
        return countShopFetch[row];
    }
    return maxShopBookmark[row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //Here, like the table view you can get the each section of each row if you've multiple sections
    NSLog(@"Selected Color: Index of selected color: %i", row);
    
    //Now, if you want to navigate then;
    // Say, OtherViewController is the controller, where you want to navigate:
    //OtherViewController *objOtherViewController = [OtherViewController new];
    //[self.navigationController pushViewController:objOtherViewController animated:YES];
    
}

@end
