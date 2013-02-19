//
//  DRAppDelegate.m
//  Timer Study
//
//  Created by Daniel R on 2/18/13.
//  Copyright (c) 2013 Daniel R. All rights reserved.
//

#import "DRAppDelegate.h"

@implementation DRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"Got the notification!");
    if( application.applicationState == UIApplicationStateActive) {

//        NSString* filepath = [[NSBundle mainBundle] pathForResource: @"donetimer" ofType:@"aiff"];
//        NSURL *url = [[NSURL alloc ]initFileURLWithPath:filepath];
//        NSError *error;
//
//       
//        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
//        audioPlayer.delegate = self;
//        audioPlayer.numberOfLoops = 1;
//        
//        NSLog(@"path: %@ ... eerror: %@", url, [error domain]);
//        [audioPlayer prepareToPlay];
//        BOOL success = [audioPlayer play];
//        NSLog(@"was %d %d", YES, success);
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"did finish playing %d %d", YES, flag);
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags {
    NSLog(@"intteruption");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    NSLog(@"error: %@", [error domain]);
}
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    NSLog(@"begin intteruption");
}


@end
