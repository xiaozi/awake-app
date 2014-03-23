//
//  RHStatusItemView.h
//
//  Created by Richard Heard on 9/10/12.
//  Copyright (c) 2012 Richard Heard. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions
//  are met:
//  1. Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//  3. The name of the author may not be used to endorse or promote products
//  derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
//  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
//  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
//  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
//  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// An NSStatusItem hosted view that supports handling both left and right click actions, menus and showing an image / alternateImage pair.

#import <Cocoa/Cocoa.h>

@interface RHStatusItemView : NSControl{
    
    NSStatusItem *_statusItem;
    
    NSImage *_image;
    NSImage *_alternateImage;
    
    id _target;
    SEL _action;
    SEL _rightAction;
    
    NSMenu *_menu;
    NSMenu *_rightMenu;
    
    BOOL _isMouseDown;
    BOOL _isMenuVisible;
}

@property (nonatomic, assign) NSStatusItem *statusItem; //should never be nil

@property (nonatomic, retain) NSImage *image;
@property (nonatomic, retain) NSImage *alternateImage; 

@property (nonatomic, retain) id target;
@property (nonatomic, assign) SEL action;       //if no action specified, we will try and pop up menu if set.
@property (nonatomic, assign) SEL rightAction;  //if no rightAction specified, we will try and pop up, in order rightMenu, menu.

@property (nonatomic, retain) NSMenu *menu;
@property (nonatomic, retain) NSMenu *rightMenu;

-(id)initWithStatusBarItem:(NSStatusItem*)statusItem; //designated initializer

-(void)popUpMenu;               //pops up the currently stored menu
-(void)popUpRightMenu;          //if right menu is set, pops up right menu
-(void)popUpMenu:(NSMenu*)menu; //pops up the passed menu

@end

