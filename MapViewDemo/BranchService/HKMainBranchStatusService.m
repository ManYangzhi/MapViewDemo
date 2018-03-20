//
//  HKMapViewBranchStatusService.m
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/16.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import "HKMainBranchStatusService.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface HKMainBranchStatusService ()

@end

@implementation HKMainBranchStatusService

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model type:(HKBranchType)type {
    self = [super initWithBranchStatusModel:model type:type];
    if (self) {
        switch ([self.model.status integerValue]) {
            case HKBranchStatusBuild:
                [self setOutLetStatusBuild];
                break;
            case HKBranchStatusMaintain:
                [self setOutLetStatusMaintain];
                break;
            case HKBranchStatusRun:
                [self setOutLetStatusRun];
                break;
            case HKBranchStatusDis:
                [self setOutLetStatusDis];
                break;
        }
    }
    return self;
}

- (void)setOutLetStatusBuild {
    _status         = HKBranchStatusBuild;
    _title          = @"兴建中";
    _imageName      = @"mark_gray";
    _color          = UIColorFromRGB(0x999999);
}

- (void)setOutLetStatusMaintain {
    _status         = HKBranchStatusMaintain;
    _title          = @"维护中";
    _imageName      = @"mark_gray";
    _color          = UIColorFromRGB(0x999999);
}

- (void)setOutLetStatusDis {
    _status         = HKBranchStatusDis;
    _title          = @"禁用中";
    _imageName      = @"mark_gray";
    _color          = UIColorFromRGB(0x999999);
}

- (void)setOutLetStatusRun {
    [self.model.onlineType integerValue] == 1 ? [self setOutLetStatusOnLine] : [self setOutLetStatusUnOnline];
}

- (void)setOutLetStatusOnLine {
    self.branchType == HKBranchTypeCharger ? [self chargerSearchModel] : [self carSearchModel];
}

- (void)chargerSearchModel {
    _status         = HKBranchStatusRun;
    _title          = nil;
    _imageName      = @"mark_green";
    _color          = UIColorFromRGB(0x1fa67b);
}

- (void)carSearchModel {
    [self.model.returnFlag integerValue] == 1 ? [self returnUnisonant] : [self returnAnyWhere];
}

- (void)setOutLetStatusUnOnline {
    _status         = HKBranchStatusUnOnline;
    _title          = @"未联网";
    _imageName      = @"mark_gray";
    _color          = UIColorFromRGB(0x999999);
}

- (void)returnAnyWhere {
    _title          = @"任异还";
    _imageName      = @"mark_blue";
    _color          = [UIColor colorWithRed:40/255.0 green:122/255.0 blue:199/255.0 alpha:1.0];
}

- (void)returnUnisonant {
    _title          = @"同点还";
    _imageName      = @"mark_green";
    _color          = UIColorFromRGB(0x1fa67b);
}

- (NSString *)suffix {
    return self.branchType == HKBranchTypeVehicle ? @"辆可用" : @"个可用";
}

- (NSString *)avaliableCount {
    if (_avaliableCount) return _avaliableCount;
    return self.branchType == HKBranchTypeVehicle ? self.model.carportTotalCount : self.model.lot;
}

@end
