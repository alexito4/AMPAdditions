//
//  UIActionSheet+AMPAdditions.h
//  walipa
//
//  Created by Alejandro Martinez on 02/10/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIActionSheetCompletionBlock)(NSUInteger indexButton);

@interface UIActionSheet (AMPAdditions)

/*+ (UIActionSheet *)showActionSheetWithTitle:(NSString *)title completionBlock:(UIActionSheetCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;*/

- (id)initWithTitle:(NSString *)title completionBlock:(UIActionSheetCompletionBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
