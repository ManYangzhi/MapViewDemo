//
//  HKMapService.m
//  KoraApp
//
//  Created by yangzhi on 17/1/16.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "HKMapService.h"

static HKMapService *mapService = nil;

@interface HKMapService ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation HKMapService

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mapService = [[HKMapService alloc]init];
    });
    return mapService;
}

- (void)requestWhenInUseAuthorization {
    if(![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (double)getDistance:(CLLocationCoordinate2D)location {
    CLLocation *midLocation = [[CLLocation alloc]initWithLatitude:location.latitude longitude:location.longitude];
    return [self.userLocation.location distanceFromLocation:midLocation];
}

#pragma mark - getter
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

@end
