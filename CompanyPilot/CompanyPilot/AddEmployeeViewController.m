//
//  AddEmployeeViewController.m
//  CompanyPilot
//
//  Created by Suman Chatterjee on 31/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "NSManagedObjectContext+Helper.h"
#import "NSManagedObject+CoreDataHandler.h"
#import "AppDelegate.h"
#import "Employee.h"
#import "Department.h"


@interface AddEmployeeViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) NSManagedObjectContext * managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)onSave:(id)sender;

@end

@implementation AddEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Use the main persistentStoreCoordinator
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [NSManagedObjectContext managedObjectContextWithStoreCoordinator:appDelegate.persistentStoreCoordinator];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onSave:(id)sender {
 
    [self saveEmployee];
    
}

- (void)saveEmployee
{
    
    [self.managedObjectContext updateOnBackgroundThread:^(NSManagedObjectContext *updateContext) {

    //OK new event add it to the database
    Employee *employee = [Employee createInContext:updateContext];
    NSUInteger empId = [Employee countInContext:updateContext];
    employee.employeeId = [NSNumber numberWithInteger:empId + 1];
    employee.joiningDate = [NSDate date];
    employee.employFirstName = self.firstNameTF.text;
    employee.employeeLastName = self.lastNameTF.text;
        
    NSPredicate *purchasePredicate = [NSPredicate predicateWithFormat:@"departmentName == %@", self.deptName];
    Department * dept = [[Department findAllWithPredicate:purchasePredicate inContext:updateContext]  firstObject];

    employee.department = dept;
     } completion:^{
         //complete
         NSLog(@"Employee added");
     }];

}

#pragma mark - UITextfield delegate

- (BOOL) textFieldShouldReturn: (UITextField *)textField
{
    if (textField == self.lastNameTF) {
        [textField resignFirstResponder];
    }
    return YES;
}



@end
