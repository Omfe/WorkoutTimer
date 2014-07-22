//
//  WTWorkout.h
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTProgram.h"

@interface WTWorkout : NSObject

@property (strong, nonatomic) NSString *workoutName;
@property (nonatomic, assign) BOOL isCompleted;
@property (strong, nonatomic) NSMutableArray *excercises;

@end
