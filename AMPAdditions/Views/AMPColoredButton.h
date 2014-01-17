//
//  SColoredButton.m
//  AMPAdditions
//
//  Created by Alejandro Martínez on 25/10/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

/*
 The default UIButton doesn't allow you to set different background
 colors for different states.
 With this subclass you can set a background color for normal and
 highlighted state.
 
 Note: this class doesn't provide any default style as rounded corners.
 */

#import <UIKit/UIKit.h>

@interface AMPColoredButton : UIButton

@property (nonatomic, strong) UIColor *backgroundNormalColor;
@property (nonatomic, strong) UIColor *backgroundHighlightedColor;

@end
