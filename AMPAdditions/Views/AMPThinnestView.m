//
//  AMPDisclousure.h
//
//  Created by Alejandro Martinez on 05/04/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPThinnestView.h"
#import "AMPMacros.h"
#import "UIView+AMPAdditions.h"

@implementation AMPThinnestView

+ (AMPThinnestView *)horizontalAtBottomOfView:(UIView *)view withColor:(UIColor *)color {
    return [self horizontalView:view.width atY:view.bottom - pixelsToPoints(1.0f) withColor:color];
}

+ (AMPThinnestView *)horizontalView:(CGFloat)width atY:(CGFloat)y withColor:(UIColor *)color {
    AMPThinnestView *v = [[self alloc] initWithFrame:CGRectMake(0.0f, y, width, pixelsToPoints(1.0f))];
    [v setBackgroundColor:color];
    return v;
}

+ (AMPThinnestView *)horizontalView:(CGFloat)width atY:(CGFloat)y {
    return [self horizontalView:width atY:y withColor:[UIColor whiteColor]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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

- (void)commonInit {
    
}

@end
