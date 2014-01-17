//
//  MKMapView+AMPAdditions.m
//   
//
//  Created by Alejandro Martinez on 05/09/12.
//  Copyright (c) 2012 Alejandro Martinez. All rights reserved.
//

#import "MKMapView+AMPAdditions.h"

@implementation MKMapView (AMPAdditions)

const float defaultSpanValue = 0.01;

- (void)centerToCoordinate:(CLLocationCoordinate2D)coordinate withSpanValue:(CGFloat)span {
    [self centerToCoordinate:coordinate withSpanValue:span animated:NO];
}

- (void)centerToCoordinate:(CLLocationCoordinate2D)coordinate {
    [self centerToCoordinate:coordinate withSpanValue:defaultSpanValue animated:NO];
}

//
- (void)centerToCoordinate:(CLLocationCoordinate2D)coordinate withSpanValue:(CGFloat)span animated:(BOOL)animated {
    MKCoordinateSpan cSpan = MKCoordinateSpanMake(span, span);
    MKCoordinateRegion cRegion = MKCoordinateRegionMake(coordinate, cSpan);
    [self setRegion:cRegion animated:animated];
}

- (void)centerToCoordinates:(NSArray *)coordinates {
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(NSValue *value in coordinates) {
        CLLocationCoordinate2D coordinate = [value MKCoordinateValue];
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, coordinate.latitude);
        
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = (fabs(topLeftCoord.latitude - bottomRightCoord.latitude) + 0.01) * 1.2;
    region.span.longitudeDelta = (fabs(bottomRightCoord.longitude - topLeftCoord.longitude) + 0.01) * 1.2;
    
    region = [self regionThatFits:region];
    [self setRegion:region animated:YES];
}

- (void)centerToUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.155;
    span.longitudeDelta = 0.155;
    CLLocationCoordinate2D location;
    location.latitude = self.userLocation.coordinate.latitude;
    location.longitude = self.userLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [self setRegion:region animated:YES];
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
