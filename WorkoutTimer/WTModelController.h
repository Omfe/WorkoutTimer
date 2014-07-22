//
//  WTModelController.h
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/19/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WTProgram;
@class WTWorkout;
@class WTExercise;

@interface WTModelController : NSObject

+ (WTModelController *)sharedInstance;

@property (strong, nonatomic) NSMutableArray *programs;

- (void)storeProgram:(WTProgram *)program;
- (void)storeWorkout:(WTWorkout *)workout inProgram:(WTProgram *)program;
- (void)storeExcercise:(WTExercise *)excercise inWorkout:(WTWorkout *)workout;

@end
