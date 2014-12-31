//
//  DepartmentTableViewCell.m
//  CompanyPilot
//
//  Created by Suman Chatterjee on 30/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DepartmentTableViewCell.h"

@interface DepartmentTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *department;
@property (nonatomic, weak) IBOutlet UILabel *type;

@end


@implementation DepartmentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)configureCellWithDeparment:(NSString *)department type:(NSString*)type{
    self.department.text = department;
    self.type.text = type;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.department.text = @"";
    self.type.text = @"";
}
@end
