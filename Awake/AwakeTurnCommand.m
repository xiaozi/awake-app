//
//  AwakeTurnCommand.m
//  Awake
//
//  Created by xiaozi on 14-4-6.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//
#import "AppDelegate.h"
#import "AwakeTurnCommand.h"

@implementation AwakeTurnCommand

- (void)performDefaultImplementation {
	/**
	 tell application "Awake"
	 turn on for 4
	 turn off
	 end tell
	**/
//	AppDelegate *appDelegate =
//	(AppDelegate *)[[NSApplication sharedApplication]delegate];
    NSString* cmdName = [[self commandDescription] commandName];
	NSLog(@"%@", cmdName);
    if ([cmdName isEqualToString: @"turn on"]) {
		NSNumber *duration = [[self evaluatedArguments] valueForKey:@"duration"];
		NSLog(@"Command On %@", duration);
    } else if ([cmdName isEqualToString: @"turn off"]) {
		NSLog(@"Command Off");
    }
}

@end
