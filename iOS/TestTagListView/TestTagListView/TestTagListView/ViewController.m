//
//  ViewController.m
//  TestTagListView
//
//  Created by ~JunBjn~ on 3/24/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//

#import "ViewController.h"
#import "XTableViewCell.h"

@interface ViewController () {
    NSDictionary *setupTagsInfo;
    NSInteger limit;
    NSInteger totalEnteries;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *list;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list = [[NSMutableArray alloc] init];
    NSMutableArray *list2 = [NSMutableArray arrayWithObjects:@"Str132i1",@"ng3",@"adfad34f4",nil];
    // Do any additional setup after loading the view, typically from a nib.
    limit = 10;
    totalEnteries = 50;
    int index = 0;
    while (index < limit) {
        [_list addObject:list2];
        index = index + 1;
    }
    
//    NSArray *list1 = [NSMutableArray arrayWithObjects:@"Str132i1",@"Str1231i123ng2",@"ng3",@"adfad34f4",nil];
//    NSArray *list2 = [NSMutableArray arrayWithObjects:@"Str132i1",@"ng3",@"adfad34f4",nil];
//    NSArray *list3 = [NSMutableArray arrayWithObjects:@"Str132i1",@"Str1231i123ng2",@"ng3",@"adfad34f4",@"ng3",@"adfad34f4",nil];
//    NSArray *list4 = [NSMutableArray arrayWithObjects:@"Str132i1",@"Str1231i123ng2",@"ng3",@"adfad34f4",@"Str132i1",@"Str1231i123ng2",@"ng3",@"adfad34f4",nil];
//    _list = [NSMutableArray arrayWithObjects:list1, list2,list3,list4,nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XTableViewCell" bundle:nil] forCellReuseIdentifier:@"XTableViewCell"];
    
    
    setupTagsInfo = @{@"btnSpace" : [NSNumber numberWithFloat:5.0],
                      @"topSpace" : [NSNumber numberWithFloat:0.0],
                      @"leftSpace" : [NSNumber numberWithFloat:0.0],
                      @"heightBtn" : [NSNumber numberWithFloat:40.0],
                      @"spaceInsideBtn" : [NSNumber numberWithFloat:20.0],
                      @"leadingSubView" : [NSNumber numberWithFloat:10.0]
                      };
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XTableViewCell" forIndexPath:indexPath];
    [cell setupViewCell:self.list[indexPath.row] setupTagsInfo:setupTagsInfo];
    cell.labb.text = [@(indexPath.row) stringValue];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIFont *font = button.titleLabel.font;
    
    CGFloat heightShopInfo = 50.0;
    CGFloat btnSpace = [[setupTagsInfo valueForKey:@"btnSpace"] floatValue];
    CGFloat topSpace = [[setupTagsInfo valueForKey:@"topSpace"] floatValue];
    CGFloat leftSpace = [[setupTagsInfo valueForKey:@"leftSpace"] floatValue];
    CGFloat heightBtn = [[setupTagsInfo valueForKey:@"heightBtn"] floatValue];
    CGFloat spaceInsideBtn = [[setupTagsInfo valueForKey:@"spaceInsideBtn"] floatValue];
    CGFloat leadingSubView = [[setupTagsInfo valueForKey:@"leadingSubView"] floatValue];
    CGFloat widthSubView = self.view.frame.size.width - leadingSubView;
    
    for (NSString *tag in self.list[indexPath.row]) {
        CGSize stringSize = [tag sizeWithAttributes:@{NSFontAttributeName: font}];
        
        CGFloat widthBtn = stringSize.width + spaceInsideBtn;
        if ((leftSpace + btnSpace + widthBtn) > widthSubView) {
            leftSpace = 0.0;
            topSpace += heightBtn + btnSpace;
        }
        
        leftSpace += btnSpace + widthBtn;
    }
    
    return topSpace + heightBtn + heightShopInfo;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.list.count - 1) {
        if (self.list.count < totalEnteries) {
            NSLog(@"loadmore");
            // we need to bring more records as there are some pending records available
            NSInteger index = self.list.count;
            NSArray *list2 = [NSMutableArray arrayWithObjects:@"Str132i1",@"ng3",@"adfad34f4",nil];
            limit = index + 20;
            while (index < limit) {
                [_list addObject:list2];
                index = index + 1;
            }
            [tableView reloadData];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
