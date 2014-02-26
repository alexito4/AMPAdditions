//
//  UIView+Additions.h
//  UIKit Additions
//
//  Created by Alejandro Martínez on 19/03/12.
//  Copyright (c) 2012 Alejandro Martínez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (AMPAdditions)

// Helper methods
- (void)removeAllSubviews;

/**
 *
 *  @param touch <#touch description#>
 *  @param view  Usually a subivew of self
 *
 *  @return Returns YES if the touch was inside the view.
 */
- (BOOL)touch:(UITouch *)touch insideView:(UIView *)view;
- (void)makeCircle;

// Gradients
- (void)setBackgroundGradient:(CAGradientLayer *)gradient;
- (void)setBackgroundGradientWithTopColor:(UIColor *)top bottomColor:(UIColor *)bottom;

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

@property (nonatomic, readonly) CGFloat midX;
@property (nonatomic, readonly) CGFloat midY;

@property CGSize size;
@property CGFloat width;
@property CGFloat height;

@end
