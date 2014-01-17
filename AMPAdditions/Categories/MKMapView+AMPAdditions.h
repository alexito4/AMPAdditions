//
//  MKMapView+AMPAdditions.h
//   
//
//  Created by Alejandro Martinez on 05/09/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (AMPAdditions)

- (void)centerToCoordinate:(CLLocationCoordinate2D)coordinate withSpanValue:(CGFloat)span;
- (void)centerToCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)centerToCoordinate:(CLLocationCoordinate2D)coordinate withSpanValue:(CGFloat)span animated:(BOOL)animated;

- (void)centerToCoordinates:(NSArray *)coordinates;

- (void)centerToUserLocation;

- (void)centerToFitAllAnnotations;

@end
