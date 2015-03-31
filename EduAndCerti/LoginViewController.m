//
//  LoginViewController.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 24..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "LoginViewController.h"
#import "UIButton+Custom.h"

@interface LoginViewController ()
- (IBAction)guestLoginPressed:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.guestLoginButton defaultStyle];
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

- (IBAction)guestLoginPressed:(id)sender {
    //LoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
