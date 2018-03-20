//
//  HKAnnotation.h
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HKAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
