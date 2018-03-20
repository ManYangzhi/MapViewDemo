//
//  HKNaviWalkManager.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/6.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class HKNaviWalkManager;
@class HKMapNaviRoute;

@protocol HKMapNaviWalkManagerDelegate <NSObject>
@optional

/**
 * @brief 发生错误时,会调用代理的此方法
 * @param walkManager 步行导航管理类
 * @param error 错误信息
 */
- (void)walkManager:(HKNaviWalkManager *)walkManager error:(NSError *)error;

/**
 * @brief 步行路径规划成功后的回调函数
 * @param walkManager 步行导航管理类
 */
- (void)walkManagerOnCalculateRouteSuccess:(HKNaviWalkManager *)walkManager;

/**
 * @brief 步行路径规划失败后的回调函数
 * @param walkManager 步行导航管理类
 * @param error 错误信息,error.code参照AMapNaviCalcRouteState
 */
- (void)walkManager:(HKNaviWalkManager *)walkManager onCalculateRouteFailure:(NSError *)error;

@end

@interface HKNaviWalkManager : NSObject

@property (nonatomic, weak) id<HKMapNaviWalkManagerDelegate>delegate;

@property (nonatomic, readonly) HKMapNaviRoute *naviRoute;

/**
 * @brief 带起点的步行路径规划
 * @param startPoint  起点坐标.
 * @param endPoint    终点坐标.
 */
- (void)calculateWalkRouteWithStartPoint:(CLLocationCoordinate2D)startPoint
                                endPoint:(CLLocationCoordinate2D)endPoint;

/** 取消路径规划 */
- (void)cancel;

@end
