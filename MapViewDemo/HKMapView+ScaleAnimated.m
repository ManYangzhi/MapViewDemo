//
//  HKMapView+ScaleAnimated.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/6.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKMapView+ScaleAnimated.h"

@implementation HKMapView (ScaleAnimated)

- (void)adjustMapViewCenterWithAnnotationViewCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated {
    [self setCenterCoordinate:coordinate animated:animated];
}

- (void)zoomScale:(HKAnnotation *)annotation animated:(BOOL)animated {
    if ([[HKMapService sharedInstance] getDistance:annotation.coordinate] < 800 || !annotation)
    {
        if (self.userLocation.coordinate.latitude > 0) {
            MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
            MKCoordinateRegion region = MKCoordinateRegionMake(self.userLocation.coordinate, span);
            [self setRegion:region animated:animated];
        }
    }
    else
    {
        CLLocationCoordinate2D coordinates[3];
        coordinates[0] = self.userLocation.coordinate;
        CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(annotation.coordinate.latitude, annotation.coordinate.longitude);
        coordinates[1] = coor;
        
        CGPoint a = [self convertCoordinate:coordinates[0] toPointToView:self];
        CGPoint b = [self convertCoordinate:coordinates[1] toPointToView:self];
        CGPoint c = CGPointMake(a.x * 2 - b.x,a.y * 2 - b.y);
        
        CLLocationCoordinate2D coorC = [self convertPoint:c toCoordinateFromView:self];
        coordinates[2] = coorC;
        
        MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:3];
        [self zoomToPolyLine:self polyline:polyline animated:animated];
    }
}
    
-(void)zoomToPolyLine:(MKMapView*)map polyline: (MKPolyline*)polyline animated: (BOOL)animated {
    [map setVisibleMapRect:[polyline boundingMapRect] edgePadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) animated:animated];
}


@end
