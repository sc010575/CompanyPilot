//
//  DepartmentDetailsViewController.m
//  CompanyPilot
//
//  Created by Suman Chatterjee on 31/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DepartmentDetailsViewController.h"
#import "AddEmployeeViewController.h"

@interface DepartmentDetailsViewController ()

@end

@implementation DepartmentDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.dept.departmentName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([segue.identifier isEqualToString:@"addEmployee"]){
        AddEmployeeViewController *destination = [segue destinationViewController];
        destination.deptName = self.dept.departmentName;
    }
}



@end
