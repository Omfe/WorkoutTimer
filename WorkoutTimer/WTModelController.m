//
//  WTModelController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/19/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTModelController.h"
#import "WTProgram.h"
#import "WTWorkout.h"

@implementation WTModelController

@synthesize programs;

+ (WTModelController *)sharedInstance
{
    static WTModelController *sharedWTModelController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedWTModelController = [[self alloc] init];
    });
    return sharedWTModelController;
}

- (id)init
{
    if (self = [super init]) {
        programs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


- (void)storeProgram:(WTProgram *)program
{
    [self.programs addObject:program];
}

- (void)storeWorkout:(WTWorkout *)workout inProgram:(WTProgram *)program
{
    [program.workouts addObject:workout];
}

- (void)storeExcercise:(WTExercise *)excercise inWorkout:(WTWorkout *)workout
{
    [workout.excercises addObject:excercise];
}

@end
