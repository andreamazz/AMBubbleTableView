//
//  AMBubbleTableCell.m
//  BubbleTableDemo
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleTableCell.h"

// TODO: parametrize
#define kMessageFontSize 15



@interface AMBubbleTableCell ()

@property (nonatomic, strong) UILabel*		labelText;
@property (nonatomic, strong) UILabel*		labelTimestamp;
@property (nonatomic, strong) UIImageView*	imageBackground;
@property (nonatomic, strong) UIImageView*	imageCheck;
@property (nonatomic, strong) UIImageView*	imageAvatar;
@property (nonatomic, strong) UILabel*		labelUsername;
@property (nonatomic, assign) AMBubbleTableCellStyle bubbleStyle;

@end

@implementation AMBubbleTableCell

- (id)initWithStyle:(AMBubbleTableCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
		self.backgroundColor = [UIColor clearColor];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.accessoryType = UITableViewCellAccessoryNone;
		self.bubbleStyle = style;
		self.labelText = [[UILabel alloc] init];
		self.imageBackground = [[UIImageView alloc] init];
		self.labelTimestamp = [[UILabel alloc] init];
		self.labelUsername = [[UILabel alloc] init];
		[self.contentView addSubview:self.imageBackground];
		[self.contentView addSubview:self.labelText];
		[self.contentView addSubview:self.labelTimestamp];
		[self.contentView addSubview:self.labelUsername];
    }
    return self;
}


- (void)setupCellWithType:(AMBubbleCellType)type withWidth:(float)width andParams:(NSDictionary*)params
{
	// Configure the cell to show the message in a bubble. Layout message cell & its subviews.
    CGSize size = [params[@"text"] sizeWithFont:[UIFont systemFontOfSize:15]
							  constrainedToSize:CGSizeMake(kMessageTextWidth, CGFLOAT_MAX)
								  lineBreakMode:NSLineBreakByWordWrapping];
	
	[self.labelText setBackgroundColor:[UIColor clearColor]];
	[self.labelText setFont:[UIFont systemFontOfSize:15]];
	[self.labelText setNumberOfLines:0];
	
	// Right Bubble
	if (type == AMBubbleCellSent) {
		
		CGRect rect = CGRectMake(width - size.width - 34.0f,
								 kMessageFontSize - 13.0f,
								 size.width + 34.0f,
								 size.height + 12.0f);
		
		self.imageBackground.frame = rect;
		[self.imageBackground setImage:[[UIImage imageNamed:@"messageBubbleGreen"] stretchableImageWithLeftCapWidth:15 topCapHeight:13]];
		self.imageBackground.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
		
        self.labelText.frame = CGRectMake(width-size.width-22.0f, kMessageFontSize-9.0f, size.width+5.0f, size.height);
        self.labelText.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
		[self.labelText setText:params[@"text"]];
		
		// TODO: parametrize
		self.labelTimestamp.frame = CGRectMake(70.0f, size.height - 15, 50, 30);
		[self.labelTimestamp setFont:[UIFont boldSystemFontOfSize:13]];
		[self.labelTimestamp setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.labelTimestamp setBackgroundColor:[UIColor clearColor]];
		self.labelTimestamp.text = params[@"date"];
		
	}
	
	if (type == AMBubbleCellReceived) {
		
		CGFloat userOffset = 0;
		if (![params[@"username"] isEqualToString:@""]) {
			userOffset = 30;
		}
			// TODO: account for username longer than the text
		CGRect rect = CGRectMake(0.0f,
								 kMessageFontSize - 13.0f + userOffset,
								 size.width + 34.0f,
								 size.height + 12.0f + userOffset);
		
		userOffset += self.labelUsername.font.lineHeight;
		
		self.imageBackground.frame = rect;
        [self.imageBackground setImage:[[UIImage imageNamed:@"messageBubbleGray"] stretchableImageWithLeftCapWidth:23 topCapHeight:15]];
		self.imageBackground.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
		
        self.labelText.frame = CGRectMake(22.0f, kMessageFontSize-9.0f+userOffset, size.width+5.0f, size.height);
        self.labelText.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
		[self.labelText setText:params[@"text"]];
		
		self.labelTimestamp.frame = CGRectMake(215.0f, size.height - 15, 50, 30);
		[self.labelTimestamp setFont:[UIFont boldSystemFontOfSize:13]];
		[self.labelTimestamp setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.labelTimestamp setBackgroundColor:[UIColor clearColor]];
		self.labelTimestamp.text = params[@"date"];
		
		if (![params[@"username"] isEqualToString:@""]) {
			self.labelUsername.frame = CGRectMake(22.0f, kMessageFontSize-9.0f + self.labelUsername.font.lineHeight, size.width+5.0f, self.labelUsername.font.lineHeight * 2);
			[self.labelUsername setFont:[UIFont boldSystemFontOfSize:13]];
			[self.labelUsername setTextColor:[UIColor redColor]];
			[self.labelUsername setBackgroundColor:[UIColor clearColor]];
			self.labelUsername.text = params[@"username"];
		}
	}

	if (type == AMBubbleCellTimestamp) {
		self.labelText.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
		[self.labelText setTextAlignment:NSTextAlignmentCenter];
        [self.labelText setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
		[self.labelText setFont:[UIFont boldSystemFontOfSize:13]];
		[self.labelText setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.labelText setText:params[@"text"]];
		[self.imageBackground setFrame:CGRectZero];
		[self.labelTimestamp setFrame:CGRectZero];
		self.labelText.text = params[@"date"];
	}
	
	
}

@end
