//
//  ViewController.h
//  MyStore
//
//  Created by Ngoctam_Framgia on 7/28/14.
//  Copyright (c) 2014 Framgia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *titleLb;
@property (strong, nonatomic) IBOutlet UILabel *company;

@property (strong) NSMutableArray *devices;

@end

