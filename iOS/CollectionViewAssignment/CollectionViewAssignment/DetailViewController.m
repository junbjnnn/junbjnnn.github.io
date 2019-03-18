//
//  DetailViewController.m
//  Lession06_Assignment
//
//  Created by RTC-R726 on 3/13/19.
//  Copyright © 2019 Zxy. All rights reserved.
//

#import "DetailViewController.h"
#import "Book.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookArtirst;
@property (weak, nonatomic) IBOutlet UILabel *bookPrice;
@property (weak, nonatomic) IBOutlet UILabel *bookPublisher;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    [self.bookImage setImage:[UIImage imageNamed:self.book.image]];
    self.bookName.text = self.book.name;
    self.bookArtirst.text = self.book.artirst;
    self.bookPrice.text = self.book.price;
    self.bookPublisher.text = self.book.publisher;
}

- (IBAction)backToTableView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
