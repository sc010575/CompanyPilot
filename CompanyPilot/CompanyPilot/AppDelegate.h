//
//  AppDelegate.h
//  CompanyPilot
//
//  Created by Suman Chatterjee on 26/12/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end

