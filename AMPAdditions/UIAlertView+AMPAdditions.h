//
//  UIAlertView+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 29/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewCompletionBlock)(NSUInteger indexButton);

@interface UIAlertView (AMPAdditions)

+ (UIAlertView *)showAlertWithTitle:(NSString *)title message:(NSString *)message completionBlock:(UIAlertViewCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (id)initWithTitle:(NSString *)title message:(NSString *)message completionBlock:(UIAlertViewCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
