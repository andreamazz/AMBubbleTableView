//
//  AMBubbleTableViewController.h
//  AMBubbleTableViewController
//
//  Created by Andrea Mazzini on 30/06/13.
//  Copyright (c) 2013 Andrea Mazzini. All rights reserved.
//

@import UIKit;

#import "AMBubbleGlobals.h"

@interface AMBubbleTableViewController : UIViewController

@property (nonatomic, strong) UITableView*	tableView;
@property (nonatomic, strong) UITextView*	textView;
@property (nonatomic, assign) id<AMBubbleTableDataSource> dataSource;
@property (nonatomic, assign) id<AMBubbleTableDelegate> delegate;

- (void)reloadTableScrollingToBottom:(BOOL)scroll;
- (void)setBubbleTableOptions:(NSDictionary *)options;
- (void)setTableStyle:(AMBubbleTableStyle)style;
- (void)scrollToBottomAnimated:(BOOL)animated;

@end
