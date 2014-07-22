//
//  WTAddNewViewController.h
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/18/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTAddNewViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;

- (void)confirmCreation;

@end
