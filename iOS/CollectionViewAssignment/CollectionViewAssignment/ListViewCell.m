//
//  ListViewCell.m
//  CollectionViewAssignment
//
//  Created by ~JunBjn~ on 3/18/19.
//  Copyright © 2019 Zxy. All rights reserved.
//

#import "ListViewCell.h"
#import "Book.h"

@interface ListViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookArtirst;
@property (weak, nonatomic) IBOutlet UILabel *bookPrice;
@property (weak, nonatomic) IBOutlet UILabel *bookPublisher;

@end

@implementation ListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupCellWithBook:(Book *) book {
    // setup layout via book object
    self.bookImage.image = [UIImage imageNamed:book.image];
    self.bookName.text = book.name;
    self.bookArtirst.text = book.artirst;
    self.bookPrice.text = book.price;
    self.bookPublisher.text = book.publisher;
}

@end
