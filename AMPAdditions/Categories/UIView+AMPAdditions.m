//
//  UIView+Additions.m
//  UIKit Additions
//
//  Created by Alejandro Martínez on 19/03/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import "UIView+AMPAdditions.h"

@implementation CAGradientLayer (AMPAdditionsGradient)

+ (CAGradientLayer *)gradientWithTopColor:(UIColor *)top bottomColor:(UIColor *)bottom {
    NSArray *colors = [NSArray arrayWithObjects:(id)top.CGColor, bottom.CGColor, nil];
    
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = colors;
    gradient.locations = locations;
    
    return gradient;
}

@end

@implementation UIView (AMPAdditions)

- (void)removeAllSubviews {
    for (UIView *subview in [self subviews]) {
        [subview removeFromSuperview];
    }
}

- (UIView *)viewWithClass:(Class)aClass {
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:aClass]) {
            return v;
        } else {
            UIView *r = [v viewWithClass:aClass];
            if (r) {
                return r;
            }
        }
    }
    return nil;
}

- (BOOL)touch:(UITouch *)touch insideSubview:(UIView *)subview {
    CGPoint location = [touch locationInView:self];
    return [subview pointInside:[subview convertPoint:location fromView:self] withEvent:nil];
}

- (void)makeCircle {
    self.layer.cornerRadius = roundf(self.frame.size.width/2.0);
    self.layer.masksToBounds = YES;
}

#pragma mark - Gradients

- (void)setBackgroundGradient:(CAGradientLayer *)gradient {
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)setBackgroundGradientWithTopColor:(UIColor *)top bottomColor:(UIColor *)bottom {
    CAGradientLayer *gradient = [CAGradientLayer gradientWithTopColor:top bottomColor:bottom];
    gradient.frame = self.bounds;
    [self setBackgroundGradient:gradient];
}

#pragma mark - Frame manipulation

- (CGPoint)position
{
	return self.frame.origin;
}

- (void)setPosition:(CGPoint)position
{
	CGRect rect = self.frame;
	rect.origin = position;
	[self setFrame:rect];
}

- (CGFloat)x
{
	return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
	CGRect rect = self.frame;
	rect.origin.x = x;
	[self setFrame:rect];
}

- (CGFloat)y
{
	return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
	CGRect rect = self.frame;
	rect.origin.y = y;
	[self setFrame:rect];
}

- (CGFloat)left
{
    return  self.x;
}

- (void)setLeft:(CGFloat)left
{
    [self setX:left];
}

- (CGFloat)right {
	return self.x + self.width;
}

- (void)setRight:(CGFloat)right
{
	CGFloat x = right - self.width;
    [self setX:x];
}

- (CGFloat)top
{
    return self.y;
}

- (void)setTop:(CGFloat)top
{
    [self setY:top];
}

- (CGFloat)bottom {
    return self.y + self.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGFloat y = bottom - self.height;
    [self setY:y];
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    [self setCenter:center];
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    [self setCenter:center];
}

- (CGFloat)midX {
    return CGRectGetMidX(self.bounds);
}

- (CGFloat)midY {
    return CGRectGetMidY(self.bounds);
}

- (CGSize)size
{
	return self.frame.size;
}

- (void)setSize:(CGSize)size
{
	CGRect rect = self.frame;
	rect.size = size;
	[self setFrame:rect];
}

- (CGFloat)width
{
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
	CGRect rect = self.frame;
	rect.size.width = width;
	[self setFrame:rect];
}

- (CGFloat)height
{
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
	CGRect rect = self.frame;
	rect.size.height = height;
	[self setFrame:rect];
}

@end
