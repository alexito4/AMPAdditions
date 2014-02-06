//
//  AMPDisclousure.h
//
//  Created by Alejandro Martinez on 02/04/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPDisclousure.h"

@implementation AMPDisclousure

- (id)init {
    return [self initWithFrame:CGRectMake(0.0f, 0.0f, 6.0f, 15.0f)];
}

- (AMPTriangleDirection)defaultDirection {
    return AMPTriangleDirectionRight;
}

- (CGFloat)inset {
    return 1.0f;
}

- (CGFloat)strokeWidth {
    return 2.0f;
}

- (BOOL)shouldFill {
    return NO;
}

@end
