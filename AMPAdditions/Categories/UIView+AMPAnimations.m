//
//  UIView+AMPAnimations.m
//  AMPAdditions Example
//
//  Created by Alejandro Martinez on 09/01/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

#import "UIView+AMPAnimations.h"

@implementation UIView (AMPAnimations)

- (void)AMP_shake {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.6];
    
    NSInteger shakes = 6;
    CGFloat offset = 40.0;
    CGFloat reductionRate = 0.85;
    
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:20];
    NSInteger tempShakes = shakes;
    while (offset > 0.01 && tempShakes > 0) {
        
        [keys addObject:[NSValue valueWithCGPoint:CGPointMake(self.center.x - offset, self.center.y)]];
        offset *= reductionRate;
        
        [keys addObject:[NSValue valueWithCGPoint:CGPointMake(self.center.x + offset, self.center.y)]];
        offset *= reductionRate;
        
        tempShakes--;
    }
    
    animation.values = keys;
    
    [self.layer addAnimation:animation forKey:@"position"];
}

- (void)AMP_spinAtInfinitum {
    [self AMP_spinAtInfinitumWithDuration:1];
}

- (void)AMP_spinAtInfinitumWithDuration:(CGFloat)duration {
    [self AMP_spinWithDuration:duration numberOfRotations:1 andRepetitions:HUGE_VALF];
}

- (void)AMP_spinWithDuration:(CGFloat)duration numberOfRotations:(CGFloat)rotations andRepetitions:(CGFloat)repeatitions  {
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeatitions;
    
    [self.layer addAnimation:rotationAnimation forKey:@"spin"];
}

- (void)AMP_stopSpinning {
    CABasicAnimation *animation = [[self.layer animationForKey:@"spin"] copy];
    animation.fromValue = [self.layer.presentationLayer valueForKeyPath:@"transform.rotation.z"];
    animation.repeatCount = 0;
    animation.duration = 0.45f;
    animation.removedOnCompletion = YES;
    [self.layer addAnimation:animation forKey:@"spin"];
//    [self.layer removeAnimationForKey:@"spin"];
}

@end
