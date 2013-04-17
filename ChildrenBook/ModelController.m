//
//  ModelController.m
//  ChildrenBook
//
//  Created by Yu Yichen on 4/7/13.
//  Copyright (c) 2013 Yu Yichen. All rights reserved.
//

#import "ModelController.h"

#import "DataViewController.h"



/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController
@synthesize pageData;

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        pageData = [dateFormatter monthSymbols];
        
        pageData=[[NSArray alloc]initWithObjects:@"I",@"II",@"III",@"IV",@"V",@"VI", nil];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    
  
    DataViewController *dataViewController;
    if (index==0)
      dataViewController= [storyboard instantiateViewControllerWithIdentifier:@"DataViewController1"];
    else if(index==1)
      dataViewController= [storyboard instantiateViewControllerWithIdentifier:@"DataViewController2"];
    else if(index==2)
    dataViewController=[[DataViewController alloc]initWithNibName:@"NibFileForPage3" bundle:nil];
    
    else if(index==3)
        dataViewController= [storyboard instantiateViewControllerWithIdentifier:@"DataViewController4"];
    else if(index==4)
        dataViewController=[[DataViewController alloc]initWithNibName:@"NibFileForPage5" bundle:nil];
        
    else if(index==5)
        dataViewController= [storyboard instantiateViewControllerWithIdentifier:@"DataViewController6"];
    
    dataViewController.dataObject = self.pageData[index];
        return dataViewController;
    
    
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
        
    
    index--;
    NSUserDefaults  *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setInteger:index forKey:@"start"];
    return [self viewControllerAtIndex:index storyboard:[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil]];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    
    NSUserDefaults  *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setInteger:index forKey:@"start"];
    return [self viewControllerAtIndex:index storyboard:[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil]];
}

@end
