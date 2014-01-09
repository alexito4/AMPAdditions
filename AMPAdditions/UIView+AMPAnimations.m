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

@end
