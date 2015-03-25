//
//  DetailViewController.h
//  EduAndCerti
//
//  Created by SangChan on 2015. 3. 25..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSDictionary *detailData;
@property (strong, nonatomic) IBOutlet UIImageView *thumImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;

@end
