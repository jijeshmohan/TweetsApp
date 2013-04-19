//
//  TweetListController.h
//  TweetsApp
//
//  Created by Jijeshm on 19/04/13.
//  Copyright (c) 2013 Jijesh Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetListController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property(readwrite) NSMutableArray *tweets;

@end
