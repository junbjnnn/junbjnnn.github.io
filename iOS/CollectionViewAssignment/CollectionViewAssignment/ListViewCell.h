//
//  ListViewCell.h
//  CollectionViewAssignment
//
//  Created by ~JunBjn~ on 3/18/19.
//  Copyright © 2019 Zxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Book;

@interface ListViewCell : UICollectionViewCell

- (void)setupCellWithBook:(Book*) book;

@end
