//
//  AMBubbleTableCell.h
//  BubbleTableDemo
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

#import "AMBubbleGlobals.h"

@interface AMBubbleTableCell : UITableViewCell

- (id)initWithStyle:(AMBubbleTableCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setupCellWithType:(AMBubbleCellType)type withWidth:(float)width andParams:(NSDictionary*)params;

@end
