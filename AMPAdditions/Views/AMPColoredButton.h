//
//  AMPColoredButton.m
//  AMPAdditions
//
//  Created by Alejandro Martínez on 25/10/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

/**
 *  AMPColoredButton allows to set a different background
 *  color for each UIButton state.
 */

#import <UIKit/UIKit.h>

@interface AMPColoredButton : UIButton

/**
 *  Background colors
 */
@property (nonatomic, strong) UIColor *backgroundNormalColor;
@property (nonatomic, strong) UIColor *backgroundHighlightedColor;
@property (nonatomic, strong) UIColor *backgroundSelectedColor;
@property (nonatomic, strong) UIColor *backgroundDisabledColor;

/**
 *  Border colors
 */
@property (nonatomic, strong) UIColor *borderNormalColor;
@property (nonatomic, strong) UIColor *borderHighlightedColor;
@property (nonatomic, strong) UIColor *borderSelectedColor;
@property (nonatomic, strong) UIColor *borderDisabledColor;

@end
