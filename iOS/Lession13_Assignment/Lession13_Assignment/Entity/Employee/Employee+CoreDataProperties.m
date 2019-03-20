//
//  Employee+CoreDataProperties.m
//  Lession13_Assignment
//
//  Created by ~JunBjn~ on 3/19/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic fsu;
@dynamic id;
@dynamic name;
@dynamic certificate;

@end
