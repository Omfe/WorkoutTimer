//
//  WTWorkoutsViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/20/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTWorkoutsViewController.h"
#import "WTAddNewWorkoutViewController.h"
#import "WTModelController.h"
#import "WTWorkout.h"
#import "WTExcercisesViewController.h"

@interface WTWorkoutsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *workoutsTableView;

@end

@implementation WTWorkoutsViewController

- (void)viewDidLoad
{
    UIBarButtonItem *addNewWorkoutBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(presentAddNewWorkoutViewController:)];
    NSString *programName = self.selectedProgram.programName;
    
    [super viewDidLoad];
    [self setTitle:programName];
    self.navigationItem.rightBarButtonItem = addNewWorkoutBarButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.workoutsTableView reloadData];
}

- (void)presentAddNewWorkoutViewController:(UIBarButtonItem *)sender
{
    WTAddNewWorkoutViewController *addNewWorkoutViewController;
    UINavigationController *navigationController;
    
    addNewWorkoutViewController = [[WTAddNewWorkoutViewController alloc] initWithNibName:@"WTAddNewViewController" bundle:nil];
    navigationController = [[UINavigationController alloc] initWithRootViewController:addNewWorkoutViewController];
    addNewWorkoutViewController.program = self.selectedProgram;
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.selectedProgram.workouts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTWorkout *workout;
    UITableViewCell *cell;
    static NSString *identifier = @"WorkoutsTableViewCellIdentifier";
    
    cell = [self.workoutsTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    workout = [self.selectedProgram.workouts objectAtIndex:indexPath.row];
    cell.textLabel.text = workout.workoutName;
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTExcercisesViewController *excercisesViewController;
    
    excercisesViewController = [[WTExcercisesViewController alloc] initWithNibName:@"WTExcercisesViewController" bundle:nil];
    excercisesViewController.selectedWorkout = [self.selectedProgram.workouts objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:excercisesViewController animated:YES];
}

@end
