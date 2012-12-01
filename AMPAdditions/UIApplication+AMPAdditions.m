//
//  UIApplication+AMPAdditions.m
//  walipa
//
//  Created by Alejandro Martinez on 30/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIApplication+AMPAdditions.h"
#import "AppDelegate.h"

@implementation UIApplication (AMPAdditions)

//+ (id<UIApplicationDelegate>)sharedInstance {
//    return (id<UIApplicationDelegate>)[[UIApplication sharedApplication] delegate];
//}

+ (void)startActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)stopActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
