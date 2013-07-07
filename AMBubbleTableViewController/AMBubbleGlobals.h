//
//  AMBubbleGlobals.h
//  BubbleTableDemo
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

typedef enum {
	AMBubbleTableCellDefault = 0,
	AMBubbleTableCellSquare
} AMBubbleTableCellStyle;

typedef enum {
	AMBubbleCellTimestamp = 0,
	AMBubbleCellSent,
	AMBubbleCellReceived
} AMBubbleCellType;

#define kMessageTextWidth	180.0f

@protocol AMBubbleTableDataSource <NSObject>
@required
- (NSInteger)numberOfRows;
- (AMBubbleCellType)cellTypeForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath;
@optional
- (UIImage*)avatarForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString*)usernameForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol AMBubbleTableDelegate <NSObject>
- (void)didSendText:(NSString*)text;
@end

/* Options */

// The general style of the table.
FOUNDATION_EXPORT NSString *const AMOptionsTableStyle;

// Enables the short timestamp for every single message
FOUNDATION_EXPORT NSString *const AMOptionsTimestampEachMessage;

// Short Timestamp font
FOUNDATION_EXPORT NSString *const AMOptionsTimestampShortFont;

// Full timestamp font
FOUNDATION_EXPORT NSString *const AMOptionsTimestampFont;

// Avatar size
FOUNDATION_EXPORT NSString *const AMOptionsAvatarSize;

@interface AMBubbleGlobals : NSObject

+ (NSDictionary*)defaultOptions;

@end