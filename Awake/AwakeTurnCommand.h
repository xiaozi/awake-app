//
//  AwakeTurnCommand.h
//  Awake
//
//  Created by xiaozi on 14-4-6.
//  Copyright (c) 2014年 xiaozi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AwakeTurnCommand : NSScriptCommand

@property (assign, nonatomic, readwrite) int duration;
- (void)performDefaultImplementation;

@end
