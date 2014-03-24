//
//  UIView+AMPBorders.h
//  UIKit Additions
//
//  Created by Alejandro Martínez on 19/03/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/**
 *  UIView category to add one sided borders.
 *
 *  For now the API just allow you to set the color.
 *
 *  Defaults (for now you can't change this):
 *  - Border width: 1
 *  - Border inset: 0
 *  - Uses pt (vs. px) useThinBorders = true
 *
 *  Inspired by the borders part of
 *      https://github.com/soffes/SAMGradientView
 */
@interface UIView (AMPBorders)

- (void)setTopBorderColor:(UIColor *)color;
- (void)setBottomBorderColor:(UIColor *)color;
- (void)setLeftBorderColor:(UIColor *)color;
- (void)setRightBorderColor:(UIColor *)color;

@end
