//
//  StatusItemView.m
//  awake
//
//  Created by xiaozi on 14-2-21.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import "StatusItemView.h"

@implementation StatusItemView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) drawRect:(NSRect)dirtyRect
{
	[_statusItem drawStatusBarBackgroundInRect:dirtyRect withHighlight:_isHighlighted];
    NSImage *icon = _isHighlighted ? _alternateImage : _image;
    NSSize iconSize = [icon size];
    NSRect bounds = [self bounds];
	
    CGFloat iconX = roundf((NSWidth(bounds) - iconSize.width) / 2);
    CGFloat iconY = roundf((NSHeight(bounds) - iconSize.height) / 2);
    NSPoint iconPoint = NSMakePoint(iconX, iconY);
    [icon drawAtPoint:iconPoint fromRect:bounds operation:NSCompositeSourceOver fraction:1.0];
}

- (id) initWithStatusItem: (NSStatusItem *) statusItem {
	CGFloat itemWidth = [statusItem length];
	CGFloat itemHeight = [[NSStatusBar systemStatusBar] thickness];
	NSRect itemRect = NSMakeRect(0.0, 0.0, itemWidth, itemHeight);
	self = [self initWithFrame:itemRect];
	if (self != nil)
    {
		_statusItem = statusItem;
		[_statusItem setView: self];
    }
    return self;
}

- (void)setMenu:(NSMenu *) menu {
    [menu setDelegate: self];
    [super setMenu: menu];
}

- (void)setHighlighted:(BOOL)newFlag
{
    if (_isHighlighted == newFlag) return;
    _isHighlighted = newFlag;
    [self setNeedsDisplay:YES];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [NSApp sendAction:_action to:_target from:self];
}

- (void)rightMouseDown:(NSEvent *)theEvent
{
	NSMenu *menu = [super menu];
    [_statusItem popUpStatusItemMenu:menu];
	[NSApp sendAction:_rightAction to:_target from:self];
}

- (void)menuWillOpen:(NSMenu *)menu {
    [self setHighlighted:YES];
    [self setNeedsDisplay:YES];
}

- (void)menuDidClose:(NSMenu *)menu {
    [self setHighlighted:NO];
    [self setNeedsDisplay:YES];
}

- (void)setImage:(NSImage *)newImage
{
	_image = newImage;
    [self setNeedsDisplay: YES];
}

- (void)setAlternateImage:(NSImage *)newImage
{
    _alternateImage = newImage;
    if (_isHighlighted)
        [self setNeedsDisplay:YES];
}

- (BOOL)isOpaque
{
    return YES;
}

@end
