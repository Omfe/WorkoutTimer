//
//  WTProgramsViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTProgramsViewController.h"
#import "WTAddNewProgramViewController.h"
#import "WTModelController.h"
#import "WTProgram.h"
#import "WTWorkoutsViewController.h"

@interface WTProgramsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *programsTableView;

@end

@implementation WTProgramsViewController

- (void)viewDidLoad
{
    UIBarButtonItem *addNewProgramBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(presentAddNewProgramViewController:)];
    
    [super viewDidLoad];
    [self setTitle:@"Programs"];
    self.navigationItem.rightBarButtonItem = addNewProgramBarButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.programsTableView reloadData];
}


- (void)presentAddNewProgramViewController:(UIBarButtonItem *)sender
{
    WTAddNewProgramViewController *addNewProgramViewController;
    UINavigationController *navigationController;
    
    addNewProgramViewController = [[WTAddNewProgramViewController alloc] initWithNibName:@"WTAddNewViewController" bundle:nil];
    navigationController = [[UINavigationController alloc] initWithRootViewController:addNewProgramViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[WTModelController sharedInstance].programs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTProgram *program;
    UITableViewCell *cell;
    static NSString *identifier = @"ProgramsTableViewCellIdentifier";
    
    cell = [self.programsTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    program = [[WTModelController sharedInstance].programs objectAtIndex:indexPath.row];
    cell.textLabel.text = program.programName;
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTWorkoutsViewController *workoutsViewController;
    
    workoutsViewController = [[WTWorkoutsViewController alloc] initWithNibName:@"WTWorkoutsViewController" bundle:nil];
    workoutsViewController.selectedProgram = [[WTModelController sharedInstance].programs objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:workoutsViewController animated:YES];
}

@end
