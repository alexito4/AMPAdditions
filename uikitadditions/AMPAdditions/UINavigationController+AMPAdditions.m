//
//  UINavigationController+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 26/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UINavigationController+AMPAdditions.h"

@implementation UINavigationController (AMPAdditions)

- (UIViewController *)rootViewController {
    return [self viewControllers][0];
}

@end
