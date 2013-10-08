//
//  AMBubbleAccessoryView.m
//  AMBubbleTableViewController
//
//  Created by Andrea Mazzini on 06/07/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleAccessoryView.h"
#import <QuartzCore/QuartzCore.h>

@interface AMBubbleAccessoryView ()

@property (nonatomic, weak)   NSDictionary* options;
@property (nonatomic, strong) UILabel*		labelTimestamp;
@property (nonatomic, strong) UIImageView*	imageCheck;
@property (nonatomic, strong) UIImageView*	imageAvatar;

@end

@implementation AMBubbleAccessoryView

- (id)init
{
    self = [super init];
    if (self) {
		
		[self setClipsToBounds:YES];
		
		self.imageAvatar = [[UIImageView alloc] init];
		self.labelTimestamp = [[UILabel alloc] init];
		[self addSubview:self.imageAvatar];
		[self addSubview:self.labelTimestamp];
		
		self.imageAvatar.layer.cornerRadius = 5.0;
		self.imageAvatar.layer.masksToBounds = YES;
		self.imageAvatar.layer.borderColor = [UIColor lightGrayColor].CGColor;
		self.imageAvatar.layer.borderWidth = 1.0;

		[self.labelTimestamp setTextColor:[UIColor colorWithRed:100.0f/255.0f green:120.0f/255.0f blue:150.0f/255.0f alpha:1]];

		self.labelTimestamp.shadowColor = [UIColor whiteColor];
		self.labelTimestamp.shadowOffset = CGSizeMake(0, 1.0);
		
    }
    return self;
}

- (void)setOptions:(NSDictionary *)options
{
	_options = options;
	[self.labelTimestamp setFont:self.options[AMOptionsTimestampShortFont]];
}

- (void)setupView:(NSDictionary*)params
{
	// Avatar available
	if ([params[@"avatar"] isKindOfClass:[UIImage class]]) {
		[self.imageAvatar setImage:params[@"avatar"]];
	}
	[self.labelTimestamp setText:params[@"date"]];
	
	CGSize sizeTime = CGSizeZero;
	if ([self.options[AMOptionsTimestampEachMessage] boolValue]) {
		sizeTime = [params[@"date"] sizeWithFont:self.options[AMOptionsTimestampShortFont]
							   constrainedToSize:CGSizeMake(50, CGFLOAT_MAX)
								   lineBreakMode:NSLineBreakByWordWrapping];
	}
		
	[self.imageAvatar setFrame:CGRectMake(0,
										  0,
										  [self.options[AMOptionsAvatarSize] floatValue],
										  [self.options[AMOptionsAvatarSize] floatValue])
	 ];
	
	[self.labelTimestamp setFrame:CGRectMake([self.options[AMOptionsAvatarSize] floatValue] - sizeTime.width,
											 [self.options[AMOptionsAvatarSize] floatValue] - sizeTime.height,
											 sizeTime.width,
											 sizeTime.height)
	 ];

	[self setFrame:CGRectMake(0,
							  0,
							  MAX(self.labelTimestamp.frame.size.width, self.imageAvatar.frame.size.width),
							  MAX(self.labelTimestamp.frame.size.height, self.imageAvatar.frame.size.height))
	 ];
	
}



@end
