//
//  DetailDeviceVC.h
//  MyStore
//
//  Created by Ngoctam_Framgia on 7/28/14.
//  Copyright (c) 2014 Framgia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailDeviceVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *version;
@property (strong, nonatomic) IBOutlet UITextField *company;

@property (strong) NSManagedObject *device;


- (IBAction)saveBtnTap:(id)sender;
- (IBAction)cancelBtnTap:(id)sender;

@end
