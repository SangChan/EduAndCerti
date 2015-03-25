//
//  DetailViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 25..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "DetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface DetailViewController () {
    MPMoviePlayerViewController *_movieController;
}
- (IBAction)playButtonPressed:(id)sender;

@end

@implementation DetailViewController

@synthesize detailData;
@synthesize thumImageView, titleLabel, descLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [detailData objectForKey:@"title"];
    [self.thumImageView setImage:[UIImage imageNamed:@"video_preview_704_396.png"]];
    [self.titleLabel setText:[detailData objectForKey:@"title"]];
    [self.descLabel setText:[detailData objectForKey:@"desc"]];
    // Do any additional setup after loading the view.
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(MPMoviePlayerPlaybackStateDidChange:)
    //                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
    //                                               object:nil];

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
}

//- (void)MPMoviePlayerPlaybackStateDidChange:(NSNotification *)notification
//{
//    if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStatePlaying)
//    { //playing
//    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateStopped)
//    { //stopped
//    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStatePaused)
//    { //paused
//    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateInterrupted)
//    { //interrupted
//    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateSeekingForward)
//    { //seeking forward
//    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateSeekingBackward)
//    { //seeking backward
//    }
//
//}
@end
