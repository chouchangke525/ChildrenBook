//
//  RootViewController.h
//  ChildrenBook
//
//  Created by Yu Yichen on 4/7/13.
//  Copyright (c) 2013 Yu Yichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
