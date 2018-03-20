//
//  HKMapView+ScaleAnimated.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/6.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKMapView.h"
#import "HKAnnotation.h"
#import "HKMapService.h"

@interface HKMapView (ScaleAnimated)

- (void)adjustMapViewCenterWithAnnotationViewCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;

- (void)zoomScale:(HKAnnotation *)annotation animated:(BOOL)animated;

@end
