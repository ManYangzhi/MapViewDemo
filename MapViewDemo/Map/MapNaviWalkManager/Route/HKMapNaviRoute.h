//
//  HKMapNaviRoute.h
//  MapViewDemo
//
//  Created by yangzhi on 2018/3/6.
//  Copyright © 2018年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HKMapNaviRoute : NSObject

///导航路径总长度(单位:米)
@property (nonatomic, assign) NSInteger routeLength;

///导航路径所需的时间(单位:秒)
@property (nonatomic, assign) NSInteger routeTime;

///导航路线
@property (nonatomic, copy) NSArray<MKPolyline *> *routePolylines;

@end
