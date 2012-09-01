//
//  UIImageView+AMPAdditions.m
//  walipa
//
//  Created by Alejandro Martinez on 01/09/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "UIImageView+AMPAdditions.h"

@implementation UIImageView (AMPAdditions)

- (void)makeCircleAndShadow {
    
    // need to make the operations in other imageview because the self.layer is readonly
    UIImageView *copy = [[UIImageView alloc] initWithFrame:self.bounds];
    copy.image = self.image;
    copy.highlightedImage = self.highlightedImage;
    
    // make new layer to contain shadow and masked image
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor randomColor].CGColor;
    containerLayer.shadowRadius = 2.0f;
    containerLayer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    containerLayer.shadowOpacity = 0.8f;
    
    // use the image's layer to mask the image into a circle
    copy.layer.cornerRadius = roundf(copy.frame.size.width/2.0);
    copy.layer.masksToBounds = YES;
    
    // add masked image layer into container layer so that it's shadowed
    [containerLayer addSublayer:copy.layer];
    
    // add container including masked image and shadow into original imageview
    //self.layer = containerLayer; READONLY!
    self.image = nil;
    self.highlightedImage = nil;
    [self.layer addSublayer:containerLayer];
}

@end
