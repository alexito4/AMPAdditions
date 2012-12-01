//
//  UIAlertView+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 29/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIAlertView+AMPAdditions.h"
#import <objc/runtime.h>

@implementation UIAlertView (AMPAdditions)

+ (UIAlertView *)showAlertWithTitle:(NSString *)title message:(NSString *)message completionBlock:(UIAlertViewCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message completionBlock:block cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    va_list _arguments;
    va_start(_arguments, otherButtonTitles);
    for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
        [alert addButtonWithTitle:key];
    }
    va_end(_arguments);
    
    [alert show];
    
    return alert;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message completionBlock:(UIAlertViewCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
	if (self) {
        
        objc_setAssociatedObject(self, "alertCompletionBlock", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
		va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
	}
	return self;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIAlertViewCompletionBlock  blockCallback = objc_getAssociatedObject(self, "alertCompletionBlock");
    blockCallback(buttonIndex);
}

@end
