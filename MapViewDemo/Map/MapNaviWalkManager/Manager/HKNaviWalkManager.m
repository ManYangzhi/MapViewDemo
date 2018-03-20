//
//  HKNaviWalkManager.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/6.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKNaviWalkManager.h"
#import "HKMapNaviRoute.h"
#import <MapKit/MapKit.h>

@interface HKNaviWalkManager ()

@property (nonatomic, readwrite) HKMapNaviRoute *naviRoute;
@property (nonatomic, strong) MKDirections *directions;

@end

@implementation HKNaviWalkManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.naviRoute = [[HKMapNaviRoute alloc]init];
    }
    return self;
}

- (void)calculateWalkRouteWithStartPoint:(CLLocationCoordinate2D)startPoint endPoint:(CLLocationCoordinate2D)endPoint {
    MKPlacemark *fromPlace = [[MKPlacemark alloc] initWithCoordinate:startPoint addressDictionary:nil];
    MKPlacemark *toPlace = [[MKPlacemark alloc]initWithCoordinate:endPoint addressDictionary:nil];
    
    MKMapItem *fromItem = [[MKMapItem alloc]initWithPlacemark:fromPlace];
    MKMapItem *toItem = [[MKMapItem alloc]initWithPlacemark:toPlace];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    request.source = fromItem;
    request.destination = toItem;
    request.requestsAlternateRoutes = YES;

    self.directions = [[MKDirections alloc]initWithRequest:request];
    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            if ([self.delegate respondsToSelector:@selector(walkManager:error:)]) {
                [self.delegate walkManager:self error:error];
            }
        }
        else {
            [self calculateSuccess:response];
        }
    }];
}

- (void)calculateSuccess:(MKDirectionsResponse *)response {
    MKRoute *route = response.routes[0];
    NSArray *stepArray = [NSArray arrayWithArray:route.steps];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < stepArray.count; i++) {
        MKRouteStep *step = stepArray[i];
        [arrayM addObject:step.polyline];
    }
    
    self.naviRoute.routeLength = route.distance;
    self.naviRoute.routeTime = route.expectedTravelTime;
    self.naviRoute.routePolylines = arrayM;
    
    if ([self.delegate respondsToSelector:@selector(walkManagerOnCalculateRouteSuccess:)]) {
        [self.delegate walkManagerOnCalculateRouteSuccess:self];
    }
}

- (void)cancel {
    [self.directions cancel];
}

@end
