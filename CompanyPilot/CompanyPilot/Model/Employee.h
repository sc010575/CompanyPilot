//
//  Employee.h
//  CompanyPilot
//
//  Created by Suman Chatterjee on 30/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Department;

@interface Employee : NSManagedObject

@property (nonatomic, retain) NSNumber * employeeId;
@property (nonatomic, retain) NSString * employFirstName;
@property (nonatomic, retain) NSString * employeeLastName;
@property (nonatomic, retain) NSDate * joiningDate;
@property (nonatomic, retain) Department *department;

@end
