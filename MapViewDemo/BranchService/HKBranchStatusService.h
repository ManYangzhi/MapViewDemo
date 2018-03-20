//
//  HKOutLetStatus.h
//  KoraApp
//
//  Created by yangzhi on 17/1/19.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HKMapService.h"
#import "HKEnumConstant.h"
#import "HKBranchStatusModel.h"
#import "HKMapNaviRoute.h"

@interface HKBranchStatusService : NSObject

- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model;
- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model type:(HKBranchType)type;
- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model vehicleOrderstatus:(HKVehicleOrderStatus)status;
- (instancetype)initWithBranchStatusModel:(HKBranchStatusModel *)model chargerOrderstatus:(HKChargerOrderStatus)status;

@property (nonatomic, assign, readonly) HKBranchType branchType;            //网点类型(租车、充电)

@property (nonatomic, assign, readonly) HKVehicleOrderStatus vehicleOrderStatus;    //车辆订单状态
@property (nonatomic, assign, readonly) HKChargerOrderStatus chargerOrderStatus;    //充电桩订单状态

@property (nonatomic, strong, readonly) HKBranchStatusModel *model;         //网点数据
@property (nonatomic, strong, readonly) MKUserLocation *userLocation;       //用户位置
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;  //网点经纬度

/** 路径规划相关信息 */
@property (nonatomic, strong) HKMapNaviRoute *route;                        //路径规划信息
@property (nonatomic, assign, readonly) CGFloat distance;                   //直线距离(用户位置与网点的直线距离)
@property (nonatomic, strong, readonly) NSString *walkDistance;             //步行距离
@property (nonatomic, strong, readonly) NSString *walkTime;                 //步行时间

@end
