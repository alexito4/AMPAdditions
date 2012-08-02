//
//  UIColor+AMPAdditions.h
//  uikitadditions
//
//  Created by Alejandro Martinez on 02/08/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AMPAdditions)

+ (UIColor *)randomColor;
+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue Alpha:(CGFloat)alpha;

@end
