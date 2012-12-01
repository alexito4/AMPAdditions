//
//  UIView+Additions.h
//  UIKit Additions
//
//  Created by Alejandro Martínez on 19/03/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AMPAdditions)

- (void)removeAllSubviews;

// Frame manipulation
@property CGPoint position;
@property CGFloat x;
@property CGFloat y;
@property CGFloat left; // = x
@property CGFloat right;
@property CGFloat top; // = y
@property CGFloat bottom;

@property CGFloat centerX;
@property CGFloat centerY;

@property CGSize size;
@property CGFloat width;
@property CGFloat height;

@end
