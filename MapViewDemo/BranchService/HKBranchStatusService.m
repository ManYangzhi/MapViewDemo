//
//  HKOutLetStatus.m
//  KoraApp
//
//  Created by yangzhi on 17/1/19.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "HKBranchStatusService.h"

@implementation HKBranchStatusService

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model {
    return [self initWithBranchStatusModel:model type:HKBranchTypeVehicle];
}

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model type:(HKBranchType)type {
    if (self = [super init]) {
        _branchType = type;
        _model = model;
    }
    return self;
}

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model vehicleOrderstatus:(HKVehicleOrderStatus)status {
    if (self = [super init]) {
        _vehicleOrderStatus = status;
        _model = model;
    }
    return self;
}

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model chargerOrderstatus:(HKChargerOrderStatus)status {
    if (self = [super init]) {
        _chargerOrderStatus = status;
        _model = model;
    }
    return self;
}

- (MKUserLocation *)userLocation {
    return [HKMapService sharedInstance].userLocation;
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.model.latitude floatValue], [self.model.longitude floatValue]);
}

- (NSString *)walkDistance {
    NSInteger distance = self.route.routeLength;
    if(distance < 1000) return [NSString stringWithFormat:@"距离约%ld米",(long)distance];
    return [NSString stringWithFormat:@"距离约%ld公里",(long)distance / 1000];
}

- (NSString *)walkTime {
    if (self.route.routeTime < 60) return @"步行约1分钟";
    return [NSString stringWithFormat:@"步行约%ld分钟",(long)self.route.routeTime / 60];
}

- (CGFloat)distance {
    return [[HKMapService sharedInstance] getDistance:CLLocationCoordinate2DMake([_model.latitude floatValue], [_model.longitude floatValue])];
}

@end
