//
//  UIAlertView+AMPAdditions.m
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 13/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AMPAlertViewCompletionBlock) (UIAlertView *alertView, NSInteger buttonIndex);

@interface UIAlertView (AMPAdditions)

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancel;

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             cancelButtonTitle:(NSString *)cancelTitle
             otherButtonTitles:(NSArray *)otherTitles
               completionBlock:(AMPAlertViewCompletionBlock)completionBlock;

@property (copy, nonatomic) AMPAlertViewCompletionBlock completionBlock;

@end
