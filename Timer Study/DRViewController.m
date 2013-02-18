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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startTimer:(id)sender {
    UIApplication* app = [UIApplication sharedApplication];
    if ([app scheduledLocalNotifications] > 0) [app cancelAllLocalNotifications];
    

    UILocalNotification* alarm = [[UILocalNotification alloc] init] ;
    if (alarm)
    {
        alarm.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
        alarm.timeZone = [NSTimeZone defaultTimeZone];
        alarm.repeatInterval = 0;
        alarm.soundName = UILocalNotificationDefaultSoundName;
        alarm.alertBody = @"Timer is done!";
        
        [app scheduleLocalNotification:alarm];
    }
}

@end
