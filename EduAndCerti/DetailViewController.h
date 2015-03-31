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
@property (weak, nonatomic) IBOutlet UIImageView *thumImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end
