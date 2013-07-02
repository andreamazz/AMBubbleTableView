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
		[self.contentView addSubview:self.imageBackground];
		[self.contentView addSubview:self.labelText];
		[self.contentView addSubview:self.labelTimestamp];
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
        self.imageBackground.frame = CGRectMake(width - size.width - 34.0f,
												kMessageFontSize - 13.0f, size.width + 34.0f, size.height + 12.0f);
        [self.imageBackground setImage:[[UIImage imageNamed:@"messageBubbleGreen"] stretchableImageWithLeftCapWidth:15 topCapHeight:13]];
        self.labelText.frame = CGRectMake(width-size.width-22.0f,
										  kMessageFontSize-9.0f, size.width+5.0f, size.height);
		self.imageBackground.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        self.labelText.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
		[self.labelText setText:params[@"text"]];
		// TODO: parametrize
		self.labelTimestamp.frame = CGRectMake(70.0f,
											   size.height - 15, 50, 30);
		[self.labelTimestamp setFont:[UIFont boldSystemFontOfSize:13]];
		[self.labelTimestamp setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.labelTimestamp setBackgroundColor:[UIColor clearColor]];
		self.labelTimestamp.text = params[@"date"];

	}
	
	if (type == AMBubbleCellReceived) {
		self.imageBackground.frame = CGRectMake(0.0f, kMessageFontSize-13.0f,
												size.width+34.0f, size.height+12.0f);
        [self.imageBackground setImage:[[UIImage imageNamed:@"messageBubbleGray"] stretchableImageWithLeftCapWidth:23 topCapHeight:15]];
        self.labelText.frame = CGRectMake(22.0f, kMessageFontSize-9.0f, size.width+5.0f, size.height);
        self.imageBackground.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        self.labelText.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
		[self.labelText setText:params[@"text"]];
		
		self.labelTimestamp.frame = CGRectMake(215.0f,
											   size.height - 15, 50, 30);
		[self.labelTimestamp setFont:[UIFont boldSystemFontOfSize:13]];
		[self.labelTimestamp setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];
		[self.labelTimestamp setBackgroundColor:[UIColor clearColor]];
		self.labelTimestamp.text = params[@"date"];
	}
}

@end
