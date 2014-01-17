//
//  UIView+AMPAnimations.h
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 09/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AMPAnimations)

// Performs a quick shake
- (void)AMP_shake;

- (void)AMP_spinAtInfinitum;
- (void)AMP_spinAtInfinitumWithDuration:(CGFloat)duration;
- (void)AMP_spinWithDuration:(CGFloat)duration numberOfRotations:(CGFloat)rotations andRepetitions:(CGFloat)repeatitions;
- (void)AMP_stopSpinning;
@end
