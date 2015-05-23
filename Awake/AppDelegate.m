//
//  AppDelegate.m
//  Awake
//
//  Created by xiaozi on 14-2-20.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import "AppDelegate.h"
#import "AwakeManager.h"
#import "PreferencesController.h"
#import "PFMoveApplication.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSDictionary *defaults = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:@"isSleepOff"];
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
	_awakeManager = [[AwakeManager alloc] initWithSleepOff: [[NSUserDefaults standardUserDefaults] boolForKey:@"isSleepOff"]];
}

- (void) applicationWillFinishLaunching:(NSNotification *)notification
{
	PFMoveToApplicationsFolderIfNecessary();
}

-(void)awakeFromNib
{
	statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength: 22.0];
	[statusItem setHighlightMode:YES];
	statusView = [[StatusItemView alloc] initWithStatusItem: statusItem];
	[statusView setMenu: statusMenu];
	// [statusItem setView: statusView];
	// [statusView setImage: [NSImage imageNamed:@"MenuIcon"]];
	[self iconInactive];
	[statusView setAlternateImage: [NSImage imageNamed:@"MenuIconSelected"]];
	
	[statusView setLeftAction: @selector(clickStatusItem:)];
	[statusView setRightAction: @selector(rightClickStatusItem:)];
	NSLog(@"%hhd", [_awakeManager isSleepOff]);
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isSleepOff"]) {
		[_awakeManager turnOn];
	}
	[[statusMenu itemAtIndex: 1] setSubmenu: activateForMenu];
}

-(void) iconActive {
	NSLog(@"active");
	[statusView setImage: [NSImage imageNamed:@"MenuIconActive"]];
}

-(void) iconInactive {
	NSLog(@"inactive");
	[statusView setImage: [NSImage imageNamed:@"MenuIcon"]];
}

-(void) clickStatusItem: (NSEvent *)theEvent {
	if ([_awakeManager isSleepOff]) {
		[_awakeManager turnOff];
	} else {
		[_awakeManager turnOn];
	}
	[[NSUserDefaults standardUserDefaults] setBool: [_awakeManager isSleepOff] forKey: @"isSleepOff"];
}

-(void) rightClickStatusItem:(NSEvent *)theEvent {
	// 查看剩余激活时间
	NSString *intervalStr = @"00:00:00";
	if ([_awakeManager timer]) {
		NSTimeInterval interval = [[[_awakeManager timer] fireDate] timeIntervalSinceNow];
		NSUInteger seconds = (NSUInteger)round(interval);
		intervalStr = [NSString stringWithFormat:@"%02lu:%02lu:%02lu",
					   seconds / 3600, (seconds / 60) % 60, seconds % 60];
	}
	
	[[statusMenu itemAtIndex: 0] setTitle: intervalStr];
}

-(IBAction) awakeForWhile: (id)sender
{
	NSInteger minutes = [sender tag];
	[_awakeManager turnOn: minutes * 60];
}

- (void) handleTimer: (NSTimer *) timer
{
	[_awakeManager turnOff];
}

-(IBAction)showAbout:(id)sender
{
	[NSApp activateIgnoringOtherApps:YES];
	[NSApp orderFrontStandardAboutPanel:self];
}

-(IBAction)showPreferences:(id)sender
{
	if (!preferencesController) {
		preferencesController = [[PreferencesController alloc] initWithWindowNibName: @"Preferences"];
	}
	[NSApp activateIgnoringOtherApps:YES];
	[[preferencesController window] center];
	[preferencesController showWindow: self];
}

-(IBAction)quit:(id)sender
{
	[NSApp terminate:self];
}

@end
