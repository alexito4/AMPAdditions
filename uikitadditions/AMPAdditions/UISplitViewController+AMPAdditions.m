//
//  UISplitViewController+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 26/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UISplitViewController+AMPAdditions.h"

@implementation UISplitViewController (AMPAdditions)

- (UIViewController *)masterViewController {
    return (self.viewControllers)[0];
}

- (UIViewController *)detailViewController {
    return (self.viewControllers)[1];
}

@end
