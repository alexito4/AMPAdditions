//
//  AMPTriangleView.m
//  AMPAdditions
//
//  Created by Alejandro Martinez on 01/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPTriangleView.h"

@implementation AMPTriangleView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _direction = AMPTriangleViewDirectionsTop;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    
    switch (self.direction) {
        case AMPTriangleViewDirectionsTop:
            CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
            break;
        case AMPTriangleViewDirectionsBottom:
            CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));
            break;
        case AMPTriangleViewDirectionsLeft:
            CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMidY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));
            break;
        case AMPTriangleViewDirectionsRight:
            CGContextMoveToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMidY(rect));
            CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
            break;
        default:
            break;
    }
    
    CGContextClosePath(ctx);
    
    [self.tintColor setFill];
    CGContextFillPath(ctx);
}

- (void)tintColorDidChange {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
//    transition.duration = 0.4;
    [self.layer addAnimation:transition forKey:nil];
    
    [self setNeedsDisplay];
}

- (void)setDirection:(AMPTriangleViewDirections)direction {
    _direction = direction;
    [self setNeedsDisplay];
}

@end
