//
//  HKMapService.h
//  KoraApp
//
//  Created by yangzhi on 17/1/16.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HKMapService : NSObject

+ (instancetype)sharedInstance;

@property(nonatomic, strong) MKUserLocation *userLocation;

- (void)requestWhenInUseAuthorization;

- (double)getDistance:(CLLocationCoordinate2D)location;

@end
