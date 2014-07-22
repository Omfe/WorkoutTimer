//
//  WTAppDelegate.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTAppDelegate.h"
#import "WTProgramsViewController.h"

@implementation WTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UINavigationController *navigationController;
    WTProgramsViewController *programsViewController;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    programsViewController = [[WTProgramsViewController alloc] initWithNibName:@"WTProgramsViewController" bundle:nil];
    navigationController = [[UINavigationController alloc] initWithRootViewController:programsViewController];
    
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
