//
//  DetailDeviceVC.m
//  MyStore
//
//  Created by Ngoctam_Framgia on 7/28/14.
//  Copyright (c) 2014 Framgia. All rights reserved.
//

#import "DetailDeviceVC.h"

@interface DetailDeviceVC ()

@end

@implementation DetailDeviceVC
@synthesize device;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.device) {
        [self.name setText:[self.device valueForKey:@"name"]];
        [self.version setText:[self.device valueForKey:@"version"]];
        [self.company setText:[self.device valueForKey:@"company"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)cancelBtnTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveBtnTap:(id)sender {

    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.device) {
        // Update existing device
        [self.device setValue:self.name.text forKey:@"name"];
        [self.device setValue:self.version.text forKey:@"version"];
        [self.device setValue:self.company.text forKey:@"company"];
        
    }else{
        // Create a new managed object
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.name.text forKey:@"name"];
        [newDevice setValue:self.version.text forKey:@"version"];
        [newDevice setValue:self.company.text forKey: @"company"];
        
    } 
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
