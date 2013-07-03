//
//  AMViewController.m
//  BubbleTableDemo
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController () <AMBubbleTableDataSource, AMBubbleTableDelegate>

@property (nonatomic, strong) NSMutableArray* data;

@end

@implementation AMViewController

- (void)viewDidLoad
{
	// Bubble Table setup
	
	[self setDataSource:self]; // Weird, uh?
	[self setDelegate:self];
	
	// Dummy data
	self.data = [[NSMutableArray alloc] initWithArray:@[
				 @{@"text": @"He felt that his whole life was some kind of dream and he sometimes wondered whose it was and whether they were enjoying it.",
				 @"date": [NSDate date], @"type": @(AMBubbleCellReceived)},
				 @{@"text": @"Don't Panic.",
				 @"date": [NSDate date], @"type": @(AMBubbleCellReceived)},
				 @{@"text": @"I'd far rather be happy than right any day.",
				 @"date": [NSDate date], @"type": @(AMBubbleCellReceived)},
				 @{@"text": @"The only reason for walking into the jaws of Death is so's you can steal His gold teeth.",
				 @"date": [NSDate date], @"type": @(AMBubbleCellSent)},
				 @{@"text": @"The gods had a habit of going round to atheists' houses and smashing their windows.",
				 @"date": [NSDate date], @"type": @(AMBubbleCellReceived)},
				 @{@"text": @"you are lucky. Your friend is going to meet Bel-Shamharoth. You will only die.",
				 @"date": [NSDate date], @"type": @(AMBubbleCellSent)},
				 @{@"text": @"Guess the quotes!",
				 @"date": [NSDate date], @"type": @(AMBubbleCellSent)}
				 ]
				 ];
	
	[self setBubbleTableOptions:@{
			AMOptionsTableStyle: @(AMBubbleTableCellDefault)
	 }];
	
	// Call super after setting up the options
	[super viewDidLoad];
}

#pragma mark - AMBubbleTableDataSource

- (NSInteger)numberOfRows
{
	return self.data.count;
}

- (AMBubbleCellType)cellTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.data[indexPath.row][@"type"] intValue];
}

- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return self.data[indexPath.row][@"text"];
}

- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [NSDate date];
}

#pragma mark - AMBubbleTableDelegate

- (void)didSendText:(NSString*)text
{
	NSLog(@"User wrote: %@", text);
	
	[self.data addObject:@{ @"text": text,
	 @"date": [NSDate date],
	 @"type": @(AMBubbleCellSent)
	 }];
	
	[super reloadTableScrollingToBottom:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
