//
//  DetailViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 25..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "DetailViewController.h"
#import "UIButton+Custom.h"
#import <MediaPlayer/MediaPlayer.h>

@interface DetailViewController () {
    MPMoviePlayerViewController *_movieController;
    NSMutableArray *recentList;
    NSTimeInterval currentPlayback;
}

- (IBAction)playButtonPressed:(id)sender;

@end

@implementation DetailViewController

@synthesize detailData;
@synthesize thumImageView, titleLabel, descLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self playButton]defaultStyle];
    
    self.title = [detailData objectForKey:@"title"];
    [self.thumImageView setImage:[UIImage imageNamed:@"video_preview_704_396.png"]];
    [self.titleLabel setText:[detailData objectForKey:@"title"]];
    [self.descLabel setText:[detailData objectForKey:@"desc"]];
    currentPlayback = 0.0;
    if ([detailData objectForKey:@"initialTime"]) {
        currentPlayback = [[detailData objectForKey:@"initialTime"] doubleValue];
    }
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MPMoviePlayerPlaybackStateDidChange:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:nil];
    
    [self saveDetailDataToRecentList];
}

- (void)saveDetailDataToRecentList
{
    NSString *movieId = [detailData objectForKey:@"id"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    recentList = [NSMutableArray arrayWithArray:[defaults objectForKey:@"recentList"]];
    int i = 0;
    for (NSDictionary *movieData in recentList) {
        if ([movieId isEqualToString:[movieData objectForKey:@"id"]]) {
            currentPlayback = [[movieData objectForKey:@"initialTime"] doubleValue];
            [recentList removeObjectAtIndex:i];
            break;
        }
        i++;
    }
    [recentList addObject:[self makeDetailaDataForSaving]];
    [defaults setObject:recentList forKey:@"recentList"];
}

- (NSDictionary *)makeDetailaDataForSaving
{
    NSDictionary *movieData = [NSDictionary dictionaryWithObjectsAndKeys:
                               [detailData objectForKey:@"id"],@"id",
                               [detailData objectForKey:@"title"],@"title",
                               [detailData objectForKey:@"desc"],@"desc",
                               [detailData objectForKey:@"videoUrl"],@"videoUrl",
                               [NSString stringWithFormat:@"%f",currentPlayback],@"initialTime",
                               nil];
    return movieData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playButtonPressed:(id)sender {
    NSURL *movieURL = [NSURL URLWithString:[detailData objectForKey:@"videoUrl"]];
    _movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:_movieController];
    [_movieController.moviePlayer play];
    if (currentPlayback > 0.0) {
        [_movieController.moviePlayer setInitialPlaybackTime:currentPlayback];
    }
}

- (void)MPMoviePlayerPlaybackStateDidChange:(NSNotification *)notification
{
    currentPlayback = _movieController.moviePlayer.currentPlaybackTime;
    if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStatePlaying)
    { //playing
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateStopped)
    { //stopped
        //_movieController.moviePlayer.currentPlaybackTime
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [recentList removeLastObject];
        [recentList addObject:[self makeDetailaDataForSaving]];
        [defaults setObject:recentList forKey:@"recentList"];
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStatePaused)
    { //paused
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [recentList removeLastObject];
        [recentList addObject:[self makeDetailaDataForSaving]];
        [defaults setObject:recentList forKey:@"recentList"];
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateInterrupted)
    { //interrupted
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateSeekingForward)
    { //seeking forward
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateSeekingBackward)
    { //seeking backward
    }

}
@end
