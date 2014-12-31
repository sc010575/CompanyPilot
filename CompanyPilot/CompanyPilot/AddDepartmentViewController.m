//
//  ViewController.m
//  CompanyPilot
//
//  Created by Suman Chatterjee on 26/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "AddDepartmentViewController.h"
#import "NSManagedObject+CoreDataHandler.h"
#import "NSManagedObjectContext+Helper.h"
#import "Department.h"
#import "AppDelegate.h"

@interface AddDepartmentViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *departmentNameTF;
@property (weak, nonatomic) IBOutlet UITextField *departmentDescriptionTF;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
- (IBAction)onCancel:(id)sender;
@property (nonatomic, strong) NSPersistentStoreCoordinator *sharedPSC;

- (IBAction)onSaveDepartment:(id)sender;

@end

@implementation AddDepartmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Use the main persistentStoreCoordinator
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [NSManagedObjectContext managedObjectContextWithStoreCoordinator:appDelegate.persistentStoreCoordinator];
    
}
                                              

#pragma mark - Overridden Methods

// Forces the Keyboard to dismiss in modal views.
//
- (BOOL)disablesAutomaticKeyboardDismissal
{
    return NO;
}

#pragma mark - UITextfield delegate

- (BOOL) textFieldShouldReturn: (UITextField *)textField
{
    if (textField == self.departmentDescriptionTF) {
        [textField resignFirstResponder];
    }
    return YES;
}


- (IBAction)onSaveDepartment:(id)sender {
    
    [self saveDepartment:self.managedObjectContext];
    
}

- (BOOL)isThisDepartmentNew:(NSString*) name inContext:(NSManagedObjectContext*) context
{
    NSPredicate *purchasePredicate = [NSPredicate predicateWithFormat:@"departmentName == %@", name];
    Department * dept = [[Department findAllWithPredicate:purchasePredicate inContext:context]  firstObject];
    return  (!dept) ? YES:NO;
}

- (void)saveDepartment:(NSManagedObjectContext*) context
{
    [self.managedObjectContext updateOnBackgroundThread:^(NSManagedObjectContext *updateContext) {
    if([self isThisDepartmentNew:self.departmentNameTF.text inContext:context]){
        //This is a new dept
        Department *department = [Department createInContext:updateContext];
        NSUInteger deptCount = [Department countInContext:updateContext];
        department.departmentId = [NSNumber numberWithInteger:deptCount + 1];
        department.departmentName = self.departmentNameTF.text;
        department.creationDate = [NSDate date];
        department.departmentType = @"Test";
    }
    } completion:^{
        //complete
        NSLog(@"Department added");
        // Dismiss View Controller
        [self dismissViewControllerAnimated:YES completion:nil];

    }];

}
- (IBAction)onCancel:(id)sender {
    
    // Dismiss View Controller
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
