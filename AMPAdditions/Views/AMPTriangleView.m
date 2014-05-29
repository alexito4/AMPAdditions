//
//  AMPTriangleView.m
//  AMPAdditions
//
//  Created by Alejandro Martinez on 01/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPTriangleView.h"

@implementation AMPTriangleView
@dynamic inset, shouldFill, strokeWidth;

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
    [self setOpaque:NO];
    [self setContentMode:UIViewContentModeRedraw];
    _direction = [self defaultDirection];
}

- (AMPTriangleDirection)defaultDirection {
    return AMPTriangleDirectionTop;
}

- (CGFloat)inset {
    return 0.0f;
}

-(BOOL)shouldStroke {
    return self.strokeWidth > 0.0f;
}

- (BOOL)shouldFill {
    return YES;
}

- (CGFloat)strokeWidth {
    return 0.0f;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    
    CGFloat inset = [self inset];
    
    CGFloat minX = CGRectGetMinX(rect) + inset;
    CGFloat midX = CGRectGetMidX(rect);
    CGFloat maxX = CGRectGetMaxX(rect) - inset;
    
    CGFloat minY = CGRectGetMinY(rect) + inset;
    CGFloat midY = CGRectGetMidY(rect);
    CGFloat maxY = CGRectGetMaxY(rect) - inset;
    
    switch (self.direction) {
        case AMPTriangleDirectionTop:
            CGContextMoveToPoint(ctx, minX, maxY);
            CGContextAddLineToPoint(ctx, midX, minY);
            CGContextAddLineToPoint(ctx, maxX, maxY);
            break;
        case AMPTriangleDirectionBottom:
            CGContextMoveToPoint(ctx, minX, minY);
            CGContextAddLineToPoint(ctx, midX, maxY);
            CGContextAddLineToPoint(ctx, maxX, minY);
            break;
        case AMPTriangleDirectionLeft:
            CGContextMoveToPoint(ctx, maxX, minY);
            CGContextAddLineToPoint(ctx, minX, midY);
            CGContextAddLineToPoint(ctx, maxX, maxY);
            break;
        case AMPTriangleDirectionRight:
            CGContextMoveToPoint(ctx, minX, minY);
            CGContextAddLineToPoint(ctx, maxX, midY);
            CGContextAddLineToPoint(ctx, minX, maxY);
            break;
        default:
            break;
    }
    
    if ([self shouldStroke]) {
        CGContextSetLineWidth(ctx, self.strokeWidth);
        [self.tintColor setStroke];
        CGContextStrokePath(ctx);
    }
    
//    CGContextClosePath(ctx);
    
    if ([self shouldFill]) {
        [self.tintColor setFill];
        CGContextFillPath(ctx);
    }
}

- (void)tintColorDidChange {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
//    transition.duration = 0.4;
    [self.layer addAnimation:transition forKey:nil];
    
    [self setNeedsDisplay];
}

- (void)setDirection:(AMPTriangleDirection)direction {
    _direction = direction;
    [self setNeedsDisplay];
}

@end
