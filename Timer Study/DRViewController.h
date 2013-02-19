//
//  DRViewController.h
//  Timer Study
//
//  Created by Daniel R on 2/18/13.
//  Copyright (c) 2013 Daniel R. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface DRViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *startButton;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

@property (nonatomic, strong) NSTimer *pollingTimer;

-(IBAction)startTimer:(id)sender;
-(void)receiveTimerTick;
@end
