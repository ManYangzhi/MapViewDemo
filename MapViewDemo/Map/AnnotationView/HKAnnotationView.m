//
//  HKAnnotationView.m
//  KoraApp
//
//  Created by yangzhi on 17/1/11.
//  Copyright © 2017年 Neusoft. All rights reserved.
//

#import "HKAnnotationView.h"

@interface HKAnnotationView ()

@end

@implementation HKAnnotationView

+ (void)startAnimatedWithView:(UIView *)view anchorPoint:(CGPoint)anchorPoint {
    view.layer.anchorPoint = anchorPoint;
    view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView animateWithDuration:0.25 animations:^{
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.98, 0.98);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            }];
        }];
    }];
}

+ (instancetype)annotationViewForMapView:(MKMapView *)mapView annotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = nil;
    identifier = NSStringFromClass([self class]);
    Class className = NSClassFromString(identifier);
    if (className) {
        id instance = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!instance) {
            instance = [[className alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        return instance;
    }
    return nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if(self.selected == selected) return;
    if (selected)
    {
        if ([self.delegate respondsToSelector:@selector(annotationViewSelected:)]) {
            [self.delegate annotationViewSelected:self];
        }
    }
    else
    {
        if ([self.delegate respondsToSelector:@selector(annotationViewCanceled:)]) {
            [self.delegate annotationViewCanceled:self];
        }
    }
    [super setSelected:selected animated:animated];
}

- (void)showAnnotationPopView {
    //subclass TODO..
}

- (void)hideAnnotationPopView {
    //subclass TODO..
}

@end
