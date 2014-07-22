//
//  WTAddNewProgramViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTAddNewProgramViewController.h"
#import "WTProgram.h"
#import "WTWorkout.h"
#import "WTModelController.h"

@interface WTAddNewProgramViewController ()

@end

@implementation WTAddNewProgramViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"New Program"];
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
        WTProgram *program;
        program = [[WTProgram alloc] init];
        
        program.programName = self.nameTextField.text;
        [[WTModelController sharedInstance] storeProgram:program];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
