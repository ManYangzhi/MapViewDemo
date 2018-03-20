//
//  HKOrderBranchStatusService.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/16.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKOrderBranchStatusService.h"

@interface HKOrderBranchStatusService ()

@end

@implementation HKOrderBranchStatusService

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model vehicleOrderstatus:(HKVehicleOrderStatus)status {
    self = [super initWithBranchStatusModel:model vehicleOrderstatus:status];
    if (self) {
        switch (status)
        {
            case HKVehicleOrderStatusBooking:
                _imageName = @"mark_qu";
                break;
            case HKVehicleOrderStatusUsing:
                _imageName = @"mark_car";
                break;
            case HKVehicleOrderStatusToBePaid:
                _imageName = @"mark_huan";
                break;
            default:
                _imageName = nil;
                break;
        }
    }
    return self;
}

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model chargerOrderstatus:(HKChargerOrderStatus)status {
    self = [super initWithBranchStatusModel:model chargerOrderstatus:status];
    if (self) {
        switch (status)
        {
            case HKChargerOrderStatusBooking:
                _imageName = @"mark_charger";
                break;
            case HKChargerOrderStatusUsing:
                _imageName = @"mark_charger";
                break;
            case HKChargerOrderStatusStop:
                _imageName = @"mark_charger";
                break;
            case HKChargerOrderStatusToBePaid:
                _imageName = @"mark_charger";
                break;
            default:
                _imageName = nil;
                break;
        }
    }
    return self;
}

@end
