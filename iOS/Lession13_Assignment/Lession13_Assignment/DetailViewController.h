//
//  DetailViewController.h
//  Lession13_Assignment
//
//  Created by ~JunBjn~ on 3/17/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *id;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *fsu;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (strong) NSManagedObject *contactdb;
@end
