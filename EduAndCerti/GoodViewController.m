//
//  GoodViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 23..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "GoodViewController.h"
#import "AFHTTPRequestOperationManager.h"

@interface GoodViewController ()

@end

@implementation GoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"영감을 준 영상";
    // Do any additional setup after loading the view.
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://192.1.27.211/sample/video?videoType=default" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
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

@end
