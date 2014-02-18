//
//  UIAlertView+AMPAdditions.m
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 13/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import <objc/runtime.h>
#import "UIAlertView+AMPAdditions.h"

static const void *kAMPAlertViewCompletionBlock = @"kAMPAlertViewCompletionBlock";

@implementation UIAlertView (AMPAdditions)

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancel {
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil] show];
}

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelTitle
             otherButtonTitles:(NSArray *)otherTitles
               completionBlock:(AMPAlertViewCompletionBlock)completionBlock {

    UIAlertView *alertView = [[self alloc] initWithTitle:title
                                                 message:message
                                                delegate:nil
                                       cancelButtonTitle:cancelTitle
                                       otherButtonTitles:[otherTitles firstObject], nil];

    if (otherTitles.count > 1) {
        for (NSString *buttonTitle in [otherTitles subarrayWithRange:NSMakeRange(1, otherTitles.count - 1)]) {
            [alertView addButtonWithTitle:buttonTitle];
        }
    }

    if (completionBlock) {
        [alertView setCompletionBlock:completionBlock];
    }

    [alertView show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    AMPAlertViewCompletionBlock completion = alertView.completionBlock;

    if (completion) {
        completion(alertView, buttonIndex);
    }
}

#pragma mark - Properties

- (AMPAlertViewCompletionBlock)completionBlock {
    return objc_getAssociatedObject(self, kAMPAlertViewCompletionBlock);
}

- (void)setCompletionBlock:(AMPAlertViewCompletionBlock)completionBlock {
    self.delegate = self;
    
    objc_setAssociatedObject(self, kAMPAlertViewCompletionBlock, completionBlock, OBJC_ASSOCIATION_COPY);
}

@end
