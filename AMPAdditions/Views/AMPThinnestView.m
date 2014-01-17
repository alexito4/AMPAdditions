//
//  AMPDisclousure.h
//
//  Created by Alejandro Martinez on 05/04/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPThinnestView.h"

@implementation AMPThinnestView

+ (AMPThinnestView *)horizontalView:(CGFloat)width atY:(CGFloat)y withColor:(UIColor *)color {
    AMPThinnestView *v = [[self alloc] initWithFrame:CGRectMake(0.0f, y, width, 1.0f/[UIScreen mainScreen].scale)];
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
