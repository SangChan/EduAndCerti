//
//  RecentViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 23..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "RecentViewController.h"
#import "DetailViewController.h"

@interface RecentViewController () {
    NSArray *_movieList;
}

@end

@implementation RecentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"recentList"]) {
        _movieList = [defaults objectForKey:@"recentList"];
        [self.tableView reloadData];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"recentList"]) {
        _movieList = [defaults objectForKey:@"recentList"];
        [self.tableView reloadData];
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
    static NSString *CellIdentifier = @"RecentCell";
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetailForRecent"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = [segue destinationViewController];
        [controller setDetailData:[_movieList objectAtIndex:indexPath.row]];
    }
}

@end
