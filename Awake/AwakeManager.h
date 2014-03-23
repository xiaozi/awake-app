//
//  AwakeManager.h
//  Awake
//
//  Created by xiaozi on 14-2-21.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface AwakeManager : NSObject {
	BOOL isSleepOff;
	IOPMAssertionID displayAssertionId;
	IOPMAssertionID idleAssertionId;
}

@property (assign) BOOL isSleepOff;

-(id)initWithSleepOff: (BOOL) sleepOff;
-(void) turnOn;
-(void) turnOff;

@end
