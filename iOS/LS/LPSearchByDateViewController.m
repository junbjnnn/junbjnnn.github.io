//
//  LPSearchByDateViewController.m
//  LessonPepper
//
//  Created by RTC-R726 on 3/27/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPSearchByDateViewController.h"
#import "BlueGradientButton.h"
#import "LPSearchResultListViewController.h"
#import "LPShopSearchParamEntity.h"

@interface LPSearchByDateViewController () {
    NSUInteger numDays;//1-31
    int thisYear;//2019
    int thisMonth;//1-12
    int thisDay;//1-7
    int weekday;
    int curDay;
    int curMonth;
    int curYear;
    UIColor *selectedDayColor;
    UIColor *currentDayColor;
    UIColor *defaultColor;
    NSString *btnStatus;
}
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIButton *prevSelectBtn;
@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCalendarView;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end

@implementation LPSearchByDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGFloat widthBtn    = [[UIScreen mainScreen] bounds].size.width - 40;
    self.searchBtn      = [BlueGradientButton setGradient:self.searchBtn widthBtn:widthBtn];
    selectedDayColor    = [UIColor colorWithHexString:@"#c0504d"];
    currentDayColor     = [UIColor colorWithHexString:@"#4f81bd"];
    defaultColor        = [UIColor whiteColor];
    btnStatus       = @"notselect";
    [self.calendarView layoutIfNeeded];
    [self myCalView];
}

- (IBAction)searchAction:(id)sender {
    
    if (![self.dateTextField.text isEqualToString:@""]) {
        // create search param object
        LPShopSearchParamEntity *param = [[LPShopSearchParamEntity alloc] init];
        param.largeServiceArea = @"SS10";
        param.isOpenWeek = [@((thisDay + weekday - 3) % 7 + 1) stringValue];
        
        // push vc with param
        LPSearchResultListViewController *searchResultListVC = [[LPSearchResultListViewController alloc] initWithNibName:@"LPSearchResultListViewController" bundle:nil];
        searchResultListVC.shopSearchParam = param;
        [self.navigationController pushViewController:searchResultListVC animated:YES];
    }
    
}

- (IBAction)nextAct:(id)sender {
    thisMonth++;
    [self removeTags];
    [self updateCalNow];
}

- (IBAction)prevAct:(id)sender {
    thisMonth--;
    [self removeTags];
    [self updateCalNow];
}

- (void) removeTags{
    int x = 1;
    while (x <= 31){
        [[self.view viewWithTag:x] removeFromSuperview];
        x++;
    }
}

- (void)updateCalNow{
    if(thisMonth > 12){
        thisMonth = 1;
        thisYear++;
    }
    if(thisMonth < 1){
        thisMonth = 12;
        thisYear--;
    }
    
    [self moreDateInfo];
}

- (void)moreDateInfo{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //get first day of month's weekday
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    [components setMonth:thisMonth];
    [components setYear:thisYear];
    NSDate * newDate = [calendar dateFromComponents:components];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:newDate];
    weekday=(int)[comps weekday];
    
    //Get number of days in the month
    numDays=[self getCurrDateInfo:newDate];
    int newWeekDay=weekday-2;//make weekday zero based
    newWeekDay = (newWeekDay < 0) ? newWeekDay + 7 : newWeekDay;
    
    //coordinates for displaying the buttons
    int yVal = 0;
    int yCount = 1;
    
    //Display name of month++++++++++++++++++++++++++++++++++++++++++++
    self.dateLabel.text=[NSString stringWithFormat:@"%d-%d",thisYear,thisMonth];
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    int leading = 30;
    int widthBtn = ([[UIScreen mainScreen] bounds].size.width - leading*2 + 7) / 7;
    int heightBtn = widthBtn * 3 / 4;
    
    //title
    NSArray *dayNames = @[@"ha",@"ba",@"tu",@"na",@"sa",@"ba",@"ta"];
    for(int i=0; i<7; i++) {
        int xCoord = i * (widthBtn - 1);
        int yCoord = (yCount * (heightBtn - 1)) + yVal - heightBtn + 1;
        
        CGRect frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        
        UIButton *btn = [self getNormalButton:frame withBackground:[UIColor colorWithHexString:@"#d9d9d9"]];
        [btn setTitle:dayNames[i] forState:UIControlStateNormal];
        
        if (i == 0) {
            [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
        } else if (i == 5){
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        } else if (i == 6) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        [self.calendarView addSubview:btn];
    }
    
    //before firstday
    for(int i = 0; i < newWeekDay; i++) {
        int xCoord = i * (widthBtn - 1);
        int yCoord = (yCount * (heightBtn - 1)) + yVal;
        
        CGRect frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        
        UIButton *btn = [self getNormalButton:frame withBackground:[UIColor whiteColor]];
        [self.calendarView addSubview:btn];
    }
    
    //use for loop to display each day
    for (int startD = 1; startD <= numDays; startD++){
        int xCoord = newWeekDay * (widthBtn - 1);
        int yCoord = (yCount * (heightBtn - 1)) + yVal;
        
        //drops buttons on y axis every 7 days
        if(++newWeekDay > 6){
            newWeekDay = 0;
            yCount++;
        }
        
        //Creates the buttons and gives them each a tag (id)
        CGRect frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        
        UIButton *btn = [self getNormalButton:frame withBackground:[UIColor whiteColor]];
        [btn setTitle:[NSString stringWithFormat:@"%d", startD] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(setSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:startD];
        
        if (thisYear == curYear && thisMonth == curMonth && startD == curDay) {
            btn.backgroundColor = currentDayColor;
        }
        
        [self.calendarView addSubview:btn];
    }
    
    // after last day
    long n = (weekday-2 < 0) ? 37 - numDays - weekday : 44 - numDays - weekday;
    for (int i = 0; i < n; i++) {
        int xCoord = newWeekDay * (widthBtn - 1);
        int yCoord = (yCount * (heightBtn - 1)) + yVal;
        
        //drops buttons on y axis every 7 days
        if(++newWeekDay > 6){
            newWeekDay = 0;
            yCount++;
        }
        
        CGRect frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        
        UIButton *btn = [self getNormalButton:frame withBackground:[UIColor whiteColor]];
        [self.calendarView addSubview:btn];
    }
    
    self.heightCalendarView.constant = heightBtn * 7 - 7;
}

- (UIButton *)getNormalButton:(CGRect)frame withBackground:(UIColor *)background{
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    
    [btn setFrame:frame];
    [btn setBackgroundColor:background];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn.layer setBorderWidth: 1.0];
    [btn.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    
    return btn;
}

- (void)setSelectedBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    thisDay = [btn.titleLabel.text intValue];
    int prevDay = [self.prevSelectBtn.titleLabel.text intValue];
    bool prevDayIsCurDay = (thisYear == curYear) && (thisMonth == curMonth) && (prevDay == curDay);
    bool prevDayIsSelectDay = (btn == self.prevSelectBtn);
    
    self.dateTextField.text = [NSString stringWithFormat:@"%d-%d-%d",thisYear,thisMonth,thisDay];
    [self.prevSelectBtn setBackgroundColor:prevDayIsCurDay ? currentDayColor : defaultColor];
    
    // in case select new date
    if (!prevDayIsSelectDay) {
        [btn setBackgroundColor:selectedDayColor];
        btnStatus = @"selected";
    }
    // in case select at date deselect before
    else if (prevDayIsSelectDay && [btnStatus isEqualToString:@"notselect"]) {
        [btn setBackgroundColor:selectedDayColor];
        btnStatus = @"selected";
    }
    // in case deselect
    else {
        btnStatus = @"notselect";
        self.dateTextField.text = @"";
    }
    
    self.prevSelectBtn = btn;
}

/*
 this method returns the number of days in the month in the date it is sent
 */

- (NSUInteger)getCurrDateInfo:(NSDate *)myDate{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return numberOfDaysInMonth;
}

/*
 This is the method called to create the calendar
 */

- (void)myCalView{
    NSDate *now = [NSDate date];
    // Specify which units we would like to use
    unsigned units = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:units fromDate:now];
    
    curYear = (int) [components year];
    curMonth = (int) [components month];
    curDay = (int) [components day];
    
    thisYear = curYear;
    thisMonth = curMonth;
    
    [self moreDateInfo];
}

@end
