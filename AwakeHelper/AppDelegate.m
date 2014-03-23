//
//  AppDelegate.m
//  AwakeHelper
//
//  Created by xiaozi on 14-2-22.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
	NSString *appPath = [[[NSBundle mainBundle] bundlePath] stringByReplacingOccurrencesOfString:@"/Contents/Library/LoginItems/AwakeHelper.app" withString:@""];
	NSString *binaryPath = [[NSBundle bundleWithPath:appPath] executablePath];
	[[NSWorkspace sharedWorkspace] launchApplication:binaryPath];
	[NSApp terminate:nil];
}

@end
