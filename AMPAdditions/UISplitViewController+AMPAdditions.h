//
//  UISplitViewController+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 26/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISplitViewController (AMPAdditions)

/**
 * Returns view controllar at index 0. (left view controller)
 */
- (UIViewController *)masterViewController;

/**
 * Returns view controllar at index 1. (right view controller)
 */
- (UIViewController *)detailViewController;

@end
