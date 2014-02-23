//
//  StatusItemView.h
//  awake
//
//  Created by xiaozi on 14-2-21.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusItemView : NSControl <NSMenuDelegate>{
	NSImage *_image;
	NSImage *_alternateImage;
	NSStatusItem *_statusItem;
	BOOL _isHighlighted;
	SEL _action;
	SEL _rightAction;
	id __unsafe_unretained _target;
}

@property (nonatomic, readonly) NSStatusItem *statusItem;
@property (nonatomic, strong) NSImage *image;
@property (nonatomic, strong) NSImage *alternateImage;
@property (nonatomic, setter = setHighlighted:) BOOL isHighlighted;
@property (nonatomic) SEL action;
@property (nonatomic) SEL rightAction;
@property (nonatomic, unsafe_unretained) id target;

- (id) initWithStatusItem: (NSStatusItem *) statusItem;

@end
