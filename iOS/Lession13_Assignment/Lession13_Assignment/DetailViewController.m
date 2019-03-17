//
//  DetailViewController.m
//  Lession13_Assignment
//
//  Created by ~JunBjn~ on 3/17/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.contactdb) {
        [self.id setText:[self.contactdb valueForKey:@"id"]];
        [self.name setText:[self.contactdb valueForKey:@"name"]];
        [self.fsu setText:[self.contactdb valueForKey:@"fsu"]];
    }
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.contactdb) {
        // Update existing device
        [self.contactdb setValue:self.id.text forKey:@"id"];
        [self.contactdb setValue:self.name.text forKey:@"name"];
        [self.contactdb setValue:self.fsu.text forKey:@"fsu"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        [newDevice setValue:self.id.text forKey:@"id"];
        [newDevice setValue:self.name.text forKey:@"name"];
        [newDevice setValue:self.fsu.text forKey:@"fsu"];
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
