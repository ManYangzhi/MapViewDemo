//
//  HKMapView.h
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <MapKit/MapKit.h>

@class HKAnnotationView;
@class HKBranchStatusService;

@protocol HKMapViewDelegate <NSObject>
@required
/** 定位成功 */
- (void)locationSuccess;

@optional
/** 选中 mark */
- (void)mapViewOfAnnotationViewSelected:(HKAnnotationView *)annotationView;

/** mark 取消选中 */
- (void)mapViewOfAnnotationViewCanceled:(HKAnnotationView *)annotationView;
@end

@interface HKMapView : MKMapView

@property (nonatomic, assign) id<HKMapViewDelegate>hk_delegate;

@end
