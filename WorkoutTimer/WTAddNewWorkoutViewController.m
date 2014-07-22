//
//  WTAddNewWorkoutViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTAddNewWorkoutViewController.h"
#import "WTProgram.h"
#import "WTWorkout.h"
#import "WTModelController.h"
#import "WTWorkoutsViewController.h"

@interface WTAddNewWorkoutViewController ()

@end

@implementation WTAddNewWorkoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"New Workout"];
}

- (void)confirmCreation
{
    if (self.nameTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Insert a Name"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        WTWorkout *workout;
        workout = [[WTWorkout alloc] init];
        
        workout.workoutName = self.nameTextField.text;
        [[WTModelController sharedInstance] storeWorkout:workout inProgram:self.program];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
