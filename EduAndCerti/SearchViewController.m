//
//  SearchViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 5. 14..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () {
    NSArray *bestKeywordArray;
}
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation SearchViewController

@synthesize searchDisplayController, searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.searchDisplayController setDisplaysSearchBarInNavigationBar:YES];
    
    bestKeywordArray = @[@"교재분류표",@"과학",@"쿠키북RP",@"스스로펜",@"수학",@"학교공부",@"해답모음집",@"간담회",@"사회",@"학교공부점검하기"];
    [self.tableView reloadData];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return bestKeywordArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KeywordCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [bestKeywordArray objectAtIndex:indexPath.row];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
