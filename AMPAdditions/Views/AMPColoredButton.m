//
//  AMPColoredButton.m
//  AMPAdditions
//
//  Created by Alejandro Martínez on 25/10/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import "AMPColoredButton.h"

#define GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(PROPERTY, TYPE, SETTER) \
- (void)SETTER:(TYPE)PROPERTY { \
if (_##PROPERTY != PROPERTY) { \
_##PROPERTY = PROPERTY; \
[self updateStyle]; \
} \
}

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
    _backgroundNormalColor = self.backgroundColor;
    _borderNormalColor = [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)didMoveToWindow {
    if (self.window) {
        [self updateStyle];
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    [self updateStyle];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self updateStyle];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    [self updateStyle];
}

- (void)updateStyle {
    if (!self.enabled) {
        if (self.backgroundDisabledColor) {
            [self setBackgroundColor:self.backgroundDisabledColor];
        }
        if (self.borderDisabledColor) {
            [self.layer setBorderColor:self.borderDisabledColor.CGColor];
        }
    }
    else if (self.selected) {
        if (self.backgroundSelectedColor) {
            [self setBackgroundColor:self.backgroundSelectedColor];
        }
        if (self.borderSelectedColor) {
            [self.layer setBorderColor:self.borderSelectedColor.CGColor];
        }
    }
    else if (self.highlighted) {
        if (self.backgroundHighlightedColor) {
            [self setBackgroundColor:self.backgroundHighlightedColor];
        }
        if (self.borderHighlightedColor) {
            [self.layer setBorderColor:self.borderHighlightedColor.CGColor];
        }
    }
    else {
        [self setBackgroundColor:self.backgroundNormalColor];
        [self.layer setBorderColor:self.borderNormalColor.CGColor];
    }
}

#pragma mark - Custom Setter

GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(backgroundNormalColor, UIColor *, setBackgroundNormalColor);
GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(backgroundHighlightedColor, UIColor *, setBackgroundHighlightedColor);
GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(backgroundSelectedColor, UIColor *, setBackgroundSelectedColor);
GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(backgroundDisabledColor, UIColor *, setBackgroundDisabledColor);

GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(borderNormalColor, UIColor *, setBorderNormalColor);
GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(borderDisabledColor, UIColor *, setBorderDisabledColor);
GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(borderHighlightedColor, UIColor *, setBorderHighlightedColor);
GENERATE_AMPColoredButton_UPDATESTYLE_SETTER(borderSelectedColor, UIColor *, setBorderSelectedColor);

@end
