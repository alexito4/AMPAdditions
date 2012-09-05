//
//  MKMapView+AMPAdditions.m
//  walipa
//
//  Created by Alejandro Martinez on 05/09/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "MKMapView+AMPAdditions.h"

@implementation MKMapView (AMPAdditions)

const float defaultSpanValue = 0.01;

- (void)centerToCoordinates:(CLLocationCoordinate2D)coordinates withSpanValue:(CGFloat)span {
    [self centerToCoordinates:coordinates withSpanValue:span animated:NO];
}

- (void)centerToCoordinates:(CLLocationCoordinate2D)coordinates {
    [self centerToCoordinates:coordinates withSpanValue:defaultSpanValue animated:NO];
}

//
- (void)centerToCoordinates:(CLLocationCoordinate2D)coordinates withSpanValue:(CGFloat)span animated:(BOOL)animated {
    MKCoordinateSpan cSpan = MKCoordinateSpanMake(span, span);
    MKCoordinateRegion cRegion = MKCoordinateRegionMake(coordinates, cSpan);
    [self setRegion:cRegion animated:animated];
}

@end
