//
//  PreferencesWindowController.h
//  awake
//
//  Created by xiaozi on 14-2-22.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StartAtLoginController.h"

@interface PreferencesController : NSWindowController {
	IBOutlet NSButton *atLoginCheckBox;
	IBOutlet NSButton *autoCheckCheckBox;
	StartAtLoginController *loginController;
}

-(IBAction) clickAtLogin:(id)sender;

-(IBAction) clickAutoCheck:(id)sender;

@end
