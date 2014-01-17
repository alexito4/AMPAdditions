//
//  AMPDisclousure.h
//
//  Created by Alejandro Martinez on 02/04/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPDisclousure.h"

@implementation AMPDisclousure

- (id)init {
    return [self initWithFrame:CGRectMake(0.0f, 0.0f, 6.0f, 15.0f)];
}

- (id)initWithFrame:(CGRect)frame
{
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
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    
    CGFloat inset = 1.0f;
    CGContextMoveToPoint(ctx, CGRectGetMinX(rect) + inset, CGRectGetMinY(rect) + inset);
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect) - inset, CGRectGetMidY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMinX(rect) + inset, CGRectGetMaxY(rect) - inset);
    
    CGContextSetLineWidth(ctx, 2.0f);
    
    [self.tintColor setStroke];
    CGContextStrokePath(ctx);
}

@end
