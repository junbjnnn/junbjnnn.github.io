//
//  Employee+CoreDataProperties.h
//  Lession13_Assignment
//
//  Created by ~JunBjn~ on 3/19/19.
//  Copyright © 2019 ~JunBjn~. All rights reserved.
//
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *fsu;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Certificate *> *certificate;

@end

@interface Employee (CoreDataGeneratedAccessors)

- (void)addCertificateObject:(Certificate *)value;
- (void)removeCertificateObject:(Certificate *)value;
- (void)addCertificate:(NSSet<Certificate *> *)values;
- (void)removeCertificate:(NSSet<Certificate *> *)values;

@end

NS_ASSUME_NONNULL_END
