//
//  AppDelegate.h
//  Awake
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
	IBOutlet NSMenu *activateForMenu;
	NSStatusItem *statusItem;
	StatusItemView *statusView;
	PreferencesController *preferencesController;
	AwakeManager *awakeManager;
	NSTimer* timer;
//	AboutController *aboutController;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)quit:(id)sender;

-(IBAction)showAbout:(id)sender;

-(IBAction)showPreferences:(id)sender;

-(IBAction)awakeForWhile:(id)sender;

@end
