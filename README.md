AMBubbleTableViewController
==================

[![Build Status](https://travis-ci.org/andreamazz/AMBubbleTableView.png)](https://travis-ci.org/andreamazz/AMBubbleTableView)

Simple implementation of a UITableView styled as chat bubbles. It's strongly based on Jesse Squires'  [MessagesTableViewController](https://github.com/jessesquires/MessagesTableViewController), since I needed to deeply customize the view, I decided to spawn a new library.  
###Please note
This library is no longer maintained. I strongly suggest to use Jesse's library, linked above. 
Want to adopt this library? Contact me in the issue section. 

Screenshot
--------------------
![AMBubbleTableViewController](https://raw.githubusercontent.com/andreamazz/AMBubbleTableView/master/screenshot.gif)

Setup with Cocoapods
--------------------
* Add ```pod 'AMBubbleTableViewController'``` to your Podfile
* Run ```pod install```
* Run ```open App.xcworkspace```
* Import ```AMBubbleTableViewController.h``` in your AppDelegate
* Subclass ```AMBubbleTableViewController``` from your controller
* Provide a ```AMBubbleTableDataSource``` and ```AMBubbleTableDelegate```

Setup without Cocoapods
--------------------
* Clone this repo
* Add the ```AMBubbleTableViewController``` folder to your project
* Import ```AMBubbleTableViewController.h``` in your AppDelegate
* Subclass ```AMBubbleTableViewController``` from your controller
* Provide a ```AMBubbleTableDataSource``` and ```AMBubbleTableDelegate```

AMBubbleTableDataSource
--------------------
You need to provide an object that implements the AMBubbleTableDataSource with all the data that you want to display. The required calls are:

```objc
- (NSInteger)numberOfRows;
- (AMBubbleCellType)cellTypeForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath;
```

You can also optionally specify an avatar image, a username and its color:

```objc
- (UIImage*)avatarForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString*)usernameForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIColor*)usernameColorForRowAtIndexPath:(NSIndexPath *)indexPath;
```

AMBubbleTableDelegate
--------------------
Implement the delegate to receive the user's text:

```objc
- (void)didSendText:(NSString*)text;
- (void)swipedCellAtIndexPath:(NSIndexPath *)indexPath withFrame:(CGRect)frame andDirection:(UISwipeGestureRecognizerDirection)direction;
- (void)longPressedCellAtIndexPath:(NSIndexPath *)indexPath withFrame:(CGRect)frame;
```

Main styles
--------------------
You can change the style of the AMBubbleTableViewController like this:
```objc
// After initialization
[self setTableStyle:AMBubbleTableStyleFlat];    // AMBubbleTableStyleDefault, AMBubbleTableStyleSquare, AMBubbleTableStyleFlat
```

Custom accessory view
--------------------
AMBubbleTableViewController uses a second accessory view (it's separate from the standard accessory view) to display the avatar and the timestamp. You can customize this view by passing your accessory class in the options dictionary. Your class just needs to be a UIView's subclass and implement ```AMBubbleAccessory``` protocol:

```objc
- (id)setOptions:(NSDictionary*)options;
- (void)setupView:(NSDictionary*)params;
```

Where params is a dictionary containing the UIImage ```@"avatar"``` and the NSString ```@"date"```.

Options Dictionary
--------------------
The AMBubbleTableViewController configuration can be handled by passing an NSDictionary to it. The default values can be found in  AMBubbleGlobals.m. Here's a brief description of the possible options:

```objc
AMOptionsTableStyle             // @(AMBubbleTableCellStyle), Sets the table style. Defaults to AMBubbleTableCellDefault.
AMOptionsTimestampEachMessage   // @(BOOL), Enables the timestamp for each message. Defaults to @YES.
AMOptionsTimestampShortFont     // UIFont, Sets the short timestamp font. 
AMOptionsTimestampFont          // UIFont, Sets the full timestamp font.
AMOptionsAvatarSize             // @(float), The avatar size. Defaults to @50.
AMOptionsAccessoryClass         // NSString, The accessory view for each cell. Defaults to @"AMBubbleAccessoryView".
AMOptionsAccessorySize          // @(float), The accssory view size (used to compute the minimum cell height). Defaults to @50.
AMOptionsAccessoryMargin        // @(float), The accessory view margin. Defaults to @5.
AMOptionsTimestampHeight        // @(float), The height of the timestamp row. Defaults to @40.
```

Styling Options
--------------------
You can also specify other styling options. AMBubbleTableViewController includes three styles, the default values of the following options differs from style to style. Check AMBubbleGlobals.m for more info.

```objc
AMOptionsImageIncoming          // UIImage, the left bubble stretchable image
AMOptionsImageOutgoing          // UIImage, the right bubble stretchable image
AMOptionsImageBar               // UIImage, the text bar background, resizable with cap insets
AMOptionsImageInput             // UIImage, the text view mask, resizable with cap insets
AMOptionsImageButton            // UIImage, the button image, resizable with cap insets
AMOptionsImageButtonHighlight   // UIImage, the highlighted button image, resizable with cap insets
AMOptionsTextFieldBackground    // UIColor, the textView color
AMOptionsTextFieldFont          // UIFont, the textView font
AMOptionsTextFieldFontColor     // UIColor, the textView font color
AMOptionsBubbleTableBackground  // UIColor, the tableView color
AMOptionsAccessoryPosition      // @(AMBubbleAccessoryPosition), defines wether the accessory should stay up or down
AMOptionsButtonOffset           // @(float), the vertical offset of the send button
AMOptionsBubbleTextColor        // UIColor, the main bubble's text color
AMOptionsBubbleTextFont         // UIFont, the main bubble's text font
AMOptionsUsernameFont           // UIFont, the username's text font
AMOptionsButtonFont             // UIFont, the button's text font
AMOptionsBubbleSwipeEnabled     // @(BOOL), enables the swipe detection on a cell
AMOptionsBubblePressEnabled     // @(BOOL), enables the long press detection on a cell
AMOptionsBubbleDetectionType    // @(int), the text detection type, refer to UIDataDetectorTypes. Defaults to UIDataDetectorTypeNone
```

Changelog 
==================

0.5
--------------------
- Added iOS7 compatibility. (Thanks to [Michael James](https://github.com/umjames))


TODO
--------------------
* Add further customizations

MIT License
--------------------
	Copyright (c) 2013 Andrea Mazzini. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
