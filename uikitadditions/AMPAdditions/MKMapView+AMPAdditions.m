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

- (void)centerToFitAllAnnotations {
    if ([self.annotations count] == 0)
        return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in self.annotations) {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = (fabs(topLeftCoord.latitude - bottomRightCoord.latitude) + 0.01) * 1.1; 
    region.span.longitudeDelta = (fabs(bottomRightCoord.longitude - topLeftCoord.longitude) + 0.01) * 1.1;
    
    region = [self regionThatFits:region];
    [self setRegion:region animated:YES];
}

@end
