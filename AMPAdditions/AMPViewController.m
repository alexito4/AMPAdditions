//
//  AMPViewController.m
//  AMPViewController
//
//  Created by Alejandro Martinez on 26/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "AMPViewController.h"

//#import "AppDelegate.h"

@interface AMPViewController ()
{
    BOOL _shouldListenForKeyboardNotifications;
}

@end

@implementation AMPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        [self setUp];
    }
    
    return self;
}

- (id)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUp];
}

- (void)setUp
{
	// Empty default implementation
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_shouldListenForKeyboardNotifications) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowOrHideNotification:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowOrHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    // Pop
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [self viewWillPop];
    }
    
    [super viewWillDisappear:animated];
}

- (void)viewWillPop {
    // implement your code in a subclass
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Pop
    if (!self.navigationController) {
        [self viewDidPop];
    }
    
    if (_shouldListenForKeyboardNotifications) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}

- (void)viewDidPop {
    // implement your code in a subclass
}

#pragma mark - Adjusting the view for the keyboard

- (void)animateViewWithKeyboardUpDirection:(BOOL)up distance:(float)distance animationDuration:(NSTimeInterval)duration animationCurve:(UIViewAnimationCurve)curve
{
    const int movementDistance = distance;
    
	int movement = (up ? -movementDistance : movementDistance);
    
    [UIView animateWithDuration:duration delay:0.0 options:curve | UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.view setFrame:CGRectOffset(self.view.frame, 0, movement)];
    } completion:NULL];
}

- (void)registerForKeyboardNotifications
{
    _shouldListenForKeyboardNotifications = YES;
}

- (void)keyboardShowOrHideNotification:(NSNotification *)notification
{
    BOOL keyboardHidden = [notification.name isEqualToString:UIKeyboardWillHideNotification];
    NSDictionary *info = [notification userInfo];
    
    [self keyboardWillBecomeHidden:keyboardHidden withNotificationInfo:info];
}

- (void)defaultKeyboardAppereanceBehaviourForKeyboardHidden:(BOOL)keyboardHidden animationDuration:(NSTimeInterval)animationDuration curve:(UIViewAnimationCurve)curve keyboardHeight:(CGFloat)keyboardHeight
{
    [self animateViewWithKeyboardUpDirection:!keyboardHidden distance:keyboardHeight animationDuration:animationDuration animationCurve:curve];
}

- (void)viewWillAdjustForKeyboardHidden:(BOOL)keyboardHidden keyboardHeight:(CGFloat)keyboardHeight
{
    // Empty default implementation
}

- (void)keyboardWillBecomeHidden:(BOOL)keyboardHidden withAnimationDuration:(NSTimeInterval)animationDuration curve:(UIViewAnimationCurve)curve keyboardHeight:(CGFloat)_keyboardHeight
{
    curve |= UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView animateWithDuration:animationDuration delay:0.0 options:curve animations:^{
        CGFloat keyboardHeight = keyboardHidden ? 0.0 : _keyboardHeight;
        
        [self viewWillAdjustForKeyboardHidden:keyboardHidden keyboardHeight:keyboardHeight];
    } completion:NULL];
}

- (void)keyboardWillBecomeHidden:(BOOL)keyboardHidden withNotificationInfo:(NSDictionary *)notificationInfo
{
    UIViewAnimationCurve animationCurve; [[notificationInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    
    CGRect keyboardFrameAtEndOfAnimation; [[notificationInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrameAtEndOfAnimation];
    CGFloat keyboardHeight = keyboardFrameAtEndOfAnimation.size.height;
    
    NSTimeInterval animationDuration = [[notificationInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [self keyboardWillBecomeHidden:keyboardHidden withAnimationDuration:animationDuration curve:animationCurve keyboardHeight:keyboardHeight];
}

#pragma mark - Memory Management

- (void)dealloc
{
#if DEBUG
//	NSLog(@"[%@] dealloc:", NSStringFromClass([self class])); // Log each dealloc. Very useful for debugging.
#endif
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
