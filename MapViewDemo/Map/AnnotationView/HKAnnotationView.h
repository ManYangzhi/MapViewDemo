//
//  HKAnnotationView.h
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import <MapKit/MapKit.h>

@class HKAnnotationView;

@protocol HKAnnotationViewDelegate <NSObject>
@optional
/** 气泡被选中 */
- (void)annotationViewSelected:(HKAnnotationView *)annotationView;

/** 气泡取消选中 */
- (void)annotationViewCanceled:(HKAnnotationView *)annotationView;

/** 点击气泡弹出的view */
- (void)annotationPopViewSelected:(HKAnnotationView *)annotationView;
@end

@interface HKAnnotationView : MKAnnotationView

@property (nonatomic, weak) id<HKAnnotationViewDelegate>delegate;

+ (void)startAnimatedWithView:(UIView *)view anchorPoint:(CGPoint)anchorPoint;
+ (instancetype)annotationViewForMapView:(MKMapView *)mapView annotation:(id<MKAnnotation>)annotation;

- (void)showAnnotationPopView;
- (void)hideAnnotationPopView;

@end
