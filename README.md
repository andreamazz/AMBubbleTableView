AMBubbleTableViewController
==================

Simple implementation of a UITableView styled as with chat bubbles. It's strongly based on Jesse Squires'  [MessagesTableViewController](https://github.com/jessesquires/MessagesTableViewController), since I needed to deeply customize the view, I decided to spawn a new library.  

Screenshot
--------------------
![SlideOutNavigation](http://www.eflatgames.com/github/AMBubbleTableView.png)

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
```

Options Dictionary
--------------------
The AMBubbleTableViewController configuration can be handled by passing an NSDictionary to it. The default values can be found in  AMBubbleGlobals.m. Here's a brief description of the possible options:

```objc
AMOptionsTableStyle             // @(AMBubbleTableCellStyle), Sets the table style. Defaults to AMBubbleTableCellDefault
AMOptionsTimestampEachMessage   // @(BOOL), Enables the timestamp for each message. Defaults to YES
AMOptionsTimestampShortFont     // UIFont, Sets the short timestamp font. 
AMOptionsTimestampFont          // UIFont, Sets the full timestamp font.
AMOptionsAvatarSize             // @(float), The avatar size. Defaults to 50.
AMOptionsAccessorySize          // @(float), The accssory view size (used to compute the minimum cell height). Defaults to 50
AMOptionsAccessoryMargin        // @(float), The accessory view margin. Defaults to 5.
AMOptionsTimestampHeight        // @(float), the height of the timestamp row. Defaults to 40.
```

MIT License
--------------------
	Copyright (c) 2012 Andrea Mazzini. All rights reserved.

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