//
//  WTAddNewViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTAddNewViewController.h"
#import "WTProgram.h"
#import "WTModelController.h"
#import "WTWorkoutsViewController.h"
#import "WTWorkout.h"

@interface WTAddNewViewController ()


@end

@implementation WTAddNewViewController

// This class should not be instantiated.

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *cancelNewProgramBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissViewController:)];
    self.navigationItem.leftBarButtonItem = cancelNewProgramBarButtonItem;
    
    UIBarButtonItem *confirmNew = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(confirmNewWasPressed:)];
    self.navigationItem.rightBarButtonItem = confirmNew;
}

- (void)confirmNewWasPressed:(UIBarButtonItem *)sender
{
    [self confirmCreation];
}

- (void)confirmCreation
{
    
}

- (void)dismissViewController:(UIBarButtonItem *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
