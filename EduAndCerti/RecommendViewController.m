//
//  RecommendViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 23..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "RecommendViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import <MediaPlayer/MediaPlayer.h>

@interface RecommendViewController (){
    NSArray *_movieList;
    MPMoviePlayerViewController *_movieController;
}

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"추천 영상";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://192.1.27.211/sample/video?videoType=jei" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        _movieList = [NSArray arrayWithArray:[responseObject objectForKey:@"body"]];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MPMoviePlayerPlaybackStateDidChange:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:nil];
}

- (void)MPMoviePlayerPlaybackStateDidChange:(NSNotification *)notification
{
    if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStatePlaying)
    { //playing
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateStopped)
    { //stopped
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStatePaused)
    { //paused
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateInterrupted)
    { //interrupted
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateSeekingForward)
    { //seeking forward
    }if (_movieController.moviePlayer.playbackState == MPMoviePlaybackStateSeekingBackward)
    { //seeking backward
    }
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_movieList count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecommendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.textLabel setText:[[_movieList objectAtIndex:indexPath.row] objectForKey:@"title"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *movieURL = [NSURL URLWithString:[[_movieList objectAtIndex:indexPath.row] objectForKey:@"videoUrl"]];
    _movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:_movieController];
    [_movieController.moviePlayer play];
}


@end
