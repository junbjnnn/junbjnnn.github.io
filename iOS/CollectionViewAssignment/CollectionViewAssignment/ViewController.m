//
//  ViewController.m
//  CollectionViewAssignment
//
//  Created by RTC-R726 on 3/14/19.
//  Copyright © 2019 Zxy. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ListViewCell.h"
#import "DetailViewController.h"
#import "Book.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *changeViewLayout;
@property (strong, nonatomic) NSMutableArray<Book*> *books;
@property (strong, nonatomic) NSString *typeView;
@end

@implementation ViewController {
    UIEdgeInsets sectionInsets;
    NSInteger itemsPerRow;
    NSInteger numberOfItems;
}

// Swap view
- (IBAction)changeViewAction:(id)sender {
    self.changeViewLayout.hidden = !self.changeViewLayout.hidden;
}

- (IBAction)changeView:(id)sender {
    self.typeView = [self.typeView  isEqual: @"ListViewCell"] ? @"CollectionViewCell" : @"ListViewCell";
    itemsPerRow = [self.typeView  isEqual: @"ListViewCell"] ? 1 : 3;
    [self changeViewAction:sender];
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sectionInsets = UIEdgeInsetsMake(20.0,20.0,20.0,20.0);
    numberOfItems = 14;
    itemsPerRow = 3;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ListViewCell" bundle:nil] forCellWithReuseIdentifier:@"listViewCell"];
    
    self.books = [[NSMutableArray alloc] init];
    for (int i = 0; i < numberOfItems; i++) {
        Book *book = [[Book alloc] init];
        book.image = (i % 3 == 0) ? @"gameofthrones" : (i % 3 == 1) ? @"deadline" : @"harrypotter";
        book.name = [NSMutableString stringWithFormat:@"Ten sach %d", i];
        book.artirst = [NSMutableString stringWithFormat:@"Tac gia %d", i];
        book.price = @"69$";
        book.publisher = [NSMutableString stringWithFormat:@"Nha xuat ban %d", i];
        
        [self.books addObject:book];
    }
    
    [self.collectionView reloadData];
}

#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.books.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.typeView isEqualToString:@"ListViewCell"]) {
        ListViewCell *listViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"listViewCell" forIndexPath:indexPath];
        [listViewCell setupCellWithBook:self.books[indexPath.row]];
        return listViewCell;
    } else {
        CollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
        
        [collectionViewCell.image setImage:[UIImage imageNamed:self.books[indexPath.row].image]];
        return collectionViewCell;
    }
    
}

#pragma UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailViewController.book = [self.books objectAtIndex:indexPath.row];
    
    [self presentViewController:detailViewController animated:YES completion:nil];
}

#pragma UICollectionViewLayoutDelegare
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger paddingSpace = sectionInsets.left * (itemsPerRow + 1);
    NSInteger availableWidth = self.view.frame.size.width - paddingSpace;
    NSInteger widthPerItem = availableWidth / itemsPerRow;
    NSInteger heightPerItem = [self.typeView  isEqual: @"ListViewCell"] ? 160 : widthPerItem * 3 / 2;
    return CGSizeMake(widthPerItem, heightPerItem);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return sectionInsets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return sectionInsets.left;
}

@end
