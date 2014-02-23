//
//  AppDelegate.h
//  awake
//
//  Created by xiaozi on 14-2-20.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StatusItemView.h"
#import "PreferencesController.h"
#import "AwakeManager.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet NSMenu *statusMenu;
	NSStatusItem *statusItem;
	StatusItemView *statusView;
	PreferencesController *preferencesController;
	AwakeManager *awakeManager;
//	AboutController *aboutController;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)quit:(id)sender;

-(IBAction)showAbout:(id)sender;

-(IBAction)showPreferences:(id)sender;

@end
