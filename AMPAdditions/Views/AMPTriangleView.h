//
//  AMPTriangleView.h
//  AMPAdditions
//
//  Created by Alejandro Martinez on 01/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AMPTriangleDirection) {
    AMPTriangleDirectionTop,    // ^
    AMPTriangleDirectionBottom, // V
    AMPTriangleDirectionLeft,   // <
    AMPTriangleDirectionRight   // >
};

@interface AMPTriangleView : UIView

@property (nonatomic) AMPTriangleDirection direction;

@property (nonatomic, readonly) CGFloat inset;
@property (nonatomic, readonly) BOOL shouldFill;
@property (nonatomic, readonly) CGFloat strokeWidth;

@end
