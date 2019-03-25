//
//  LPCalendarViewController.m
//  LessonPepper
//
//  Created by ~JunBjn~ on 3/25/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPCalendarViewController.h"

@interface LPCalendarViewController () {
    NSUInteger numDays;//1-31
    int thisYear;//2019
    int weekday;//1-7
    int thisMonth;//1-12
    int curDay;
    int curMonth;
    int curYear;
}

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIButton *prevSelectBtn;
@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCalendarView;

@end

@implementation LPCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.calendarView layoutIfNeeded];
    [self myCalView];
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

-(void) removeTags{
    int x=1;
    while (x<=31){
        [[self.view viewWithTag:x] removeFromSuperview];
        x++;
    }
}

-(void)updateCalNow{
    if(thisMonth>12){
        thisMonth=1;
        thisYear++;
    }
    if(thisMonth<1){
        thisMonth=12;
        thisYear--;
    }

    [self moreDateInfo];
}

-(void)moreDateInfo{
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
    int newWeekDay=weekday-1;//make weekday zero based
    
    //coordinates for displaying the buttons
    int yVal=0;
    int yCount=1;
    
    //Display name of month++++++++++++++++++++++++++++++++++++++++++++
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    self.dateLabel.text=[[formatter monthSymbols] objectAtIndex:(thisMonth - 1)];
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    //int leading = ([[UIScreen mainScreen] bounds].size.width - 280) / 2;
    int leading = 30;
    int widthBtn = ([[UIScreen mainScreen] bounds].size.width - leading*2 + 7) / 7;
    int heightBtn = widthBtn * 3 / 4;
    
    //title
    NSArray *dayNames = @[@"ha",@"ba",@"tu",@"na",@"sa",@"ba",@"ta"];
    for(int i=0; i<7; i++) {
        UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        int xCoord=i*(widthBtn-1);
        int yCoord=(yCount*(heightBtn-1))+yVal-heightBtn+1;
        addProject.frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        [addProject.layer setBorderWidth: 1.0];
        [addProject.layer setBorderColor:[[UIColor grayColor] CGColor]];
        [addProject setTitle:dayNames[i] forState:UIControlStateNormal];
        
        addProject.backgroundColor = [UIColor lightGrayColor];
        [addProject.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        [addProject setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (i == 0) {
            [addProject.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
        } else if (i == 5){
            [addProject setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        } else if (i == 6) {
            [addProject setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        [self.calendarView addSubview:addProject];
    }
    
    //before firstday
    for(int i=0; i<newWeekDay; i++) {
        UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        int xCoord=i*(widthBtn-1);
        int yCoord=(yCount*(heightBtn-1))+yVal;
        addProject.frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        addProject.backgroundColor = [UIColor whiteColor];
        [addProject.layer setBorderWidth: 1.0];
        [addProject.layer setBorderColor:[[UIColor grayColor] CGColor]];
        
        [self.calendarView addSubview:addProject];
    }
    
    //use for loop to display each day
    for(int startD=1; startD<=numDays;startD++){
        UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        int xCoord=newWeekDay*(widthBtn-1);
        int yCoord=(yCount*(heightBtn-1))+yVal;
        
        newWeekDay++;
        if(newWeekDay>6){//drops buttons on y axis every 7 days
            newWeekDay=0;
            yCount++;
        }
        //Creates the buttons and gives them each a tag (id)
        addProject.frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        [addProject setTitle:[NSString stringWithFormat:@"%d", startD] forState:UIControlStateNormal];
        [addProject addTarget:self action:@selector(setSelectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [addProject setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [addProject.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        addProject.tag = startD;
        [addProject.layer setBorderWidth: 1.0];
        [addProject.layer setBorderColor:[[UIColor grayColor] CGColor]];
        
        if (thisYear == curYear && thisMonth == curMonth && startD == curDay) {
            addProject.backgroundColor = [UIColor blueColor];
        } else {
            addProject.backgroundColor = [UIColor whiteColor];
        }
        
        [self.calendarView addSubview:addProject];
    }
    
    // after last day
    for(int i=0; i<=42-numDays-weekday; i++) {
        UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        int xCoord=newWeekDay*(widthBtn-1);
        int yCoord=(yCount*(heightBtn-1))+yVal;
        newWeekDay++;
        if(newWeekDay>6){//drops buttons on y axis every 7 days
            newWeekDay=0;
            yCount++;
        }
        addProject.backgroundColor = [UIColor whiteColor];
        addProject.frame = CGRectMake(xCoord, yCoord, widthBtn, heightBtn);
        [addProject.layer setBorderWidth: 1.0];
        [addProject.layer setBorderColor:[[UIColor grayColor] CGColor]];
        [self.calendarView addSubview:addProject];
    }
    
    self.heightCalendarView.constant = heightBtn * 7 - 7;
}

-(void)setSelectedBtn:(id)sender {
    UIButton* btn = (UIButton *) sender;
    [btn setBackgroundColor:[UIColor redColor]];
    int thisDay = [self.prevSelectBtn.titleLabel.text intValue];
    if (thisYear == curYear && thisMonth == curMonth && thisDay == curDay) {
        [self.prevSelectBtn setBackgroundColor:[UIColor blueColor]];
    } else {
        [self.prevSelectBtn setBackgroundColor:[UIColor whiteColor]];
    }
    self.prevSelectBtn = btn;
    self.dateTextField.text = [NSString stringWithFormat:@"%d-%d-%d",thisYear,thisMonth,thisDay];
}

/*
 this method returns the number of days in the month in the date it is sent
 */

-(NSUInteger)getCurrDateInfo:(NSDate *)myDate{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return numberOfDaysInMonth;
}

/*
 This is the method called to create the calendar
 */

-(void)myCalView{
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
