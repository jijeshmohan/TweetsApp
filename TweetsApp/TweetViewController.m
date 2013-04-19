//
//  ViewController.m
//  TweetsApp
//
//  Created by Jijeshm on 19/04/13.
//  Copyright (c) 2013 Jijesh Mohan. All rights reserved.
//

#import "TweetViewController.h"

@interface TweetViewController ()

@end

@implementation TweetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.userName.text=[_tweet valueForKey:@"from_user_name"];
    self.tweetText.text=[_tweet valueForKey:@"text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
