//
//  CustomNavigationBar.m
//  EduAndCerti
//
//  Created by SangChan on 2015. 5. 15..
//  Copyright (c) 2015년 sangchan. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize navigationBarSize = [super sizeThatFits:size];
    
    // Pad the base navigation bar height by the fitting height of our button.
    CGSize segmentControllerSize = [self.segmentController sizeThatFits:CGSizeMake(size.width, size.height)];
    navigationBarSize.height += segmentControllerSize.height;
    
    return navigationBarSize;
}

- (void)layoutSubviews
{
    // UINavigationBar positions its elements along the bottom edge of the
    // bar's bounds.  This allows our subclass to position our custom elements
    // at the top of the navigation bar, in the extra space we created by
    // padding the height returned from -sizeThatFits:
    [super layoutSubviews];
    
    // NOTE: You do not need to account for the status bar height in your
    //       layout.  The navigation bar is positioned just below the
    //       status bar by the navigation controller.
    
    // Retrieve the button's fitting height and position the button along the
    // top edge of the navigation bar.  The button is sized to the full
    // width of the navigation bar as it will automatically center its contents.    
    CGSize segmentControllerSize = [self.segmentController sizeThatFits:CGSizeMake(self.bounds.size.width, 0)];
    self.segmentController.frame = CGRectMake(10, self.bounds.size.height - segmentControllerSize.height - 5, self.bounds.size.width-20, segmentControllerSize.height-5);
    
    [self setTitleVerticalPositionAdjustment:-segmentControllerSize.height forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearanceWhenContainedIn:[CustomNavigationBar class], nil] setBackgroundVerticalPositionAdjustment:-segmentControllerSize.height forBarMetrics:UIBarMetricsDefault];
}


- (void)setSegmentController:(UISegmentedControl *)segmentController
{
    // Remove the previous button
    [_segmentController removeFromSuperview];
    
    _segmentController = segmentController;
    
    [self addSubview:segmentController];
    
    // Force our -sizeThatFits: method to be called again and flag the
    // navigation bar as needing layout.
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}


@end
