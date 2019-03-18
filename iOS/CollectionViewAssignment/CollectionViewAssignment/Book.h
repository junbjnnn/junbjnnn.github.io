//
//  Book.h
//  Lession06_Assignment
//
//  Created by RTC-R726 on 3/12/19.
//  Copyright © 2019 Zxy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *artirst;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *publisher;
@end

NS_ASSUME_NONNULL_END
