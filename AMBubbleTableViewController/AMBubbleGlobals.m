//
//  AMBubbleGlobals.m
//  BubbleTableDemo
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleGlobals.h"

NSString *const AMOptionsTableStyle = @"AMOptionsTableStyle";
NSString *const AMOptionsTimestampEachMessage = @"AMOptionsTimestampEachMessage";
NSString *const AMOptionsTimestampShortFont = @"AMOptionsTimestampShortFont";
NSString *const AMOptionsTimestampFont = @"AMOptionsTimestampFont";
NSString *const AMOptionsAvatarSize = @"AMOptionsAvatarSize";

@implementation AMBubbleGlobals

+ (NSDictionary*)defaultOptions
{
	return @{
		  AMOptionsTableStyle : @(AMBubbleTableCellDefault),
	AMOptionsTimestampEachMessage : @YES,
	AMOptionsTimestampShortFont: [UIFont boldSystemFontOfSize:11],
	AMOptionsTimestampFont: [UIFont boldSystemFontOfSize:13],
	AMOptionsAvatarSize: @50
	};
}

@end