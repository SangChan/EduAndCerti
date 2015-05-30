//
//  SettingViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 5. 14..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
- (IBAction)pressedClose:(id)sender;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (IBAction)pressedClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
