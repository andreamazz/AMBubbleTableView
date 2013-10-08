//
//  AMBubbleFlatAccessoryView.m
//  AMBubbleTableViewController
//
//  Created by Andrea Mazzini on 02/08/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleFlatAccessoryView.h"
#import <QuartzCore/QuartzCore.h>

@interface AMBubbleFlatAccessoryView ()

@property (nonatomic, weak)   NSDictionary* options;
@property (nonatomic, strong) UILabel*		labelTimestamp;
@property (nonatomic, strong) UIImageView*	imageCheck;
@property (nonatomic, strong) UIImageView*	imageAvatar;

@end

@implementation AMBubbleFlatAccessoryView

- (id)init
{
    self = [super init];
    if (self) {
		
		[self setClipsToBounds:YES];
		
		self.imageAvatar = [[UIImageView alloc] init];
		self.labelTimestamp = [[UILabel alloc] init];
		[self addSubview:self.imageAvatar];
		[self addSubview:self.labelTimestamp];
		
		self.imageAvatar.layer.cornerRadius = 2.0;
		self.imageAvatar.layer.masksToBounds = YES;
		
		[self.labelTimestamp setTextColor:[UIColor colorWithRed:0.627 green:0.627 blue:0.627 alpha:1]];
		[self.labelTimestamp setTextAlignment:NSTextAlignmentCenter];
		[self.labelTimestamp setBackgroundColor:[UIColor clearColor]];
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
	
	[self.labelTimestamp setFrame:CGRectMake(0,
											 [self.options[AMOptionsAvatarSize] floatValue],
											 [self.options[AMOptionsAvatarSize] floatValue],
											 sizeTime.height)
	 ];
	
	[self setFrame:CGRectMake(0,
							  0,
							  [self.options[AMOptionsAvatarSize] floatValue],
							  [self.options[AMOptionsAvatarSize] floatValue]  + sizeTime.height + 2)
	 ];
	
}


@end
