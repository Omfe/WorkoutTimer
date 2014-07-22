//
//  WTProgram.h
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTProgram : NSObject

@property (strong, nonatomic) NSString *programName;
@property (strong, nonatomic) NSMutableArray *workouts;

@end
