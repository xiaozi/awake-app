//
//  AwakeManager.m
//  Awake
//
//  Created by xiaozi on 14-2-21.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import "AwakeManager.h"
#import "AppDelegate.h"

@implementation AwakeManager

@synthesize isSleepOff = isSleepOff;

-(id)initWithSleepOff: (BOOL) sleepOff
{
	self = [super init];
	if (self != nil) {
		isSleepOff = sleepOff;
	}
	return self;
}

/**
 * turn on
 */
-(void) turnOn
{
	if (_timer) {
		[_timer invalidate];
		_timer = nil;
	}
	IOReturn ret;
	ret = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep, kIOPMAssertionLevelOn, CFSTR("DisplaySleepOff"), &displayAssertionId);
	if (ret == kIOReturnSuccess)
		NSLog(@"Display sleep is off");
	ret = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoIdleSleep, kIOPMAssertionLevelOn, CFSTR("IdleSleepOff"), &idleAssertionId);
	if (ret == kIOReturnSuccess)
		NSLog(@"Idle sleep is off");
	isSleepOff = YES;
	AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
	[appDelegate iconInactive];
}

/**
 * turn on for a while
 */
-(void) turnOn: (NSInteger) duration
{
	if (_timer) {
		[_timer invalidate];
		_timer = nil;
	}
	[self turnOn];
	_timer = [NSTimer scheduledTimerWithTimeInterval:duration
											 target:self
										   selector:@selector(turnOff)
										   userInfo:nil
											repeats:NO];
}

/**
 * turn off
 */
-(void) turnOff
{
	if (_timer) {
		[_timer invalidate];
		_timer = nil;
	}
	IOReturn ret;
	if (displayAssertionId != 0) {
		ret = IOPMAssertionRelease(displayAssertionId);
		if (ret == kIOReturnSuccess)
			NSLog(@"Display sleep is on");
		displayAssertionId = 0;
	}
	if (idleAssertionId != 0) {
		ret = IOPMAssertionRelease(idleAssertionId);
		if (ret == kIOReturnSuccess)
			NSLog(@"Idle sleep is on");
		idleAssertionId = 0;
	}
	isSleepOff = NO;
	AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
	[appDelegate iconInactive];
}

@end
