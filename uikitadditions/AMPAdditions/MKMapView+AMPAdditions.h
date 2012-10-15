//
//  MKMapView+AMPAdditions.h
//  walipa
//
//  Created by Alejandro Martinez on 05/09/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (AMPAdditions)

- (void)centerToCoordinates:(CLLocationCoordinate2D)coordinates withSpanValue:(CGFloat)span;
- (void)centerToCoordinates:(CLLocationCoordinate2D)coordinates;
- (void)centerToCoordinates:(CLLocationCoordinate2D)coordinates withSpanValue:(CGFloat)span animated:(BOOL)animated;

- (void)centerToFitAllAnnotations;

@end
