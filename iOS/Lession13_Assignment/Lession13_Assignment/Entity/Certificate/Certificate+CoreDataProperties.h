//
//  Certificate+CoreDataProperties.h
//  Lession13_Assignment
//
//  Created by ~JunBjn~ on 3/19/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//
//

#import "Certificate+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Certificate (CoreDataProperties)

+ (NSFetchRequest<Certificate *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) Employee *employee;

@end

NS_ASSUME_NONNULL_END
