//
//  UIAlertView+AMPAdditions.m
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 13/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import "UIAlertView+AMPAdditions.h"

@implementation UIAlertView (AMPAdditions)

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancel {
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil] show];
}

@end
