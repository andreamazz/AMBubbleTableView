//
//  AMBubbleGlobals.m
//  AMBubbleTableViewController
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleGlobals.h"

NSString *const AMOptionsTimestampEachMessage = @"AMOptionsTimestampEachMessage";
NSString *const AMOptionsTimestampShortFont = @"AMOptionsTimestampShortFont";
NSString *const AMOptionsTimestampFont = @"AMOptionsTimestampFont";
NSString *const AMOptionsAvatarSize = @"AMOptionsAvatarSize";
NSString *const AMOptionsAccessoryClass = @"AMOptionsAccessoryClass";
NSString *const AMOptionsAccessorySize = @"AMOptionsAccessorySize";
NSString *const AMOptionsAccessoryMargin = @"AMOptionsAccessoryMargin";
NSString *const AMOptionsTimestampHeight = @"AMOptionsTimestampHeight";

NSString *const AMOptionsImageIncoming = @"AMOptionsImageIncoming";
NSString *const AMOptionsImageOutgoing = @"AMOptionsImageOutgoing";
NSString *const AMOptionsImageBar = @"AMOptionsImageBar";
NSString *const AMOptionsImageInput = @"AMOptionsImageInput";
NSString *const AMOptionsImageButton = @"AMOptionsImageButton";
NSString *const AMOptionsImageButtonHighlight = @"AMOptionsImageButtonHighlight";
NSString *const AMOptionsButtonTextColor = @"AMOptionsButtonTextColor";
NSString *const AMOptionsButtonHighlightedTextColor = @"AMOptionsButtonHighlightedTextColor";
NSString *const AMOptionsButtonDisabledTextColor = @"AMOptionsButtonDisabledTextColor";
NSString *const AMOptionsTextFieldBackground = @"AMOptionsTextFieldBackground";
NSString *const AMOptionsTextFieldFont = @"AMOptionsTextFieldFont";
NSString *const AMOptionsTextFieldFontColor = @"AMOptionsTextFieldFontColor";
NSString *const AMOptionsBubbleTableBackground = @"AMOptionsBubbleTableBackground";
NSString *const AMOptionsAccessoryPosition = @"AMOptionsAccessoryPosition";
NSString *const AMOptionsButtonOffset = @"AMOptionsButtonOffset";
NSString *const AMOptionsBubbleTextColor = @"AMOptionsBubbleTextColor";
NSString *const AMOptionsBubbleTextFont = @"AMOptionsBubbleTextFont";
NSString *const AMOptionsUsernameFont = @"AMOptionsUsernameFont";
NSString *const AMOptionsButtonFont = @"AMOptionsButtonFont";
NSString *const AMOptionsBubbleSwipeEnabled = @"AMOptionsBubbleSwipeEnabled";
NSString *const AMOptionsBubblePressEnabled = @"AMOptionsBubblePressEnabled";
NSString *const AMOptionsBubbleDetectionType = @"AMOptionsBubbleDetectionType";

@implementation AMBubbleGlobals

+ (NSDictionary*)defaultOptions
{
	// Default options with default style
	NSMutableDictionary* defaults = [@{
	AMOptionsTimestampEachMessage : @YES,
	AMOptionsBubbleDetectionType: @(UIDataDetectorTypeNone),
	AMOptionsAccessoryClass: @"AMBubbleAccessoryView",
	AMOptionsTimestampShortFont: [UIFont boldSystemFontOfSize:11],
	AMOptionsTimestampFont: [UIFont boldSystemFontOfSize:13],
	AMOptionsAvatarSize: @50,
	AMOptionsAccessorySize: @50,
	AMOptionsAccessoryMargin: @5,
	AMOptionsTimestampHeight: @40,
	AMOptionsBubblePressEnabled: @YES,
	AMOptionsBubbleSwipeEnabled: @YES
	} mutableCopy];

	// Add default styles
	[defaults addEntriesFromDictionary:[AMBubbleGlobals defaultStyleDefault]];
	return defaults;
}

+ (NSDictionary*)defaultStyleDefault
{
	return @{
		  AMOptionsImageIncoming: [[UIImage imageNamed:@"messageBubbleGray"] stretchableImageWithLeftCapWidth:23 topCapHeight:15],
	AMOptionsImageOutgoing: [[UIImage imageNamed:@"messageBubbleGreen"] stretchableImageWithLeftCapWidth:15 topCapHeight:13],
	AMOptionsImageBar: [[UIImage imageNamed:@"imageBar"] resizableImageWithCapInsets:UIEdgeInsetsMake(19.0f, 3.0f, 19.0f, 3.0f)],
	AMOptionsImageInput: [[UIImage imageNamed:@"imageInput"] resizableImageWithCapInsets:UIEdgeInsetsMake(20.0f, 12.0f, 18.0f, 18.0f)],
	AMOptionsImageButton: [[UIImage imageNamed:@"buttonSend"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 13.0f, 0.0f, 13.0f)],
    AMOptionsButtonTextColor: [UIColor whiteColor],
    AMOptionsButtonHighlightedTextColor: [UIColor whiteColor],
    AMOptionsButtonDisabledTextColor :[UIColor colorWithWhite:1.0f alpha:0.5f],
	AMOptionsImageButtonHighlight: [[UIImage imageNamed:@"buttonSendHighlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 13.0f, 0.0f, 13.0f)],
	AMOptionsTextFieldBackground: [UIColor whiteColor],
	AMOptionsTextFieldFont: [UIFont systemFontOfSize:15],
	AMOptionsTextFieldFontColor: [UIColor blackColor],
	AMOptionsBubbleTableBackground: [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f],
	AMOptionsAccessoryPosition: @(AMBubbleAccessoryDown),
	AMOptionsButtonOffset: @8,
	AMOptionsBubbleTextColor: [UIColor blackColor],
	AMOptionsBubbleTextFont: [UIFont systemFontOfSize:15],
	AMOptionsUsernameFont: [UIFont boldSystemFontOfSize:13]
	};
}

+ (NSDictionary*)defaultStyleSquare
{
	return @{
		  AMOptionsImageIncoming: [[UIImage imageNamed:@"bubbleSquareIncoming"] stretchableImageWithLeftCapWidth:23 topCapHeight:15],
	AMOptionsImageOutgoing: [[UIImage imageNamed:@"bubbleSquareOutgoing"] stretchableImageWithLeftCapWidth:15 topCapHeight:13],
	AMOptionsImageBar: [[UIImage imageNamed:@"imageBar"] resizableImageWithCapInsets:UIEdgeInsetsMake(19.0f, 3.0f, 19.0f, 3.0f)],
	AMOptionsImageInput: [[UIImage imageNamed:@"imageInput"] resizableImageWithCapInsets:UIEdgeInsetsMake(20.0f, 12.0f, 18.0f, 18.0f)],
	AMOptionsImageButton: [[UIImage imageNamed:@"buttonSend"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 13.0f, 0.0f, 13.0f)],
	AMOptionsImageButtonHighlight: [[UIImage imageNamed:@"buttonSendHighlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 13.0f, 0.0f, 13.0f)],
    AMOptionsButtonTextColor: [UIColor whiteColor],
    AMOptionsButtonHighlightedTextColor: [UIColor whiteColor],
    AMOptionsButtonDisabledTextColor :[UIColor colorWithWhite:1.0f alpha:0.5f],
	AMOptionsTextFieldBackground: [UIColor whiteColor],
	AMOptionsTextFieldFont: [UIFont systemFontOfSize:15],
	AMOptionsTextFieldFontColor: [UIColor blackColor],
	AMOptionsBubbleTableBackground: [UIColor colorWithRed:0.859f green:0.886f blue:0.929f alpha:1.0f],
	AMOptionsAccessoryPosition: @(AMBubbleAccessoryDown),
	AMOptionsButtonOffset: @8,
	AMOptionsBubbleTextColor: [UIColor blackColor],
	AMOptionsBubbleTextFont: [UIFont systemFontOfSize:15],
	AMOptionsUsernameFont: [UIFont boldSystemFontOfSize:13]
	};
}

+ (NSDictionary*)defaultStyleFlat
{
	return @{
		  AMOptionsTimestampFont: [UIFont boldSystemFontOfSize:11],
	AMOptionsImageIncoming: [[UIImage imageNamed:@"bubbleFlatIncoming"] stretchableImageWithLeftCapWidth:23 topCapHeight:15],
	AMOptionsImageOutgoing: [[UIImage imageNamed:@"bubbleFlatOutgoing"] stretchableImageWithLeftCapWidth:15 topCapHeight:13],
	AMOptionsImageBar: [[UIImage imageNamed:@"imageBarFlat"] resizableImageWithCapInsets:UIEdgeInsetsMake(19.0f, 3.0f, 19.0f, 3.0f)],
	AMOptionsImageInput: [[UIImage imageNamed:@"imageInputFlat"] resizableImageWithCapInsets:UIEdgeInsetsMake(20.0f, 12.0f, 18.0f, 18.0f)],
	AMOptionsImageButton: [[UIImage imageNamed:@"buttonSendFlat"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 13.0f, 0.0f, 13.0f)],
	AMOptionsImageButtonHighlight: [[UIImage imageNamed:@"buttonSendHighlightedFlat"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 13.0f, 0.0f, 13.0f)]	,
    AMOptionsButtonTextColor: [UIColor whiteColor],
    AMOptionsButtonHighlightedTextColor: [UIColor whiteColor],
    AMOptionsButtonDisabledTextColor :[UIColor colorWithWhite:1.0f alpha:0.5f],
	AMOptionsTextFieldBackground: [UIColor colorWithRed:0.827 green:0.827 blue:0.827 alpha:1],
	AMOptionsTextFieldFont: [UIFont systemFontOfSize:15],
	AMOptionsTextFieldFontColor: [UIColor darkGrayColor],
	AMOptionsBubbleTableBackground: [UIColor colorWithRed:0.913f green:0.913f blue:0.913f alpha:1.0f],
	AMOptionsAccessoryPosition: @(AMBubbleAccessoryUp),
	AMOptionsAccessoryClass: @"AMBubbleFlatAccessoryView",
	AMOptionsAccessorySize: @60,
	AMOptionsButtonOffset: @8,
	AMOptionsBubbleTextColor: [UIColor colorWithRed:0.36f green:0.36f blue:0.36f alpha:1.0f],
	AMOptionsBubbleTextFont: [UIFont systemFontOfSize:13],
	AMOptionsUsernameFont: [UIFont boldSystemFontOfSize:11]
	};
}

+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve
{
	switch (curve) {
		case UIViewAnimationCurveEaseIn:
			return UIViewAnimationOptionCurveEaseIn;
			break;
		case UIViewAnimationCurveEaseInOut:
			return UIViewAnimationOptionCurveEaseInOut;
			break;
		case UIViewAnimationCurveEaseOut:
			return UIViewAnimationOptionCurveEaseOut;
			break;
		case UIViewAnimationCurveLinear:
			return UIViewAnimationOptionCurveLinear;
			break;
	}
}

@end