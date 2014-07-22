//
//  WTExcerciseTimerViewController.m
//  WorkoutTimer
//
//  Created by Omar Gudino on 7/21/14.
//  Copyright (c) 2014 Omar Gudino. All rights reserved.
//

#import "WTExcerciseTimerViewController.h"
#import <AudioToolbox/AudioServices.h>
#import "WTExercise.h"

@interface WTExcerciseTimerViewController () <UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *setTimeButton;

@property (assign, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSMutableArray *pickerViewNumbers;
@property (strong, nonatomic) UIView *pickerHolderView;
@property (assign, nonatomic) SystemSoundID soundID;

@end

@implementation WTExcerciseTimerViewController

- (void)viewDidLoad
{
    UITapGestureRecognizer *tapGestureRecognizer;
    
    [super viewDidLoad];
    [self setTitle:self.selectedExcercise.excerciseName];
    self.pickerViewNumbers = [[NSMutableArray alloc] init];
    for (int i=0; i<=60; i++){
        [self.pickerViewNumbers addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    self.countdownLabel.text = [self countdownLabelTextForTimeInterval:self.selectedExcercise.restPeriod];
    
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_hidePickerView:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
   // NSString *path = [[NSBundle mainBundle] pathForResource:@"Untitled" ofType:@"aifc"];
 //   AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &_soundID);

}

- (void)_hidePickerView:(UITapGestureRecognizer *)tapGestureRecognizer
{
    self.countdownLabel.text = [self countdownLabelTextForTimeInterval:self.selectedExcercise.restPeriod];
    [self.setTimeButton setUserInteractionEnabled:YES];
    [self.startButton setUserInteractionEnabled:YES];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.pickerHolderView.frame = CGRectMake(0, 480, 320, 215);
                     }];
}


- (IBAction)pushedStartButton:(id)sender
{
    self.endDate = [NSDate dateWithTimeIntervalSinceNow:self.selectedExcercise.restPeriod];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];

    self.startButton.hidden = YES;
}

- (IBAction)pushedSetTimeButton:(id)sender
{
    self.pickerHolderView = [[UIView alloc] init];
    
    UIPickerView *secondsPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 215)];
    secondsPickerView.delegate = self;
    secondsPickerView.showsSelectionIndicator = YES;
    [self.pickerHolderView addSubview:secondsPickerView];
    
    NSInteger minutesRow = [self minutesForTimeInterval:self.selectedExcercise.restPeriod];
    NSInteger secondsRow = [self secondsForTimeInterval:self.selectedExcercise.restPeriod];
    [secondsPickerView selectRow:minutesRow inComponent:0 animated:NO];
    [secondsPickerView selectRow:secondsRow inComponent:1 animated:NO];
    
    [self.view addSubview:self.pickerHolderView];
    self.pickerHolderView.frame = CGRectMake(0, 480, 320, 215);
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.pickerHolderView.frame = CGRectMake(0, 305, 320, 215);
                     }];
    
    [self.setTimeButton setUserInteractionEnabled:NO];
    [self.startButton setUserInteractionEnabled:NO];
}

#pragma mark - UIPickerViewDataSource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)secondsPickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)secondsPickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return 60;
    } else {
        return 60;
    }
}

- (NSString *)pickerView:(UIPickerView *)secondsPickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerViewNumbers objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)secondsPickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedExcercise.restPeriod = ([secondsPickerView selectedRowInComponent:0] * 60) + [secondsPickerView selectedRowInComponent:1];
}

- (void)countDown
{
    self.countdownLabel.text = [self countdownLabelTextForCurrentTimeRemaining];
    if ([self.endDate timeIntervalSinceDate:[NSDate date]] <= 0) {
        [self.timer invalidate];
        self.startButton.hidden = NO;
        self.countdownLabel.text = [self countdownLabelTextForTimeInterval:self.selectedExcercise.restPeriod];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Timer Done"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (NSString *)countdownLabelTextForCurrentTimeRemaining
{
    NSTimeInterval timeInterval = [self.endDate timeIntervalSinceDate:[NSDate date]];
    return [self countdownLabelTextForTimeInterval:timeInterval];
}

- (NSString *)countdownLabelTextForTimeInterval:(NSTimeInterval)timeInterval
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatWidth:2];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setPaddingCharacter:@"0"];
    NSNumber *minutes = [NSNumber numberWithInteger:[self minutesForTimeInterval:timeInterval]];
    NSNumber *seconds = @([self secondsForTimeInterval:timeInterval]);
    NSString *minutesString = [numberFormatter stringFromNumber:minutes];
    NSString *secondsString = [numberFormatter stringFromNumber:seconds];
    return [NSString stringWithFormat:@"%@:%@", minutesString, secondsString];
}

- (NSInteger)minutesForTimeInterval:(NSTimeInterval)timeInterval
{
    return timeInterval / 60;
}

- (NSInteger)secondsForTimeInterval:(NSTimeInterval)timeInterval
{
    NSInteger minutes = timeInterval / 60;
    return timeInterval - (minutes * 60);
}

@end
