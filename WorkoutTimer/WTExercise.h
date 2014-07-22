//
//  WTExercise.h
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTWorkout.h"

@interface WTExercise : WTWorkout

@property (strong, nonatomic) NSString *excerciseName;
@property (nonatomic, assign) BOOL isCompleted;
@property (assign, nonatomic) NSInteger numberOfSets;
@property (assign, nonatomic) NSInteger numberOfSetsCompleted;
@property (assign, nonatomic) NSTimeInterval restPeriod;

@end
