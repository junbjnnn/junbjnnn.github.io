//
//  DetailViewController.h
//  Lession06_Assignment
//
//  Created by RTC-R726 on 3/13/19.
//  Copyright © 2019 Zxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Book;

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) Book *book;

@end

NS_ASSUME_NONNULL_END
