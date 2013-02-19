//
//  DRViewController.m
//  Timer Study
//
//  Created by Daniel R on 2/18/13.
//  Copyright (c) 2013 Daniel R. All rights reserved.
//

#import "DRViewController.h"

@interface DRViewController ()

@end

@implementation DRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.startButton setTitle:@"Timing..." forState:UIControlStateDisabled];
    [self.startButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.startButton setTitle:@"Start Timer" forState:UIControlStateNormal];
    
    
    NSString* filepath = [[NSBundle mainBundle] pathForResource: @"donetimer.aiff" ofType:nil];
    NSURL *url = [[NSURL alloc ]initFileURLWithPath:filepath];
    NSError *error;
    
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    self.audioPlayer.volume = 0.9;
    self.audioPlayer.numberOfLoops = 0;
    NSLog(@"Error: %@", [error description]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveTimerTick {
    
    unsigned int unitFlags =  NSMinuteCalendarUnit | NSSecondCalendarUnit ;
    
    NSDate* now = [NSDate date];
    if ([self.endTime timeIntervalSinceDate:now] < 0 ) {
        [self timerDidStop];
    } else {
    
    
        NSDateComponents *breakdownInfo = [[NSCalendar currentCalendar]
                                       components:unitFlags
                                       fromDate:now
                                       toDate:self.endTime
                                       options:0
                                       ];

    
        self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",
                               [breakdownInfo minute],
                               [breakdownInfo second]
                               ];
    }
}

-(void)timerDidStop {
    self.timeLabel.text = @"Done!";
    [self.startButton setEnabled:YES];
    [self.pollingTimer invalidate];
    [self.audioPlayer play];
}


-(IBAction)startTimer:(id)sender {
    NSLog(@"Starting timer...");

    self.startTime = [NSDate date];
    self.endTime = [NSDate dateWithTimeInterval:2 sinceDate:self.startTime];

    [self.startButton setEnabled:NO];

    
    _pollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                    target:self
                                                  selector:@selector(receiveTimerTick)
                                                  userInfo:nil
                                                   repeats:YES];
    
    
    UIApplication* app = [UIApplication sharedApplication];
    if ([app scheduledLocalNotifications] > 0) [app cancelAllLocalNotifications];
    

    UILocalNotification* alarm = [[UILocalNotification alloc] init] ;
    if (alarm)
    {
        alarm.fireDate = self.endTime;
        alarm.timeZone = [NSTimeZone defaultTimeZone];
        alarm.repeatInterval = 0;
        alarm.soundName = @"donetimer.aiff";
        alarm.alertBody = @"Timer is done!";
        
        [app scheduleLocalNotification:alarm];
    }
}

@end
