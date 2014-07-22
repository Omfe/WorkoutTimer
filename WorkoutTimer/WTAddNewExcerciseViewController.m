//
//  WTAddNewExcerciseViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTAddNewExcerciseViewController.h"
#import "WTExercise.h"
#import "WTModelController.h"

@interface WTAddNewExcerciseViewController ()

@property (weak, nonatomic) IBOutlet UITextField *excerciseNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *numberOfSetsTextField;

@end

@implementation WTAddNewExcerciseViewController

- (void)viewDidLoad
{
    UITapGestureRecognizer *tapGestureRecognizer;
    [super viewDidLoad];
    [self setTitle:@"New Excercise"];
    
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_hidePickerView:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)_hidePickerView:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self.nameTextField resignFirstResponder];
    [self.numberOfSetsTextField resignFirstResponder];
}

- (void)confirmCreation
{
    if (self.nameTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Insert a Name" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    } else{
        WTExercise *excercise;
        excercise = [[WTExercise alloc] init];
        
        excercise.excerciseName = self.nameTextField.text;
        excercise.numberOfSets = [self.numberOfSetsTextField.text integerValue];
        excercise.restPeriod = 60;
        [[WTModelController sharedInstance] storeExcercise:excercise inWorkout:self.workout];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
