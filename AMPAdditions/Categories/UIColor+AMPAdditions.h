//
//  UIColor+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AMPAdditions)

#pragma mark - Color creation

/**
 * Returns an UIColor with random RGB values.
 */
+ (UIColor *)randomColor;

/**
 * Returns an UIColor created from the Hexadecimal value.
 */
+ (UIColor *)colorWithHex:(UInt32)hex;

/**
 * Creates an UIColor with RGB. No need to /255.0!
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue Alpha:(CGFloat)alpha;

/**
 *  Creates an UIColor with the hue %.
 *
 *  @param percentage 0 - 100 % of HUE
 */
+ (UIColor *)colorForHuePercentage:(CGFloat)percentage;

/**
 *  Creates an UIColor with the hue % between min and max.
 *
 *  @param percentage 0 - 100 % of the HUE part defined by min and max.
 *  @param min        0 - 360. min HUE, equivalent to 0%
 *  @param max        0 - 360. max HUE, equiavlent to 100%
 */
+ (UIColor *)colorForHuePercentage:(CGFloat)percentage betweenMin:(CGFloat)min andMax:(CGFloat)max;

#pragma mark - Color manipulation

- (UIColor *)lighterColor;
- (UIColor *)darkerColor;



@end
