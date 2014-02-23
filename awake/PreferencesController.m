//
//  PreferencesWindowController.m
//  awake
//
//  Created by xiaozi on 14-2-22.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import "PreferencesController.h"
#import "StartAtLoginController.h"
#import "Sparkle/SUUpdater.h"

@interface PreferencesController ()

@end

@implementation PreferencesController

+ (void) initialize
{
	NSDictionary *defaults = [NSDictionary dictionaryWithObject: [NSNumber numberWithBool:NO] forKey:@"runAtLogin"];
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
		loginController = [[StartAtLoginController alloc] initWithIdentifier:@"com.xiaozi.awakeHelper"];
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
	[atLoginCheckBox setState: [[NSUserDefaults standardUserDefaults] boolForKey: @"runAtLogin"]];
	[autoCheckCheckBox setState: [[SUUpdater sharedUpdater] automaticallyChecksForUpdates]];
}

-(IBAction) clickAtLogin:(id)sender
{
//	[loginController setBundle:[NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Library/LoginItems/awakeHelper.app"]]];
	if ([sender state]) {
		if (![loginController startAtLogin]) {
			[loginController setStartAtLogin: YES];
		}
	} else {
		if ([loginController startAtLogin]) {
			[loginController setStartAtLogin:NO];
		}
	}
//	NSLog(@"%d", [loginController startAtLogin]);
	[[NSUserDefaults standardUserDefaults] setBool:[sender state] forKey:@"runAtLogin"];
}

-(IBAction) clickAutoCheck:(id)sender
{
	if ([sender state]) {
		[[SUUpdater sharedUpdater] setAutomaticallyChecksForUpdates: YES];
	} else {
		[[SUUpdater sharedUpdater] setAutomaticallyChecksForUpdates: NO];
	}
}

@end
