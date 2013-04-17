//
//  ModelController.h
//  ChildrenBook
//
//  Created by Yu Yichen on 4/7/13.
//  Copyright (c) 2013 Yu Yichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
