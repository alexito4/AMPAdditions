//
//  UIView+AMPBorders.m
//  UIKit Additions
//
//  Created by Alejandro Martínez on 19/03/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import "UIView+AMPBorders.h"
#import <objc/runtime.h>

static const float BORDER_WIDTH = 1.0f;

@implementation UIView (AMPBorders)

#pragma mark - Public API

- (void)setTopBorderColor:(UIColor *)color {
    [self.amp_topBorderLayer setBackgroundColor:color.CGColor];
}

- (void)setBottomBorderColor:(UIColor *)color {
    [self.amp_bottomBorderLayer setBackgroundColor:color.CGColor];
}

- (void)setLeftBorderColor:(UIColor *)color {
    [self.amp_leftBorderLayer setBackgroundColor:color.CGColor];
}

- (void)setRightBorderColor:(UIColor *)color {
    [self.amp_rightBorderLayer setBackgroundColor:color.CGColor];
}

#pragma mark - Private
#pragma mark Custom properties

static const char * topBorderKey = "topBorderKey";

- (CALayer *)amp_topBorderLayer {
    CALayer *layer = objc_getAssociatedObject(self, topBorderKey);
    if(layer == nil) {
        layer = [CALayer layer];
        layer.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), BORDER_WIDTH);

        [self amp_setTopBorderLayer:layer];
        [self.layer addSublayer:layer];
    }
    return layer;
}

- (void)amp_setTopBorderLayer:(CALayer *)layer {
    objc_setAssociatedObject(self, topBorderKey, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char * bottomBorderKey = "bottomBorderKey";

- (CALayer *)amp_bottomBorderLayer {
    CALayer *layer = objc_getAssociatedObject(self, bottomBorderKey);
    if(layer == nil) {
        layer = [CALayer layer];
        layer.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds) - BORDER_WIDTH, self.frame.size.width, BORDER_WIDTH);

        [self amp_setBottomBorderLayer:layer];
        [self.layer addSublayer:layer];
    }
    return layer;
}

- (void)amp_setBottomBorderLayer:(CALayer *)layer {
    objc_setAssociatedObject(self, bottomBorderKey, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char * leftBorderKey = "leftBorderKey";

- (CALayer *)amp_leftBorderLayer {
    CALayer *layer = objc_getAssociatedObject(self, leftBorderKey);
    if(layer == nil) {
        layer = [CALayer layer];
        layer.frame = CGRectMake(0.0f, 0.0f, BORDER_WIDTH, CGRectGetHeight(self.bounds));

        [self amp_setLeftBorderLayer:layer];
        [self.layer addSublayer:layer];
    }    return layer;
}

- (void)amp_setLeftBorderLayer:(CALayer *)layer {
    objc_setAssociatedObject(self, leftBorderKey, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char * rightBorderKey = "rightBorderKey";

- (CALayer *)amp_rightBorderLayer {
    CALayer *layer = objc_getAssociatedObject(self, rightBorderKey);
    if(layer == nil) {
        layer = [CALayer layer];
        layer.frame = CGRectMake(CGRectGetWidth(self.frame) - BORDER_WIDTH, 0.0f, BORDER_WIDTH, CGRectGetHeight(self.frame));

        [self amp_setRightBorderLayer:layer];
        [self.layer addSublayer:layer];
    }    return layer;
}

- (void)amp_setRightBorderLayer:(CALayer *)layer {
    objc_setAssociatedObject(self, rightBorderKey, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
