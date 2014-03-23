//
//  AwakeManager.m
//  Awake
//
//  Created by xiaozi on 14-2-21.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import "AwakeManager.h"

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
 * 关闭睡眠
 */
-(void) turnOn
{
	IOReturn ret;
	ret = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep, kIOPMAssertionLevelOn, CFSTR("DisplaySleepOff"), &displayAssertionId);
	if (ret == kIOReturnSuccess)
		NSLog(@"Display sleep is off");
	ret = IOPMAssertionCreateWithName(kIOPMAssertionTypeNoIdleSleep, kIOPMAssertionLevelOn, CFSTR("IdleSleepOff"), &idleAssertionId);
	if (ret == kIOReturnSuccess)
		NSLog(@"Idle sleep is off");
	isSleepOff = YES;
}
/**
 * 恢复原始状态
 */
-(void) turnOff
{
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
}

@end
