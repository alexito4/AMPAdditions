//
//  SColoredButton.m
//  AMPAdditions
//
//  Created by Alejandro Martínez on 25/10/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import "AMPColoredButton.h"

@implementation AMPColoredButton

#pragma mark - Init

- (id)init {
    self = [super init];
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

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self addTarget:self action:@selector(didTap:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(didUntap:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(didUntap:) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        [self setAlpha:1.0];
    } else {
        [self setAlpha:0.8];
    }
}

#pragma mark - Custom Setter

- (void)setBackgroundNormalColor:(UIColor *)backgroundNormalColor {
    [self setBackgroundColor:backgroundNormalColor];
    _backgroundNormalColor = backgroundNormalColor;
}

#pragma mark - Actions

- (void)didTap:(UIButton *)sender {
    [self setBackgroundColor:_backgroundHighlightedColor];
}

- (void)didUntap:(UIButton *)sender {
    [self setBackgroundColor:_backgroundNormalColor];
}

@end
