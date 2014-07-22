//
//  WTExcercisesViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/21/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTExcercisesViewController.h"
#import "WTAddNewExcerciseViewController.h"
#import "WTExercise.h"
#import "WTModelController.h"
#import "WTExcerciseTimerViewController.h"

@interface WTExcercisesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *excercisesTableView;

@end

@implementation WTExcercisesViewController

- (void)viewDidLoad
{
    UIBarButtonItem *addNewExcerciseBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(presentAddNewExcerciseViewController:)];
    NSString *workoutName = self.selectedWorkout.workoutName;
    
    [super viewDidLoad];
    [self setTitle:workoutName];
    self.navigationItem.rightBarButtonItem = addNewExcerciseBarButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.excercisesTableView reloadData];
}

- (void)presentAddNewExcerciseViewController:(UIBarButtonItem *)sender
{
    WTAddNewExcerciseViewController *addNewExcerciseViewController;
    UINavigationController *navigationController;
    
    addNewExcerciseViewController = [[WTAddNewExcerciseViewController alloc] initWithNibName:@"WTAddNewExcerciseViewController" bundle:nil];
    navigationController = [[UINavigationController alloc] initWithRootViewController:addNewExcerciseViewController];
    addNewExcerciseViewController.workout = self.selectedWorkout;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.selectedWorkout.excercises count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTExercise *excercise;
    UITableViewCell *cell;
    static NSString *identifier = @"ExcercisesTableViewCellIdentifier";
    
    cell = [self.excercisesTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    excercise = [self.selectedWorkout.excercises objectAtIndex:indexPath.row];
    cell.textLabel.text = excercise.excerciseName;
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTExcerciseTimerViewController *excerciseTimerViewController;
    
    excerciseTimerViewController = [[WTExcerciseTimerViewController alloc] initWithNibName:@"WTExcerciseTimerViewController" bundle:nil];
    excerciseTimerViewController.selectedExcercise = [self.selectedWorkout.excercises objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:excerciseTimerViewController animated:YES];
}

@end
