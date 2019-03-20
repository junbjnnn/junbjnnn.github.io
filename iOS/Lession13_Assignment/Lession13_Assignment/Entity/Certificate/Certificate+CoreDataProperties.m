//
//  Certificate+CoreDataProperties.m
//  Lession13_Assignment
//
//  Created by ~JunBjn~ on 3/19/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//
//

#import "Certificate+CoreDataProperties.h"

@implementation Certificate (CoreDataProperties)

+ (NSFetchRequest<Certificate *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Certificate"];
}

@dynamic name;
@dynamic employee;

@end
