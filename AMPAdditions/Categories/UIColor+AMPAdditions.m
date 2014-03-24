//
//  UIColor+AMPAdditions.m
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIColor+AMPAdditions.h"

@implementation UIColor (AMPAdditions)

#pragma mark - Color creation

+ (UIColor *)randomColor
{
    CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWithHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue Alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)colorForHuePercentage:(CGFloat)percentage {
    return [self colorForHuePercentage:percentage betweenMin:0.0f andMax:360.0f];
}

+ (UIColor *)colorForHuePercentage:(CGFloat)percentage betweenMin:(CGFloat)min andMax:(CGFloat)max {
    CGFloat hue = min + ((max - min) * percentage / 100);
    UIColor *color = [UIColor colorWithHue:1.0 * hue / 360.0
                                saturation:1.0
                                brightness:1.0
                                     alpha:1.0];
    return color;
}

#pragma mark - Color manipulation



- (UIColor *)lighterColor
{
    float h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:MIN(b * 1.2, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColor
{
    float h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.75
                               alpha:a];
    return nil;
}

@end
