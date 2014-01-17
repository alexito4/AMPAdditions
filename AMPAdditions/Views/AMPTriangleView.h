//
//  AMPTriangleView.h
//  AMPAdditions
//
//  Created by Alejandro Martinez on 01/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AMPTriangleViewDirections) {
    AMPTriangleViewDirectionsTop,    // ^
    AMPTriangleViewDirectionsBottom, // V
    AMPTriangleViewDirectionsLeft,   // <
    AMPTriangleViewDirectionsRight   // >
};

@interface AMPTriangleView : UIView

@property (nonatomic) AMPTriangleViewDirections direction;

@end
