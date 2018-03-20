//
//  HKMapView.m
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "HKMapView.h"

#import "HKMainAnnotation.h"
#import "HKOrderAnnotation.h"

#import "HKMainAnnotationView.h"
#import "HKOrderAnnotationView.h"

#import "GradientPolylineOverlay.h"
#import "GradientPolylineRenderer.h"

@interface HKMapView ()<MKMapViewDelegate,HKAnnotationViewDelegate>

@end

@implementation HKMapView 

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_9_0) {
            self.showsScale = YES;
            self.showsCompass = YES;
        }
        self.showsUserLocation = YES;
        self.mapType = MKMapTypeStandard;
        [[HKMapService sharedInstance] requestWhenInUseAuthorization];
    }
    return self;
}

#pragma mark - MapDelegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation*)location {
    [HKMapService sharedInstance].userLocation = location;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if ([self.hk_delegate respondsToSelector:@selector(locationSuccess)]) {
            [self.hk_delegate locationSuccess];
        }
    });
}

#pragma mark - HKAnnotationViewDelegate
- (void)annotationViewSelected:(HKAnnotationView *)annotationView {
    if ([self.hk_delegate respondsToSelector:@selector(mapViewOfAnnotationViewSelected:)]) {
        [self.hk_delegate mapViewOfAnnotationViewSelected:annotationView];
    }
}

- (void)annotationViewCanceled:(HKAnnotationView *)annotationView {
    if ([self.hk_delegate respondsToSelector:@selector(mapViewOfAnnotationViewCanceled:)]) {
        [self.hk_delegate mapViewOfAnnotationViewCanceled:annotationView];
    }
}

#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[MKUserLocation class]]) {
        MKAnnotationView *annotationView = (MKAnnotationView *)[HKAnnotationView annotationViewForMapView:self annotation:annotation];
        annotationView.image = [UIImage imageNamed:@"mark_user"];
        return annotationView;
    }
    if ([annotation isKindOfClass:[HKMainAnnotation class]]) {
        HKMainAnnotationView *annotationView = [HKMainAnnotationView annotationViewForMapView:self annotation:annotation];
        annotationView.delegate = self;
        annotationView.annotation = annotation;
        [HKAnnotationView startAnimatedWithView:annotationView anchorPoint:CGPointMake(0.5, 1)];
        return annotationView;
    }
    if ([annotation isKindOfClass:[HKOrderAnnotation class]]) {
        HKOrderAnnotationView *annotationView = [HKOrderAnnotationView annotationViewForMapView:self annotation:annotation];
        annotationView.delegate = self;
        annotationView.annotation = annotation;
        [HKAnnotationView startAnimatedWithView:annotationView anchorPoint:CGPointMake(0.5, 1)];
        return annotationView;
    }
    return nil;
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *render = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        render.lineWidth = 5;
        render.strokeColor =  [UIColor colorWithRed:68/255. green:180/255. blue:140/255. alpha:1.0];
        return render;
    }
    if ([overlay isKindOfClass:[GradientPolylineOverlay class]]) {
        GradientPolylineRenderer *polylineRenderer = [[GradientPolylineRenderer alloc] initWithOverlay:overlay];
        polylineRenderer.lineWidth = 8.f;
        return polylineRenderer;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if([view.annotation isKindOfClass:[HKAnnotation class]]) {
        HKAnnotation *poi = (HKAnnotation *)view.annotation;
        CGPoint centerPoint = [mapView convertCoordinate:mapView.centerCoordinate toPointToView:mapView];
        CGPoint point = [mapView convertCoordinate:poi.coordinate toPointToView:mapView];
        BOOL isChange = false;
        if(point.x < 10 * 2)
        {
            centerPoint.x -= 10 * 3;
            isChange = true;
        }
        else if(mapView.bounds.size.width - point.x < 10 * 2)
        {
            centerPoint.x += 10 * 3;
            isChange = true;
        }
        if(point.y < 10 * 10)
        {
            centerPoint.y -= 10 * 10 - point.y;
            isChange = true;
        }
        if(isChange)
        {
            CLLocationCoordinate2D coordinate = [mapView convertPoint:centerPoint toCoordinateFromView:mapView];
            [mapView setCenterCoordinate:coordinate animated:YES];
        }
    }
}

@end
