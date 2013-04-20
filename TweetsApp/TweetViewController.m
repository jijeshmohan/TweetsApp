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
    
    NSString *imageUrl = [NSString stringWithFormat:@"https://api.twitter.com/1/users/profile_image?screen_name=%@",[_tweet valueForKey:@"from_user"]];
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("downloader",NULL);

    [self.indicator startAnimating];
    dispatch_async(downloadQueue, ^{
        NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        NSLog(@"Image Downloaded");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image=[UIImage imageWithData:imageData];
            self.userImage.image=image;
            [self.indicator stopAnimating];
  
        });
        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
