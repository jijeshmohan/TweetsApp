//
//  TweetListController.m
//  TweetsApp
//
//  Created by Jijeshm on 19/04/13.
//  Copyright (c) 2013 Jijesh Mohan. All rights reserved.
//

#import "TweetListController.h"
#import "TweetViewController.h"

@interface TweetListController ()

@end

@implementation TweetListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSError *e = nil;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tweets" ofType:@"json"];
    
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSData *jsonData = [myJSON dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&e];
    
    _tweets  = [jsonObject valueForKey:@"results"];
    NSLog(@"Reached here");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Tweeets Count %d",_tweets.count);
    return _tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    cell.textLabel.text = [_tweets[indexPath.row] valueForKey:@"text"];
    cell.detailTextLabel.text=[_tweets[indexPath.row] valueForKey:@"from_user_name"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [ self.tableView indexPathForCell:sender];

    TweetViewController *vc = [segue destinationViewController];
    vc.tweet=_tweets[indexPath.row];
}

@end
