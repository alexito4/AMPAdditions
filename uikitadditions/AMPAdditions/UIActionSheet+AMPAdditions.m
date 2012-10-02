//
//  UIActionSheet+AMPAdditions.m
//  walipa
//
//  Created by Alejandro Martinez on 02/10/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIActionSheet+AMPAdditions.h"

@implementation UIActionSheet (AMPAdditions)
/*
+ (UIActionSheet *)showActionSheetWithTitle:(NSString *)title completionBlock:(UIActionSheetCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title completionBlock:block cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    
    va_list _arguments;
    va_start(_arguments, otherButtonTitles);
    for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
        [actionSheet addButtonWithTitle:key];
    }
    va_end(_arguments);
    
    [actionSheet sh];
    
    return actionSheet;
}*/

- (id)initWithTitle:(NSString *)title completionBlock:(UIActionSheetCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    self = [self initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles: nil];
	if (self) {
        
        objc_setAssociatedObject(self, "actionSheetCompletionBlock", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
		va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
	}
	return self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIActionSheetCompletionBlock blockCallback = objc_getAssociatedObject(self, "actionSheetCompletionBlock");
    blockCallback(buttonIndex);
}

@end
