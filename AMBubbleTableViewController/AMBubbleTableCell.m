//
//  AMBubbleTableCell.m
//  AMBubbleTableViewController
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleTableCell.h"
#import "AMBubbleAccessoryView.h"
#import <QuartzCore/QuartzCore.h>

@interface AMBubbleTableCell ()

@property (nonatomic, weak)   NSDictionary* options;
@property (nonatomic, strong) UITextView*	textView;
@property (nonatomic, strong) UIImageView*	imageBackground;
@property (nonatomic, strong) UILabel*		labelUsername;
@property (nonatomic, strong) UIView<AMBubbleAccessory>*		bubbleAccessory;

@end

@implementation AMBubbleTableCell

- (id)initWithOptions:(NSDictionary*)options reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
		self.options = options;
		self.backgroundColor = [UIColor clearColor];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.accessoryType = UITableViewCellAccessoryNone;
		self.textView = [[UITextView alloc] init];
		self.imageBackground = [[UIImageView alloc] init];
		self.labelUsername = [[UILabel alloc] init];
		self.bubbleAccessory = [[NSClassFromString(options[AMOptionsAccessoryClass]) alloc] init];
		[self.bubbleAccessory setOptions:options];
		[self.contentView addSubview:self.imageBackground];
		[self.imageBackground addSubview:self.textView];
		[self.imageBackground addSubview:self.labelUsername];
		[self.contentView addSubview:self.bubbleAccessory];
		[self.textView setUserInteractionEnabled:YES];
		[self.imageBackground setUserInteractionEnabled:YES];
    }
    return self;
}

- (void)setupCellWithType:(AMBubbleCellType)type withWidth:(float)width andParams:(NSDictionary*)params
{
	UIFont* textFont = self.options[AMOptionsBubbleTextFont];
	
	CGRect content = self.contentView.frame;
	content.size.width = width;
	self.contentView.frame = content;
	self.frame = content;
	// Configure the cell to show the message in a bubble. Layout message cell & its subviews.
	CGSize sizeText = [params[@"text"] sizeWithFont:textFont
								  constrainedToSize:CGSizeMake(kMessageTextWidth, CGFLOAT_MAX)
									  lineBreakMode:NSLineBreakByWordWrapping];
	
	
	[self.textView setBackgroundColor:[UIColor clearColor]];
	[self.textView setFont:textFont];
	[self.textView setEditable:NO];
	[self.textView setScrollEnabled:NO];
	[self.textView setDataDetectorTypes:[self.options[AMOptionsBubbleDetectionType] intValue]];
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
#ifdef __IPHONE_7_0
		[self.textView setSelectable:YES];
		[self.textView.textContainer setLineFragmentPadding:0];
		[self.textView setTextContainerInset:UIEdgeInsetsZero];
#endif
	} else {
		[self.textView setContentInset:UIEdgeInsetsMake(-8,-8,-8,-8)];
	}
	[self.textView setTextColor:self.options[AMOptionsTextFieldFontColor]];
	
	[self.bubbleAccessory setupView:params];
	
	// Right Bubble
	if (type == AMBubbleCellSent) {
		
		[self.bubbleAccessory setFrame:CGRectMake(width - self.bubbleAccessory.frame.size.width - 2,
												  2,
												  self.bubbleAccessory.frame.size.width,
												  self.bubbleAccessory.frame.size.height)];
		
		
		CGRect rect = CGRectMake(width - sizeText.width - 34.0f - self.bubbleAccessory.frame.size.width,
								 textFont.lineHeight - 13.0f,
								 sizeText.width + 34.0f,
								 sizeText.height + 12.0f);
		
		if (rect.size.height > self.bubbleAccessory.frame.size.height) {
			if ([self.options[AMOptionsAccessoryPosition] intValue] == AMBubbleAccessoryDown) {
				CGRect frame = self.bubbleAccessory.frame;
				frame.origin.y += rect.size.height - self.bubbleAccessory.frame.size.height;
				self.bubbleAccessory.frame = frame;
			}
		} else {
			if ([self.options[AMOptionsAccessoryPosition] intValue] == AMBubbleAccessoryDown) {
				rect.origin.y += self.bubbleAccessory.frame.size.height - rect.size.height;
			} else {
				rect.origin.y = 0;
			}
		}
		
		[self setupBubbleWithType:type
					   background:rect
						textFrame:CGRectMake(12.0f,
											 4.0f,
											 sizeText.width + 5.0f,
											 sizeText.height)
						  andText:params[@"text"]];
	}
	
	if (type == AMBubbleCellReceived) {
		
		[self.bubbleAccessory setFrame:CGRectMake(2,
												  2,
												  self.bubbleAccessory.frame.size.width,
												  self.bubbleAccessory.frame.size.height)];
		CGSize usernameSize = CGSizeZero;
		
		if (![params[@"username"] isEqualToString:@""]) {
			UIFont* fontUsername = self.options[AMOptionsUsernameFont];
			[self.labelUsername setFont:fontUsername];
			usernameSize = [params[@"username"] sizeWithFont:fontUsername
										   constrainedToSize:CGSizeMake(kMessageTextWidth, self.labelUsername.font.lineHeight)
											   lineBreakMode:NSLineBreakByWordWrapping];
			[self.labelUsername setNumberOfLines:1];
			[self.labelUsername setFrame:CGRectMake(22.0f, fontUsername.lineHeight - 9.0f, usernameSize.width+5.0f, usernameSize.height)];
			[self.labelUsername setBackgroundColor:[UIColor clearColor]];
			if ([params[@"color"] isKindOfClass:[UIColor class]]) {
				[self.labelUsername setTextColor:params[@"color"]];
			}
			[self.labelUsername setText:params[@"username"]];
		}
		
		CGRect rect = CGRectMake(0.0f + self.bubbleAccessory.frame.size.width,
								 textFont.lineHeight - 13.0f,
								 MAX(sizeText.width, usernameSize.width) + 34.0f, // Accounts for usernames longer than text
								 sizeText.height + 12.0f + usernameSize.height);
		
		if (rect.size.height > self.bubbleAccessory.frame.size.height) {
			if ([self.options[AMOptionsAccessoryPosition] intValue] == AMBubbleAccessoryDown) {
				CGRect frame = self.bubbleAccessory.frame;
				frame.origin.y += rect.size.height - self.bubbleAccessory.frame.size.height;
				self.bubbleAccessory.frame = frame;
			}
		} else {
			if ([self.options[AMOptionsAccessoryPosition] intValue] == AMBubbleAccessoryDown) {
				rect.origin.y += self.bubbleAccessory.frame.size.height - rect.size.height;
			} else {
				rect.origin.y = 0;
			}
		}
		
		[self setupBubbleWithType:type
					   background:rect
						textFrame:CGRectMake(22.0f, 4.0 + usernameSize.height, sizeText.width + 5.0f, sizeText.height)
						  andText:params[@"text"]];
	}
	
	if (type == AMBubbleCellTimestamp) {
		[self.textView setDataDetectorTypes:UIDataDetectorTypeNone];
		[self.bubbleAccessory setFrame:CGRectZero];
		
		self.textView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
		[self.textView setTextAlignment:NSTextAlignmentCenter];
        [self.textView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
		[self.textView setFont:self.options[AMOptionsTimestampFont]];
		[self.textView setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.textView setText:params[@"text"]];
		[self.imageBackground setFrame:CGRectZero];
		self.textView.text = params[@"date"];
	}
	
	[self setNeedsLayout];
	
}

- (void)setupBubbleWithType:(AMBubbleCellType)type background:(CGRect)frame textFrame:(CGRect)textFrame andText:(NSString*)text
{
	[self.imageBackground setFrame:frame];
	
	if (type == AMBubbleCellReceived) {
		[self.imageBackground setImage:self.options[AMOptionsImageIncoming]];
	} else {
		[self.imageBackground setImage:self.options[AMOptionsImageOutgoing]];
	}
	
	[self.imageBackground setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
	
	// Dirty fix for ios previous than 7.0
	if (!SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
		textFrame.size.width += 12;
	}
	[self.textView setFrame:textFrame];
	[self.textView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
	[self.textView setText:nil];
	[self.textView setText:text];
}



@end
