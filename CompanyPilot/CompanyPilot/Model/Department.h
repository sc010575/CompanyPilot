//
//  Department.h
//  CompanyPilot
//
//  Created by Suman Chatterjee on 27/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Department : NSManagedObject

@property (nonatomic, retain) NSString * departmentId;
@property (nonatomic, retain) NSString * departmentName;
@property (nonatomic, retain) NSString * departmentType;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSSet *employee;
@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeeObject:(NSManagedObject *)value;
- (void)removeEmployeeObject:(NSManagedObject *)value;
- (void)addEmployee:(NSSet *)values;
- (void)removeEmployee:(NSSet *)values;

@end
