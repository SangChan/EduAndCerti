//
//  RecommendViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 23..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "RecommendViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "DetailViewController.h"
#import "CustomNavigationBar.h"

@interface RecommendViewController (){
    NSArray *_movieList;
}

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://192.1.27.211/sample/video?videoType=jei" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        _movieList = [NSArray arrayWithArray:[responseObject objectForKey:@"body"]];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];*/
    // Do any additional setup after loading the view.
    UISegmentedControl *segmentController = [[UISegmentedControl alloc]initWithItems:@[@"읽지 않은 추천자료",@"읽은 추천자료"]];
    [(CustomNavigationBar*)self.navigationController.navigationBar setSegmentController:segmentController];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:10];
    [imageView setImage:[UIImage imageNamed:@"video_preview_100_56.png"]];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:11];
    [titleLabel setText:[[_movieList objectAtIndex:indexPath.row] objectForKey:@"title"]];
    UILabel *descLabel = (UILabel *)[cell viewWithTag:12];
    [descLabel setText:[[_movieList objectAtIndex:indexPath.row] objectForKey:@"desc"]];
    return cell;
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *movieURL = [NSURL URLWithString:[[_movieList objectAtIndex:indexPath.row] objectForKey:@"videoUrl"]];
    _movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:_movieController];
    [_movieController.moviePlayer play];
}*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetailForRecommend"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = [segue destinationViewController];
        [controller setDetailData:[_movieList objectAtIndex:indexPath.row]];
    }
}


@end
