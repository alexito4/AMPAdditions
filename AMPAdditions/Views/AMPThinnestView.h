//
//  AMPThinnestView.h
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 17/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPThinnestView : UIView

+ (AMPThinnestView *)horizontalAtBottomOfView:(UIView *)view withColor:(UIColor *)color;

+ (AMPThinnestView *)horizontalView:(CGFloat)width atY:(CGFloat)y withColor:(UIColor *)color;

@end
