//
//  UIApplication+AMPAdditions.m
//
//
//  Created by Alejandro Martinez on 30/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIApplication+AMPAdditions.h"

@implementation UIApplication (AMPAdditions)

+ (void)startActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)stopActivityIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
