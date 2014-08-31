//
//  AwakeTurnCommand.m
//  Awake
//
//  Created by xiaozi on 14-4-6.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//
#import "AwakeTurnCommand.h"
#import "AppDelegate.h"

@implementation AwakeTurnCommand

- (void)performDefaultImplementation {
	/**
	 tell application "Awake"
	 turn on for 4
	 turn off
	 end tell
	**/
	AppDelegate *appDelegate =
	(AppDelegate *)[[NSApplication sharedApplication] delegate];
    NSString* cmdName = [[self commandDescription] commandName];
	NSLog(@"%@", cmdName);
    if ([cmdName isEqualToString: @"turn on"]) {
		NSNumber *duration = [[self evaluatedArguments] valueForKey:@"duration"];
		if (duration) {
			[[appDelegate awakeManager] turnOn: [duration integerValue]];
		} else {
			NSLog(@"hi on");
			[[appDelegate awakeManager] turnOn];
		}
		NSLog(@"Command On %@", duration);
    } else if ([cmdName isEqualToString: @"turn off"]) {
		[[appDelegate awakeManager] turnOff];
		NSLog(@"Command Off");
    }
}

@end
