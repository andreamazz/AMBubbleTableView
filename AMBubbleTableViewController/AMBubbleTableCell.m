//
//  AMBubbleTableCell.m
//  BubbleTableDemo
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleTableCell.h"
#import "AMBubbleAccessoryView.h"
#import <QuartzCore/QuartzCore.h>

// TODO: parametrize
#define kMessageFontSize 15



@interface AMBubbleTableCell ()

@property (nonatomic, weak)   NSDictionary* options;
@property (nonatomic, strong) UILabel*		labelText;
@property (nonatomic, strong) UIImageView*	imageBackground;
@property (nonatomic, strong) UILabel*		labelUsername;
@property (nonatomic, assign) AMBubbleTableCellStyle bubbleStyle;
@property (nonatomic, strong) AMBubbleAccessoryView* bubbleAccessory;

@end

@implementation AMBubbleTableCell

- (id)initWithStyle:(AMBubbleTableCellStyle)style options:(NSDictionary*)options reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
		self.options = options;
		self.backgroundColor = [UIColor clearColor];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.accessoryType = UITableViewCellAccessoryNone;
		self.bubbleStyle = style;
		self.labelText = [[UILabel alloc] init];
		self.imageBackground = [[UIImageView alloc] init];
		self.labelUsername = [[UILabel alloc] init];
		self.bubbleAccessory = [[AMBubbleAccessoryView alloc] initWithOptions:options];
		[self.contentView addSubview:self.imageBackground];
		[self.imageBackground addSubview:self.labelText];
		[self.contentView addSubview:self.labelUsername];
		[self.contentView addSubview:self.bubbleAccessory];
    }
    return self;
}


- (void)setupCellWithType:(AMBubbleCellType)type withWidth:(float)width andParams:(NSDictionary*)params
{
	// TODO: move these in the options
	UIFont* textFont = [UIFont systemFontOfSize:15]; // TODO: add color as option
		
	// Configure the cell to show the message in a bubble. Layout message cell & its subviews.
	CGSize sizeText = [params[@"text"] sizeWithFont:textFont
								  constrainedToSize:CGSizeMake(kMessageTextWidth, CGFLOAT_MAX)
									  lineBreakMode:NSLineBreakByWordWrapping];
	
	
	[self.labelText setBackgroundColor:[UIColor clearColor]];
	[self.labelText setFont:textFont];
	[self.labelText setNumberOfLines:0];

	[self.bubbleAccessory setupView:params];
		
	// Right Bubble
	if (type == AMBubbleCellSent) {

		[self.bubbleAccessory setFrame:CGRectMake(width - self.bubbleAccessory.frame.size.width - 2,
												  0,
												  self.bubbleAccessory.frame.size.width,
												  self.bubbleAccessory.frame.size.height)];
	
		CGRect rect = CGRectMake(width - sizeText.width - 34.0f - self.bubbleAccessory.frame.size.width,
								 kMessageFontSize - 13.0f,
								 sizeText.width + 34.0f,
								 sizeText.height + 12.0f);
		
		if (rect.size.height > self.bubbleAccessory.frame.size.height) {
			CGRect frame = self.bubbleAccessory.frame;
			frame.origin.y += rect.size.height - self.bubbleAccessory.frame.size.height;
			self.bubbleAccessory.frame = frame;
		} else {
			rect.origin.y += self.bubbleAccessory.frame.size.height - rect.size.height;
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
		
		// TODO: remove
		[self.bubbleAccessory setFrame:CGRectZero];
		 
		CGSize usernameSize = CGSizeZero;
		
		if (![params[@"username"] isEqualToString:@""]) {
			usernameSize = [params[@"username"] sizeWithFont:[UIFont boldSystemFontOfSize:13]
										   constrainedToSize:CGSizeMake(kMessageTextWidth, CGFLOAT_MAX)
											   lineBreakMode:NSLineBreakByWordWrapping];
		}
		
		// TODO: account for username longer than the text
		CGRect rect = CGRectMake(0.0f,
								 kMessageFontSize - 13.0f,
								 sizeText.width + 34.0f,
								 sizeText.height + 12.0f + usernameSize.height);
		
		[self setupBubbleWithType:type
					   background:rect
						textFrame:CGRectMake(22.0f, 4.0 + usernameSize.height, sizeText.width + 5.0f, sizeText.height)
						  andText:params[@"text"]];
		
		if (![params[@"username"] isEqualToString:@""]) {
			self.labelUsername.frame = CGRectMake(22.0f, kMessageFontSize-9.0f, usernameSize.width+5.0f, usernameSize.height);
			[self.labelUsername setFont:[UIFont boldSystemFontOfSize:13]];
			[self.labelUsername setTextColor:[UIColor redColor]];
			[self.labelUsername setBackgroundColor:[UIColor clearColor]];
			self.labelUsername.text = params[@"username"];
		}
	}
	
	if (type == AMBubbleCellTimestamp) {
		
		[self.bubbleAccessory setFrame:CGRectZero];
		
		self.labelText.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
		[self.labelText setTextAlignment:NSTextAlignmentCenter];
        [self.labelText setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
		[self.labelText setFont:self.options[AMOptionsTimestampFont]];
		[self.labelText setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.labelText setText:params[@"text"]];
		[self.imageBackground setFrame:CGRectZero];
		self.labelText.text = params[@"date"];
	}
		
	
}

- (void)setupBubbleWithType:(AMBubbleCellType)type background:(CGRect)frame textFrame:(CGRect)textFrame andText:(NSString*)text
{
	[self.imageBackground setFrame:frame];

	if (type == AMBubbleCellReceived) {
		[self.imageBackground setImage:[[UIImage imageNamed:@"messageBubbleGray"] stretchableImageWithLeftCapWidth:23 topCapHeight:15]];
	} else {
		[self.imageBackground setImage:[[UIImage imageNamed:@"messageBubbleGreen"] stretchableImageWithLeftCapWidth:15 topCapHeight:13]];
	}
	
	[self.imageBackground setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
	
	[self.labelText setFrame:textFrame];
	[self.labelText setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
	[self.labelText setText:text];
}

@end
