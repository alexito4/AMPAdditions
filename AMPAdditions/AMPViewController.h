//
//  AMPViewController.h
//  AMPViewController
//
//  Created by Alejandro Martinez on 26/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPViewController : UIViewController

// Called when the UIViewController will pop from the UINavigationViewController
- (void)viewWillPop;

- (void)viewDidPop;

#pragma mark - Keyboard Management. Implement the needed
/* View resizing auto management with keyboard notifications */
- (void)registerForKeyboardNotifications; // You should call this in -setUp

- (void)animateViewWithKeyboardUpDirection:(BOOL)up distance:(float)distance animationDuration:(NSTimeInterval)duration animationCurve:(UIViewAnimationCurve)curve;
- (void)defaultKeyboardAppereanceBehaviourForKeyboardHidden:(BOOL)keyboardHidden animationDuration:(NSTimeInterval)animationDuration curve:(UIViewAnimationCurve)curve keyboardHeight:(CGFloat)keyboardHeight;

/* This will be called inside the animation block to allow you to make other changes to the view when the keyboard is being shown / dismissed */
- (void)viewWillAdjustForKeyboardHidden:(BOOL)keyboardHidden keyboardHeight:(CGFloat)keyboardHeight;

/* Overwrite this method to implement custom behaviour. Call defaultKeyboardAppereanceBehaviourForKeyboardHidden:animationDuration:curve:keyboardHeight: for inside for a default behaviour (moving up the whole view keyboardHeight pixels) */
- (void)keyboardWillBecomeHidden:(BOOL)keyboardHidden withAnimationDuration:(NSTimeInterval)animationDuration curve:(UIViewAnimationCurve)curve keyboardHeight:(CGFloat)keyboardHeight;

@end
