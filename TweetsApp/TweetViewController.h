//
//  ViewController.h
//  TweetsApp
//
//  Created by Jijeshm on 19/04/13.
//  Copyright (c) 2013 Jijesh Mohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (readwrite, retain) NSDictionary* tweet;
@end
